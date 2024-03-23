class Instrument {
  final String name;
  final List<bool> slot;
  double volume;

  Instrument(this.name, {List<bool>? slot, this.volume = 0.5})
      : slot = slot ?? List.generate(8, (index) => false);
}
