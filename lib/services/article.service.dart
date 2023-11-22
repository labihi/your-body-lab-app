import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:your_body_lab/models/article.model.dart';
import 'package:your_body_lab/models/paginated_response.model.dart';
import 'package:http/http.dart' as http;

Future<PaginatedResponse<ArticleModel>> getArticlesFromArea(String area) async {
  final epArticles = '${dotenv.env['API_URL']}/articles';
  try {
    final response = await http.get(Uri.parse(
        "$epArticles?where[category.title][equals]=$area&&sort=-createdAt"));

    if (response.statusCode == 200) {
      return PaginatedResponse<ArticleModel>.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
          ArticleModel.fromJsonModel);
    } else {
      throw Exception('Failed to load articles');
    }
  } on Exception catch (_) {
    throw Exception('Failed to load articles');
  }
}
