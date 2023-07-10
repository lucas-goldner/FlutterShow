class Pushups {
  Pushups(this.amount, {required this.inPushupMovement});

  final int amount;
  final bool inPushupMovement;

  Pushups copyWith({int? amount, bool? inPushupMovement}) {
    return Pushups(
      amount ?? this.amount,
      inPushupMovement: inPushupMovement ?? this.inPushupMovement,
    );
  }
}
