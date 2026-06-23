class SetEntry {
  final int setNumber;
  final int? reps;
  final int? seconds;
  final double? weightKg;
  final int? rir;
  final bool isWarmup;

  const SetEntry({required this.setNumber, required this.isWarmup, this.reps, this.rir, this.seconds, this.weightKg});
}