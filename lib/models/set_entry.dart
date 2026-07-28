class SetEntry {
  final int setNumber;
  final int? reps;
  final int? seconds;
  final double? weightKg;
  final int? rir;
  final bool isWarmup;

  const SetEntry({
    required this.setNumber,
    required this.isWarmup,
    this.reps,
    this.rir,
    this.seconds,
    this.weightKg,
  });

  Map<String, dynamic> toMap() => {
    'setNumber': setNumber,
    'reps': reps,
    'seconds': seconds,
    'weightKg': weightKg,
    'rir': rir,
    'isWarmup': isWarmup,
  };

  factory SetEntry.fromMap(Map<String, dynamic> map) => SetEntry(
    setNumber: map['setNumber'] as int,
    reps: map['reps'] as int?,
    seconds: map['seconds'] as int?,
    weightKg: map['weightKg'] as double?,
    rir: map['rir'] as int?,
    isWarmup: map['isWarmup'] as bool,
  );
}
