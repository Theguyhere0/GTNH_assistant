import 'item_type.dart';
import 'resource.dart';

/// An enumeration that represents a Minecraft item.
enum Item implements Resource {
  bandedIronOre(name: 'Banded Iron Ore', type: ItemType.ore),
  betterBarrel(name: 'Better Barrel', type: ItemType.storage),
  blockOfCharcoal(name: 'Block of Charcoal', type: ItemType.material),
  blockOfCoal(name: 'Block of Coal', type: ItemType.material),
  blockOfCoalCoke(name: 'Block of Coal Coke', type: ItemType.material),
  brick(name: 'Brick', type: ItemType.material),
  brickedBronzeHull(name: 'Bricked Bronze Hull', type: ItemType.material),
  bricks(name: 'Bricks', type: ItemType.building),
  bronzeDust(name: 'Bronze Dust', type: ItemType.material),
  bronzeFluidPipe(name: 'Bronze Fluid Pipe', type: ItemType.pipe),
  bronzeIngot(name: 'Bronze Ingot', type: ItemType.material),
  bronzePlate(name: 'Bronze Plate', type: ItemType.material),
  brownLimoniteOre(name: 'Brown Limonite Ore', type: ItemType.ore),
  cassiteriteOre(name: 'Cassiterite Ore', type: ItemType.ore),
  cassiteriteSand(name: 'Cassiterite Sand', type: ItemType.ore),
  chest(name: 'Chest', type: ItemType.storage),
  chalcopyriteOre(name: 'Chalcopyrite Ore', type: ItemType.ore),
  charcoal(name: 'Charcoal', type: ItemType.material),
  clay(name: 'Clay', type: ItemType.material),
  clayDust(name: 'Clay Dust', type: ItemType.material),
  coal(name: 'Coal', type: ItemType.material),
  coalCoke(name: 'Coal Coke', type: ItemType.material),
  cobblestone(name: 'Cobblestone', type: ItemType.material),
  cokeOvenBrick(name: 'Coke Oven Brick', type: ItemType.material),
  cokeOvenBricks(name: 'Coke Oven Bricks', type: ItemType.steamMachine),
  copperDust(name: 'Copper Dust', type: ItemType.material),
  copperIngot(name: 'Copper Ingot', type: ItemType.material),
  copperOre(name: 'Copper Ore', type: ItemType.ore),
  copperPlate(name: 'Copper Plate', type: ItemType.material),
  flint(name: 'Flint', type: ItemType.material),
  firebrick(name: 'Firebrick', type: ItemType.material),
  furnace(name: 'Furnace', type: ItemType.generalMachine),
  gravel(name: 'Gravel', type: ItemType.material),
  gypsumDust(name: 'Gypsum Dust', type: ItemType.material),
  hugeBronzeFluidPipe(name: 'Huge Bronze Fluid Pipe', type: ItemType.pipe),
  ironFurnace(name: 'Iron Furnace', type: ItemType.generalMachine),
  ironIngot(name: 'Iron Ingot', type: ItemType.material),
  ironOre(name: 'Iron Ore', type: ItemType.ore),
  ironPlate(name: 'Iron Plate', type: ItemType.material),
  largeBronzeFluidPipe(name: 'Large Bronze Fluid Pipe', type: ItemType.pipe),
  magnetiteOre(name: 'Magnetite Ore', type: ItemType.ore),
  malachiteOre(name: 'Malachite Ore', type: ItemType.ore),
  mud(name: 'Mud', type: ItemType.material),
  pyriteOre(name: 'Pyrite Ore', type: ItemType.ore),
  redAlloyIngot(name: 'Red Alloy Ingot', type: ItemType.material),
  redAlloyPlate(name: 'Red Alloy Plate', type: ItemType.material),
  redstone(name: 'Redstone', type: ItemType.material),
  redstoneOre(name: 'Redstone Ore', type: ItemType.ore),
  sand(name: 'Sand', type: ItemType.material),
  smallBronzeFluidPipe(name: 'Small Bronze Fluid Pipe', type: ItemType.pipe),
  smallCoalBoiler(name: 'Small Coal Boiler', type: ItemType.steamMachine),
  smallPileOfClayDust(name: 'Small Pile of Clay Dust', type: ItemType.material),
  steamAlloySmelter(name: 'Steam Alloy Smelter', type: ItemType.steamMachine),
  stick(name: 'Stick', type: ItemType.material),
  stone(name: 'Stone', type: ItemType.material),
  tinDust(name: 'Tin Dust', type: ItemType.material),
  tinIngot(name: 'Tin Ingot', type: ItemType.material),
  tinOre(name: 'Tin Ore', type: ItemType.ore),
  tinPlate(name: 'Tin Plate', type: ItemType.material),
  tinyBronzeFluidPipe(name: 'Tiny Bronze Fluid Pipe', type: ItemType.pipe),
  unfiredCokeOvenBrick(
      name: 'Unfired Coke Oven Brick', type: ItemType.material),
  unfiredClayBrick(name: 'Unfired Clay Brick', type: ItemType.material),
  wood(name: 'Wood', type: ItemType.material),
  woodPlanks(name: 'Wood Planks', type: ItemType.material),
  woodPulp(name: 'Wood Pulp', type: ItemType.material),
  woodSlab(name: 'Wood Slab', type: ItemType.building),
  yellowLimoniteOre(name: 'Yellow Limonite Ore', type: ItemType.ore);

  /// The name of this [Item].
  @override
  final String name;

  /// The [ItemType] that this [Item] belongs to.
  final ItemType type;

  const Item({required this.name, required this.type});
}
