import 'package:your_body_lab_flutter/models/area.model.dart';
import 'package:your_body_lab_flutter/models/media.model.dart';

class ArticleModel {
  final String? id;
  final String title;
  final List<Map<String, dynamic>>? content;
  final Area category;
  final Media image;
  final String updatedAt;
  final String createdAt;

  const ArticleModel({
    required this.id,
    required this.title,
    required this.content,
    required this.category,
    required this.image,
    required this.updatedAt,
    required this.createdAt,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    final content = json['content'].cast<Map<String, dynamic>>();

    return ArticleModel(
      id: json['_id'] as String?,
      title: json['title'] as String,
      content: content,
      category: Area.fromJsonModel(json['category']),
      image: Media.fromJson(json['image'] as Map<String, dynamic>),
      updatedAt: json['updatedAt'] as String,
      createdAt: json['createdAt'] as String,
    );
  }

  static ArticleModel fromJsonModel(Map<String, dynamic> json) =>
      ArticleModel.fromJson(json);
}
