enum MuscleRole { primary, secondary }

class MuscleInvolvement {
  final String muscle;
  final MuscleRole role;

  const MuscleInvolvement({required this.muscle, required this.role});
}

class Exercise {
  final String id;
  final String name;
  final List<MuscleInvolvement> muscles;

  const Exercise({required this.id, required this.name, required this.muscles});
}

final List<Exercise> sampleExercises = [
  Exercise(
    id: 'fondos-lastrados',
    name: 'Fondos lastrados',
    muscles: [
      MuscleInvolvement(muscle: 'pecho', role: MuscleRole.primary),
      MuscleInvolvement(muscle: 'tríceps', role: MuscleRole.primary),
      MuscleInvolvement(muscle: 'deltoide anterior', role: MuscleRole.secondary),
    ],
  ),
  Exercise(
    id: 'press-hombro-maquina',
    name: 'Press de hombro en máquina',
    muscles: [
      MuscleInvolvement(muscle: 'deltoide anterior', role: MuscleRole.primary),
      MuscleInvolvement(muscle: 'tríceps', role: MuscleRole.secondary),
      MuscleInvolvement(muscle: 'deltoide lateral', role: MuscleRole.secondary),
    ],
  ),
  Exercise(
    id: 'elevaciones-laterales-mancuerna',
    name: 'Elevaciones laterales con mancuerna',
    muscles: [
      MuscleInvolvement(muscle: 'deltoide lateral', role: MuscleRole.primary),
    ],
  ),
  Exercise(
    id: 'elevaciones-laterales-cable-unilateral',
    name: 'Elevaciones laterales con cable unilateral',
    muscles: [
      MuscleInvolvement(muscle: 'deltoide lateral', role: MuscleRole.primary),
    ],
  ),
  Exercise(
    id: 'dominadas-lastradas',
    name: 'Dominadas lastradas',
    muscles: [
      MuscleInvolvement(muscle: 'dorsal', role: MuscleRole.primary),
      MuscleInvolvement(muscle: 'bíceps', role: MuscleRole.secondary),
      MuscleInvolvement(muscle: 'braquial', role: MuscleRole.secondary),
      MuscleInvolvement(muscle: 'antebrazo', role: MuscleRole.secondary),
    ],
  ),
  Exercise(
    id: 'jalon-a-pecho',
    name: 'Jalón a pecho',
    muscles: [
      MuscleInvolvement(muscle: 'dorsal', role: MuscleRole.primary),
      MuscleInvolvement(muscle: 'bíceps', role: MuscleRole.secondary),
      MuscleInvolvement(muscle: 'braquial', role: MuscleRole.secondary),
    ],
  ),
  Exercise(
    id: 'remo',
    name: 'Remo',
    muscles: [
      MuscleInvolvement(muscle: 'dorsal', role: MuscleRole.primary),
      MuscleInvolvement(muscle: 'trapecio', role: MuscleRole.secondary),
      MuscleInvolvement(muscle: 'deltoide posterior', role: MuscleRole.secondary),
      MuscleInvolvement(muscle: 'bíceps', role: MuscleRole.secondary),
    ],
  ),
  Exercise(
    id: 'aperturas',
    name: 'Aperturas',
    muscles: [
      MuscleInvolvement(muscle: 'pecho', role: MuscleRole.primary),
      MuscleInvolvement(muscle: 'deltoide anterior', role: MuscleRole.secondary),
    ],
  ),
  Exercise(
    id: 'extension-de-tricep-unilateral',
    name: 'Extensión de tríceps unilateral',
    muscles: [
      MuscleInvolvement(muscle: 'tríceps', role: MuscleRole.primary),
    ],
  ),
  Exercise(
    id: 'extension-de-tricep',
    name: 'Extensión de tríceps',
    muscles: [
      MuscleInvolvement(muscle: 'tríceps', role: MuscleRole.primary),
    ],
  ),
  Exercise(
    id: 'curl-declinado',
    name: 'Curl declinado',
    muscles: [
      MuscleInvolvement(muscle: 'bíceps', role: MuscleRole.primary),
      MuscleInvolvement(muscle: 'braquial', role: MuscleRole.secondary),
    ],
  ),
  Exercise(
    id: 'curl-predicador',
    name: 'Curl predicador',
    muscles: [
      MuscleInvolvement(muscle: 'bíceps', role: MuscleRole.primary),
      MuscleInvolvement(muscle: 'braquial', role: MuscleRole.secondary),
    ],
  ),
  Exercise(
    id: 'curl-martillo-predicador',
    name: 'Curl martillo predicador',
    muscles: [
      MuscleInvolvement(muscle: 'braquial', role: MuscleRole.primary),
      MuscleInvolvement(muscle: 'bíceps', role: MuscleRole.secondary),
      MuscleInvolvement(muscle: 'antebrazo', role: MuscleRole.secondary),
    ],
  ),
  Exercise(
    id: 'curl-invertido-polea',
    name: 'Curl invertido en polea',
    muscles: [
      MuscleInvolvement(muscle: 'antebrazo', role: MuscleRole.primary),
      MuscleInvolvement(muscle: 'braquial', role: MuscleRole.secondary),
      MuscleInvolvement(muscle: 'bíceps', role: MuscleRole.secondary),
    ],
  ),
  Exercise(
    id: 'extension-tricep-sobre-cabeza-unilateral',
    name: 'Extensión de tríceps sobre la cabeza unilateral',
    muscles: [
      MuscleInvolvement(muscle: 'tríceps', role: MuscleRole.primary),
    ],
  ),
  Exercise(
    id: 'extension-tricep-sobre-cabeza',
    name: 'Extensión de tríceps sobre la cabeza',
    muscles: [
      MuscleInvolvement(muscle: 'tríceps', role: MuscleRole.primary),
    ],
  ),
  Exercise(
    id: 'jm-press',
    name: 'JM press',
    muscles: [
      MuscleInvolvement(muscle: 'tríceps', role: MuscleRole.primary),
      MuscleInvolvement(muscle: 'pecho', role: MuscleRole.secondary),
    ],
  ),
  Exercise(
    id: 'curl-de-muneca',
    name: 'Curl de muñeca',
    muscles: [
      MuscleInvolvement(muscle: 'antebrazo', role: MuscleRole.primary),
    ],
  ),
  Exercise(
    id: 'aductores',
    name: 'Aductores',
    muscles: [
      MuscleInvolvement(muscle: 'aductores', role: MuscleRole.primary),
    ],
  ),
  Exercise(
    id: 'curl-de-pierna',
    name: 'Curl de pierna',
    muscles: [
      MuscleInvolvement(muscle: 'femoral', role: MuscleRole.primary),
    ],
  ),
  Exercise(
    id: 'extension-cuadriceps',
    name: 'Extensión de cuádriceps',
    muscles: [
      MuscleInvolvement(muscle: 'cuádriceps', role: MuscleRole.primary),
    ],
  ),
  Exercise(
    id: 'peso-muerto-rumano',
    name: 'Peso muerto rumano',
    muscles: [
      MuscleInvolvement(muscle: 'femoral', role: MuscleRole.primary),
      MuscleInvolvement(muscle: 'glúteo', role: MuscleRole.primary),
      MuscleInvolvement(muscle: 'lumbar', role: MuscleRole.secondary),
    ],
  ),
  Exercise(
    id: 'peso-muerto-convencional',
    name: 'Peso muerto convencional',
    muscles: [
      MuscleInvolvement(muscle: 'glúteo', role: MuscleRole.primary),
      MuscleInvolvement(muscle: 'femoral', role: MuscleRole.primary),
      MuscleInvolvement(muscle: 'lumbar', role: MuscleRole.primary),
      MuscleInvolvement(muscle: 'cuádriceps', role: MuscleRole.secondary),
      MuscleInvolvement(muscle: 'trapecio', role: MuscleRole.secondary),
    ],
  ),
  Exercise(
    id: 'sentadilla-hack',
    name: 'Sentadilla hack',
    muscles: [
      MuscleInvolvement(muscle: 'cuádriceps', role: MuscleRole.primary),
      MuscleInvolvement(muscle: 'glúteo', role: MuscleRole.secondary),
    ],
  ),
  Exercise(
    id: 'sentadilla-smith',
    name: 'Sentadilla smith',
    muscles: [
      MuscleInvolvement(muscle: 'cuádriceps', role: MuscleRole.primary),
      MuscleInvolvement(muscle: 'glúteo', role: MuscleRole.secondary),
    ],
  ),
  Exercise(
    id: 'elevacion-de-pantorrilla',
    name: 'Elevación de pantorrilla',
    muscles: [
      MuscleInvolvement(muscle: 'pantorrilla', role: MuscleRole.primary),
    ],
  ),
  Exercise(
    id: 'crunch-abdominal',
    name: 'Crunch abdominal',
    muscles: [
      MuscleInvolvement(muscle: 'abdomen', role: MuscleRole.primary),
    ],
  ),
  Exercise(
    id: 'front-lever',
    name: 'Front lever',
    muscles: [
      MuscleInvolvement(muscle: 'dorsal', role: MuscleRole.primary),
      MuscleInvolvement(muscle: 'abdomen', role: MuscleRole.primary),
      MuscleInvolvement(muscle: 'deltoide posterior', role: MuscleRole.secondary),
    ],
  ),
  Exercise(
    id: 'giros-polea-oblicuos',
    name: 'Giros con polea para oblicuos',
    muscles: [
      MuscleInvolvement(muscle: 'oblicuos', role: MuscleRole.primary),
      MuscleInvolvement(muscle: 'abdomen', role: MuscleRole.secondary),
    ],
  ),
];