class Contact {
  final String id;
  final String name;
  final String role;
  final String biography;
  final String email;
  final String phone;
  final String initials;
  final String category;
  final String era;
  final List<String> contributions;

  const Contact({
    required this.id,
    required this.name,
    required this.role,
    required this.biography,
    required this.email,
    required this.phone,
    required this.initials,
    required this.category,
    required this.era,
    required this.contributions,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Contact &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}
