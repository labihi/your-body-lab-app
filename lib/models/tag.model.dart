class Tag {
  final String? id;
  final String name;
  final String createdAt;
  final String updatedAt;

  const Tag(
      {required this.id,
      required this.name,
      required this.createdAt,
      required this.updatedAt});

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
        id: json['id'],
        name: json['name'],
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt']);
  }

  static Tag fromJsonModel(Map<String, dynamic> json) => Tag.fromJson(json);
}
