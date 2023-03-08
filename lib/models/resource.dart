/// A class that represents an input to a crafting process that is consumed.
abstract class Resource {
  /// The name of this [Resource].
  String get name;

  /// The quantity of this [Resource] needed in the crafting recipe.
  int get amount;
}
