class University {
  final String id;
  final String name;
  final String city;
  final String country;
  final String ranking; // qs_rank is TEXT in DB
  final String imagePath; 

  University({
    required this.id,
    required this.name,
    required this.city,
    required this.country,
    required this.ranking,
    required this.imagePath,
  });

  factory University.fromMap(Map<String, dynamic> map) {
    return University(
      id: map['id'],
      name: map['name'],
      city: map['city'],
      country: map['country'],
      ranking: map['qs_rank'] ?? '',
      imagePath: map['image_url'] ?? '',
    );
  }
}
