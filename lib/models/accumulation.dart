class Accumulation {
  String? email;
  List<String>? dateAccumulation;

  Accumulation({this.email, this.dateAccumulation});

  factory Accumulation.fromMap(map) {
    return Accumulation(
      email: map['email'],
      dateAccumulation: List<String>.from(map['dateAccumulation'] as List),
    );
  }
}
