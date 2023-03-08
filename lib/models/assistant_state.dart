import 'package:flutter/material.dart';

import 'resource.dart';

/// The top level metadata for the assistant.
@immutable
class AssistantState {
  /// The [Resource]s that will always be the final node in the crafting tree.
  final List<Resource> finalResources;

  const AssistantState({
    required this.finalResources,
  });

  AssistantState copyWith({
    List<Resource>? finalResources,
  }) {
    return AssistantState(
      finalResources: finalResources ?? this.finalResources,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AssistantState && other.finalResources == finalResources;
  }

  @override
  int get hashCode {
    return finalResources.hashCode;
  }
}
