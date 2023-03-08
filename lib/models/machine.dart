import 'industrial_age.dart';

/// A class that represents a setup a process step, not to be confused with the blocks or items that allow for the process.
class Machine {
  /// The name of this [Machine].
  String name;

  /// The [IndustrialAge] that this [Machine] falls under.
  IndustrialAge type;

  Machine({required this.name, required this.type});
}

/// A master list of [Machine]s.
final List<Machine> machines = [
  Machine(name: 'Coke Oven', type: IndustrialAge.steam),
];
