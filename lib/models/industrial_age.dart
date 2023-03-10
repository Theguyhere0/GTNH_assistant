/// An enumeration of different categories that items or machines could belong to.
enum IndustrialAge {
  generic('Generic'),
  steam('Steam Age'),
  lv('LV Age'),
  mv('MV Age'),
  hv('HV Age'),
  ev('EV Age'),
  iv('IV Age'),
  luv('LuV Age');

  /// The display name.
  final String name;

  const IndustrialAge(this.name);
}
