import 'resource.dart';

/// An enumeration that represents a fluid. Defaults to a temperature of 295 K and amount of 0 L.
enum Fluid implements Resource {
  creosote(name: 'Creosote'),
  nitricAcid(name: 'Nitric Acid'),
  steam(name: 'Steam', temperature: 375);

  /// The name of this [Fluid].
  @override
  final String name;

  /// The temperature of this [Fluid] in Kelvin.
  final int temperature;

  const Fluid({required this.name, this.temperature = 295});
}
