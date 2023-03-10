import 'fluid.dart';
import 'item.dart';
import 'machine.dart';
import 'resource.dart';
import 'tool.dart';

/// A class that represents a crafting conversion step.
class Recipe {
  /// The [Resource]s and their amounts that are required for this [Recipe].
  final Map<Resource, int> resourceInputs;

  /// The [Tool]s required to complete this [Recipe].
  final List<Tool> tools;

  /// The [Machine]s required to complete this [Recipe].
  final List<Machine> machines;

  /// The time for this [Recipe] to complete in Seconds.
  final int time;

  /// The energy required to complete this [Recipe] in EU.
  final int energyInput;

  /// The relative efficiency rank of this recipe compared to other recipes for similar outputs.
  final int efficiencyRank;

  /// The [Item]s and their amounts that result from this [Recipe]. Values less between 1 and 0 represent probabilistic results.
  final Map<Item, double> itemOutputs;

  /// The [Fluid]s and their quantity in mB that result from this [Recipe].
  final Map<Fluid, int> fluidOutputs;

  /// The energy that results from this [Recipe] in EU.
  final int energyOutput;

  /// The amount of this recipe that will be needed.
  int quantity = 1;

  Recipe({
    this.resourceInputs = const {},
    this.tools = const [],
    this.machines = const [],
    this.time = 0,
    this.energyInput = 0,
    this.efficiencyRank = 0,
    this.itemOutputs = const {},
    this.fluidOutputs = const {},
    this.energyOutput = 0,
  });
}

/// The master list of recipes
List<Recipe> recipes = [
  Recipe(
    resourceInputs: {Item.gravel: 3},
    itemOutputs: {Item.flint: 1},
  ),
  Recipe(
    resourceInputs: {
      Item.cobblestone: 6,
      Item.flint: 3,
    },
    itemOutputs: {Item.furnace: 1},
  ),
  Recipe(
    resourceInputs: {
      Item.cobblestone: 32,
      Fluid.creosote: 1000,
    },
    machines: [Machine.furnace],
    time: 320,
    itemOutputs: {Item.stone: 32},
  ),
  Recipe(
    resourceInputs: {Item.clay: 1},
    tools: [Tool.mortar],
    itemOutputs: {Item.smallPileOfClayDust: 1},
  ),
  Recipe(
    resourceInputs: {Item.smallPileOfClayDust: 4},
    itemOutputs: {Item.clayDust: 1},
  ),
  Recipe(
    resourceInputs: {Item.gravel: 1},
    tools: [Tool.mortar],
    itemOutputs: {Item.flint: 1},
  ),
  Recipe(
    resourceInputs: {
      Item.clay: 3,
      Item.sand: 5,
    },
    tools: [Tool.brickForm],
    itemOutputs: {Item.unfiredCokeOvenBrick: 3},
  ),
  Recipe(
    resourceInputs: {Item.clay: 8},
    tools: [Tool.brickForm],
    itemOutputs: {Item.unfiredClayBrick: 8},
  ),
];
