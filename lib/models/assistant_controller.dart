import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'assistant_state.dart';
import 'fluid.dart';
import 'item.dart';
import 'item_type.dart';
import 'machine.dart';
import 'resource.dart';
import 'tool.dart';

/// The state provider for this assistant.
final assistantControllerProvider =
    StateNotifierProvider<AssistantController, AssistantState>((ref) {
  return AssistantController(
    const AssistantState(
        finalResources: [], availableTools: [], availableMachines: []),
  );
});

/// A class that controls how state is updated and managed for this assistant.
class AssistantController extends StateNotifier<AssistantState> {
  AssistantController(
    AssistantState state,
  ) : super(state);

  /// Attempt to add a new resource to the final resources list.
  void addFinalResource(Resource resource) {
    // Only update if the list does not contain that resource
    if (state.finalResources.contains(resource)) {
      return;
    }

    state = state.copyWith(finalResources: [...state.finalResources, resource]);
  }

  /// Attempt to add a new [Item] to the final resources list by name.
  void addFinalItemByName(String itemName) {
    addFinalResource(items.firstWhere((item) => item.name == itemName,
        orElse: () => Item(name: '', type: ItemType.material)));
  }

  /// Attempt to add a new [Fluid] to the final resources list by name.
  void addFinalFluidByName(String fluidName) {
    addFinalResource(fluids.firstWhere((fluid) => fluid.name == fluidName,
        orElse: () => Fluid(name: '')));
  }

  /// Attempt to remove a [Resource] from the final resources list by name.
  void removeFinalResourceByName(String resourceName) {
    state = state.copyWith(
        finalResources: state.finalResources
          ..remove(state.finalResources.firstWhere(
              (resource) => resource.name == resourceName,
              orElse: () => Fluid(name: ''))));
  }

  /// Attempt to add a new [Tool] to the available tools list by name.
  void addAvailableToolByName(String toolName) {
    try {
      state = state.copyWith(availableTools: [
        ...state.availableTools,
        Tool.values.firstWhere((tool) => tool.value == toolName)
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
        machines.firstWhere((machine) => machine.name == machineName)
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
}
