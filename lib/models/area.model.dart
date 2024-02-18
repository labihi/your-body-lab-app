class Area {
  final String? id;
  final String title;
  final String color;
  final String icon;
  final String updatedAt;
  final String createdAt;

  const Area({
    required this.id,
    required this.title,
    required this.color,
    required this.icon,
    required this.updatedAt,
    required this.createdAt,
  });

  factory Area.fromJson(Map<String, dynamic> json) {
    return Area(
      id: json['_id'] as String?,
      title: json['title'] as String,
      color: json['color'] as String,
      icon: json['icon'] as String,
      updatedAt: json['updatedAt'] as String,
      createdAt: json['createdAt'] as String,
    );
  }

  static Area fromJsonModel(Map<String, dynamic> json) => Area.fromJson(json);
}
