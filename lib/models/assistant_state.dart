import 'package:flutter/material.dart';

import 'machine.dart';
import 'resource.dart';
import 'tool.dart';

/// The top level metadata for the assistant.
@immutable
class AssistantState {
  /// The [Resource]s that will always be the final node in the crafting tree.
  final List<Resource> finalResources;

  /// The [Tool]s that are available to use for crafting.
  final List<Tool> availableTools;

  /// The [Machine]s that are available to use for crafting.
  final List<Machine> availableMachines;

  const AssistantState({
    required this.finalResources,
    required this.availableTools,
    required this.availableMachines,
  });

  AssistantState copyWith({
    List<Resource>? finalResources,
    List<Tool>? availableTools,
    List<Machine>? availableMachines,
  }) {
    return AssistantState(
      finalResources: finalResources ?? this.finalResources,
      availableTools: availableTools ?? this.availableTools,
      availableMachines: availableMachines ?? this.availableMachines,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AssistantState &&
        other.finalResources == finalResources &&
        other.availableTools == availableTools &&
        other.availableMachines == availableMachines;
  }

  @override
  int get hashCode {
    return finalResources.hashCode ^
        availableTools.hashCode ^
        availableMachines.hashCode;
  }
}
