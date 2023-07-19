class Repository {
  final String name;
  final String description;

  Repository({required this.name, required this.description});

  factory Repository.fromJson(Map<String, dynamic> json) {
    return Repository(
      name: json['name'],
      description: json['description'] ?? '',
    );
  }
}
