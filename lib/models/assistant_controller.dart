import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'assistant_state.dart';
import 'fluid.dart';
import 'item.dart';
import 'itemstack.dart';
import 'machine.dart';
import 'recipe.dart';
import 'resource.dart';
import 'tool.dart';

/// The state provider for this assistant.
final assistantControllerProvider =
    StateNotifierProvider<AssistantController, AssistantState>((ref) {
  return AssistantController(const AssistantState(
    finalFluids: [],
    finalItems: [],
    availableTools: [],
    availableMachines: [],
    craftingSteps: [],
    bom: [],
  ));
});

/// A class that controls how state is updated and managed for this assistant.
class AssistantController extends StateNotifier<AssistantState> {
  AssistantController(
    AssistantState state,
  ) : super(state);

  /// Attempt to add a new [Item] to the final items list by name.
  void addFinalItemByName(String itemName) {
    try {
      state = state.copyWith(finalItems: [
        ...state.finalItems,
        Item.values.firstWhere((item) => item.name == itemName)
      ]);
    } on StateError {
      return;
    }
  }

  /// Attempt to remove an [Item] from the final items list by name.
  void removeFinalItemByName(String itemName) {
    try {
      state = state.copyWith(
          finalItems: state.finalItems
            ..remove(
                state.finalItems.firstWhere((item) => item.name == itemName)));
    } on StateError {
      return;
    }
  }

  /// Attempt to add a new [Fluid] to the final fluids list by name.
  void addFinalFluidByName(String fluidName) {
    try {
      state = state.copyWith(finalFluids: [
        ...state.finalFluids,
        Fluid.values.firstWhere((fluid) => fluid.name == fluidName)
      ]);
    } on StateError {
      return;
    }
  }

  /// Attempt to remove a [Fluid] from the final fluids list by name.
  void removeFinalFluidByName(String fluidName) {
    try {
      state = state.copyWith(
          finalFluids: state.finalFluids
            ..remove(state.finalFluids
                .firstWhere((fluid) => fluid.name == fluidName)));
    } on StateError {
      return;
    }
  }

  /// Attempt to add a new [Tool] to the available tools list by name.
  void addAvailableToolByName(String toolName) {
    try {
      state = state.copyWith(availableTools: [
        ...state.availableTools,
        Tool.values.firstWhere((tool) => tool.name == toolName)
      ]);
    } on StateError {
      return;
    }
  }

  /// Attempt to remove a [Tool] from the available tools list by name.
  void removeAvailableToolByName(String toolName) {
    try {
      state = state.copyWith(
          availableTools: state.availableTools
            ..remove(state.availableTools
                .firstWhere((tool) => tool.name == toolName)));
    } on StateError {
      return;
    }
  }

  /// Attempt to add a new [Machine] to the available machines list by name.
  void addAvailableMachineByName(String machineName) {
    try {
      state = state.copyWith(availableMachines: [
        ...state.availableMachines,
        Machine.values.firstWhere((machine) => machine.name == machineName)
      ]);
    } on StateError {
      return;
    }
  }

  /// Attempt to remove a [Machine] from the available machines list by name.
  void removeAvailableMachineByName(String machineName) {
    try {
      state = state.copyWith(
          availableMachines: state.availableMachines
            ..remove(state.availableMachines
                .firstWhere((machine) => machine.name == machineName)));
    } on StateError {
      return;
    }
  }

  /// Attempt to generate the crafting steps and BOM from the specified [Resource] name.
  void craftResource(String resourceName) {
    // Filter recipes for ones available with factory assets
    List<Recipe> reduced = recipes.where((recipe) {
      for (var tool in recipe.tools) {
        if (!state.availableTools.contains(tool)) {
          return false;
        }
      }
      return true;
    }).where((recipe) {
      for (var machine in recipe.machines) {
        if (!state.availableMachines.contains(machine)) {
          return false;
        }
      }
      return true;
    }).toList();

    // Start crafting
    List<Recipe> newCraftingSteps = [];
    List<Itemstack> newBom = [];
    if (Item.values.any((item) => item.name == resourceName)) {
      _continueCrafting(
        Item.values.firstWhere((item) => item.name == resourceName),
        1,
        false,
        1,
        reduced,
        newCraftingSteps,
        newBom,
      );
    } else if (Fluid.values.any((fluid) => fluid.name == resourceName)) {
      _continueCrafting(
        Fluid.values.firstWhere((fluid) => fluid.name == resourceName),
        1,
        false,
        1,
        reduced,
        newCraftingSteps,
        newBom,
      );
    }

    state = state.copyWith(
      craftingSteps: newCraftingSteps,
      bom: newBom,
    );
  }

  void _continueCrafting(
    Resource resource,
    int multiplier,
    bool predicted,
    int depthCounter,
    List<Recipe> reduced,
    List<Recipe> newCraftingSteps,
    List<Itemstack> newBom,
  ) {
    // Abort if the depth exceeds 20
    if (depthCounter > 20) {
      return;
    }

    // Get optimal recipe and output quantity
    Recipe bestRecipe;
    double outputQuantity = 0;

    if (resource is Item) {
      List<Recipe> temp = reduced
          .where((recipe) => recipe.itemOutputs.containsKey(resource))
          .toList()
        ..sort((a, b) => a.efficiencyRank.compareTo(b.efficiencyRank));

      // Final
      if (state.finalItems.contains(resource) || temp.isEmpty) {
        _addToBom(resource, multiplier, predicted, newBom);
        return;
      }

      // Not final
      bestRecipe = temp.first;
      bestRecipe.itemOutputs.forEach((item, quantity) {
        if (item == resource) {
          outputQuantity += quantity;
          predicted |= quantity < 1;
        }
      });
    } else if (resource is Fluid) {
      List<Recipe> temp = reduced
          .where((recipe) => recipe.fluidOutputs.containsKey(resource))
          .toList()
        ..sort((a, b) => a.efficiencyRank.compareTo(b.efficiencyRank));

      // Final
      if (state.finalFluids.contains(resource) || temp.isEmpty) {
        _addToBom(resource, multiplier, predicted, newBom);
        return;
      }

      // Not final
      bestRecipe = temp.first;
      bestRecipe.fluidOutputs.forEach((fluid, quantity) {
        if (fluid == resource) {
          outputQuantity += quantity;
          predicted |= quantity < 1;
        }
      });
    } else {
      return;
    }

    // Add recipe to crafting steps if not already in
    if (!newCraftingSteps.contains(bestRecipe)) {
      newCraftingSteps.add(bestRecipe);
    }

    // Continue crafting for children
    if (bestRecipe.energyInput > 0) {
      _addToBom(
          null,
          (bestRecipe.energyInput * multiplier / outputQuantity).ceil(),
          false,
          newBom);
    }
    bestRecipe.resourceInputs.forEach((resource, quantity) {
      _continueCrafting(
        resource,
        (quantity * multiplier / outputQuantity).ceil(),
        predicted,
        depthCounter + 1,
        reduced,
        newCraftingSteps,
        newBom,
      );
    });
  }

  void _addToBom(Resource? resource, int quantity, bool predicted,
      List<Itemstack> newBom) {
    // Already in BOM
    try {
      newBom.firstWhere((itemstack) => itemstack.resource == resource)
        ..quantity += quantity
        ..predicted |= predicted;
    }

    // Not in BOM
    on StateError {
      newBom.add(Itemstack(
          resource: resource, quantity: quantity, predicted: predicted));
    }
  }
}
