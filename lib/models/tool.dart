/// An enumeration of different tools used in crafting recipes.
enum Tool {
  brickForm('Brick Form'),
  mortar('Mortar'),
  softMallet('Soft Mallet'),
  wireCutter('Wire Cutter'),
  wrench('Wrench');

  /// The display name.
  final String name;

  const Tool(this.name);
}
