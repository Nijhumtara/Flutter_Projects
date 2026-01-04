class University {
  final String name;
  final String city;
  final String country;
  final String ranking; // qs_rank is TEXT in DB
  final int tuitionMin;
  final int tuitionMax;
  final String ielts;   // ielts is TEXT in DB
  final List<String> programs;
  final List<String> intakes;
  final String imagePath;
  final String? scholarship; 

  University({
    required this.name,
    required this.city,
    required this.country,
    required this.ranking,
    required this.tuitionMin,
    required this.tuitionMax,
    required this.ielts,
    required this.programs,
    required this.intakes,
    required this.imagePath,
    this.scholarship,
  });

  factory University.fromMap(Map<String, dynamic> map) {
    return University(
      name: map['name'],
      city: map['city'],
      country: map['country'],
      ranking: map['qs_rank'] ?? '',
      tuitionMin: map['tuition_min'] ?? 0,
      tuitionMax: map['tuition_max'] ?? 0,
      ielts: map['ielts'] ?? '',
      programs: List<String>.from(map['programs'] ?? []),
      intakes: List<String>.from(map['intakes'] ?? []),
      imagePath: map['image_url'] ?? '',
      scholarship: map['scholarships'], // 👈 NEW
    );
  }
}
