import 'resource.dart';

/// A class that represents a fluid. Defaults to a temperature of 295 K and amount of 0 L.
class Fluid extends Resource {
  /// The name of this [Fluid].
  @override
  String name;

  /// The temperature of this [Fluid] in Kelvin.
  int temperature;

  /// The amount of this [Fluid] in Liters.
  @override
  int amount;

  Fluid({required this.name, this.temperature = 295, this.amount = 0});
}

/// A master list of [Fluid]s.
final List<Fluid> fluids = [
  Fluid(name: 'Creosote'),
  Fluid(name: 'Nitric Acid'),
  Fluid(name: 'Steam', temperature: 375),
];
