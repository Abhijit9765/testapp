class Dog {
  final String name;
  final String breed;
  final String imageUrl;
  final String? breedGroup;
  final String? description;

  Dog({
    required this.name,
    required this.breed,
    required this.imageUrl,
    this.breedGroup,
    this.description,
  });

  factory Dog.fromJson(Map<String, dynamic> json) {
    return Dog(
      name: json['name'] ?? 'Unknown',
      breed: json['breed'] ?? 'Unknown',
      imageUrl: json['image'] ?? '',
      breedGroup: json['breed_group'],
      description: json['description'],
    );
  }
}
