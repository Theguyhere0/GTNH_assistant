/// An enumeration of different tools used in crafting recipes.
enum Tool {
  mortar('Mortar'),
  softMallet('Soft Mallet'),
  wireCutter('Wire Cutter'),
  wrench('Wrench');

  /// The display name.
  final String value;

  const Tool(this.value);
}
