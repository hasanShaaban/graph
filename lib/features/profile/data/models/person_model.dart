class Person {
  final String id;
  final String name;
  final String image;

  Person( {required this.id, required this.name, required this.image});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Person && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
