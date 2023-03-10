import 'recipe.dart';
import 'resource.dart';

class Itemstack {
  /// The [Resource] represented in this [Itemstack]. A null [Resource] represents energy.
  Resource? resource;

  /// The amount of this [Itemstack].
  int quantity;

  /// Whether or not this quantity was a predicted amount because it was based on probabilistic [Recipe]s. Defaults to false.
  bool predicted;

  Itemstack({
    this.resource,
    required this.quantity,
    this.predicted = false,
  });
}
