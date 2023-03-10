import 'industrial_age.dart';

/// An enumeration that represents a setup a process step, not to be confused with the blocks or items that allow for the process.
enum Machine {
  cokeOven(name: 'Coke Oven', type: IndustrialAge.steam),
  furnace(name: 'Furnace', type: IndustrialAge.generic);

  /// The name of this [Machine].
  final String name;

  /// The [IndustrialAge] that this [Machine] falls under.
  final IndustrialAge type;

  const Machine({required this.name, required this.type});
}
