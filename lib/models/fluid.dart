import 'resource.dart';

/// An enumeration that represents a fluid.
enum Fluid implements Resource {
  concrete(name: 'Concrete', temperature: 300),
  creosote(name: 'Creosote', temperature: 295),
  nitricAcid(name: 'Nitric Acid', temperature: 295),
  steam(name: 'Steam', temperature: 375),
  water(name: 'Water', temperature: 300);

  /// The name of this [Fluid].
  @override
  final String name;

  /// The temperature of this [Fluid] in Kelvin.
  final int temperature;

  const Fluid({required this.name, required this.temperature});
}
