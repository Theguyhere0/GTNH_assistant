import 'package:flutter/material.dart';

import 'fluid.dart';
import 'item.dart';
import 'itemstack.dart';
import 'machine.dart';
import 'recipe.dart';
import 'resource.dart';
import 'tool.dart';

/// The top level metadata for the assistant.
@immutable
class AssistantState {
  /// The [Fluid]s that will always be the final node in the crafting tree.
  final List<Fluid> finalFluids;

  /// The [Item]s that will always be the final node in the crafting tree.
  final List<Item> finalItems;

  /// The [Tool]s that are available to use for crafting.
  final List<Tool> availableTools;

  /// The [Machine]s that are available to use for crafting.
  final List<Machine> availableMachines;

  /// The list of [Recipe]s needed to craft the [Resource] of interest.
  final List<Recipe> craftingSteps;

  /// The list of [Itemstack]s needed in the BOM.
  final List<Itemstack> bom;

  const AssistantState({
    required this.finalFluids,
    required this.finalItems,
    required this.availableTools,
    required this.availableMachines,
    required this.craftingSteps,
    required this.bom,
  });

  AssistantState copyWith({
    List<Fluid>? finalFluids,
    List<Item>? finalItems,
    List<Tool>? availableTools,
    List<Machine>? availableMachines,
    List<Recipe>? craftingSteps,
    List<Itemstack>? bom,
  }) {
    return AssistantState(
      finalFluids: finalFluids ?? this.finalFluids,
      finalItems: finalItems ?? this.finalItems,
      availableTools: availableTools ?? this.availableTools,
      availableMachines: availableMachines ?? this.availableMachines,
      craftingSteps: craftingSteps ?? this.craftingSteps,
      bom: bom ?? this.bom,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AssistantState &&
        other.finalFluids == finalFluids &&
        other.finalItems == finalItems &&
        other.availableTools == availableTools &&
        other.availableMachines == availableMachines &&
        other.craftingSteps == craftingSteps &&
        other.bom == bom;
  }

  @override
  int get hashCode {
    return finalFluids.hashCode ^
        finalItems.hashCode ^
        availableTools.hashCode ^
        availableMachines.hashCode ^
        craftingSteps.hashCode ^
        bom.hashCode;
  }
}
