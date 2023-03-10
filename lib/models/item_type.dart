import 'item.dart';

/// An enumeration of different categories that [Item]s could fall under.
enum ItemType {
  building('Building'),
  cable('Cable'),
  material('Material'),
  ore('Ore'),
  pipe('Pipe'),
  storage('Storage'),
  wire('Wire'),
  generalMachine('General Machine'),
  steamMachine('Steam Machine'),
  lvMachine('LV Machine'),
  mvMachine('MV Machine'),
  hvMachine('HV Machine'),
  evMachine('EV Machine'),
  ivMachine('IV Machine'),
  luvMachine('LuV Machine'),
  zpmMachine('ZPM Machine'),
  uvMachine('UV Machine'),
  uhvMachine('UHV Machine'),
  uevMachine('UEV Machine'),
  uivMachine('UIV Machine'),
  umvMachine('UMV Machine'),
  uxvMachine('UXV Machine'),
  maxMachine('MAX Machine');

  /// The display name.
  final String name;

  const ItemType(this.name);
}
