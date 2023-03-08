import 'item_type.dart';
import 'resource.dart';

/// A class that represents a Minecraft Itemstack. Defaults to an amount of 0.
class Item extends Resource {
  /// The name of this [Item].
  @override
  String name;

  /// The [ItemType] that this [Item] belongs to.
  ItemType type;

  /// The quantity of this [Item].
  @override
  int amount;

  Item({required this.name, required this.type, this.amount = 0});
}

/// A master list of [Item]s.
final List<Item> items = [
  Item(name: 'Banded Iron Ore', type: ItemType.ore),
  Item(name: 'Better Barrel', type: ItemType.storage),
  Item(name: 'Block of Charcoal', type: ItemType.material),
  Item(name: 'Block of Coal', type: ItemType.material),
  Item(name: 'Block of Coal Coke', type: ItemType.material),
  Item(name: 'Brick', type: ItemType.material),
  Item(name: 'Bricked Bronze Hull', type: ItemType.material),
  Item(name: 'Bricks', type: ItemType.building),
  Item(name: 'Bronze Dust', type: ItemType.material),
  Item(name: 'Bronze Fluid Pipe', type: ItemType.pipe),
  Item(name: 'Bronze Ingot', type: ItemType.material),
  Item(name: 'Bronze Plate', type: ItemType.material),
  Item(name: 'Brown Limonite Ore', type: ItemType.ore),
  Item(name: 'Cassiterite Ore', type: ItemType.ore),
  Item(name: 'Cassiterite Sand', type: ItemType.ore),
  Item(name: 'Chest', type: ItemType.storage),
  Item(name: 'Chalcopyrite Ore', type: ItemType.ore),
  Item(name: 'Charcoal', type: ItemType.material),
  Item(name: 'Clay', type: ItemType.material),
  Item(name: 'Coal', type: ItemType.material),
  Item(name: 'Coal Coke', type: ItemType.material),
  Item(name: 'Cobblestone', type: ItemType.material),
  Item(name: 'Coke Oven Brick', type: ItemType.material),
  Item(name: 'Coke Oven Bricks', type: ItemType.steamMachine),
  Item(name: 'Copper Dust', type: ItemType.material),
  Item(name: 'Copper Ingot', type: ItemType.material),
  Item(name: 'Copper Ore', type: ItemType.ore),
  Item(name: 'Copper Plate', type: ItemType.material),
  Item(name: 'Flint', type: ItemType.material),
  Item(name: 'Furnace', type: ItemType.generalMachine),
  Item(name: 'Gravel', type: ItemType.material),
  Item(name: 'Huge Bronze Fluid Pipe', type: ItemType.pipe),
  Item(name: 'Iron Furnace', type: ItemType.generalMachine),
  Item(name: 'Iron Ingot', type: ItemType.material),
  Item(name: 'Iron Ore', type: ItemType.ore),
  Item(name: 'Iron Plate', type: ItemType.material),
  Item(name: 'Large Bronze Fluid Pipe', type: ItemType.pipe),
  Item(name: 'Magnetite Ore', type: ItemType.ore),
  Item(name: 'Malachite Ore', type: ItemType.ore),
  Item(name: 'Mud', type: ItemType.material),
  Item(name: 'Pyrite Ore', type: ItemType.ore),
  Item(name: 'Red Alloy Ingot', type: ItemType.material),
  Item(name: 'Red Alloy Plate', type: ItemType.material),
  Item(name: 'Redstone', type: ItemType.material),
  Item(name: 'Redstone Ore', type: ItemType.ore),
  Item(name: 'Sand', type: ItemType.material),
  Item(name: 'Small Bronze Fluid Pipe', type: ItemType.pipe),
  Item(name: 'Small Coal Boiler', type: ItemType.steamMachine),
  Item(name: 'Steam Alloy Smelter', type: ItemType.steamMachine),
  Item(name: 'Stick', type: ItemType.material),
  Item(name: 'Stone', type: ItemType.material),
  Item(name: 'Tin Dust', type: ItemType.material),
  Item(name: 'Tin Ingot', type: ItemType.material),
  Item(name: 'Tin Ore', type: ItemType.ore),
  Item(name: 'Tin Plate', type: ItemType.material),
  Item(name: 'Tiny Bronze Fluid Pipe', type: ItemType.pipe),
  Item(name: 'Unfired Coke Oven Brick', type: ItemType.material),
  Item(name: 'Unfired Clay Brick', type: ItemType.material),
  Item(name: 'Wood', type: ItemType.material),
  Item(name: 'Wood Planks', type: ItemType.material),
  Item(name: 'Wood Pulp', type: ItemType.material),
  Item(name: 'Wood Slab', type: ItemType.building),
  Item(name: 'Yellow Limonite Ore', type: ItemType.ore),
];
