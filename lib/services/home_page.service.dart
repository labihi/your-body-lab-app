import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:your_body_lab/models/area.model.dart';
import 'package:http/http.dart' as http;
import 'package:your_body_lab/models/article.model.dart';
import 'package:your_body_lab/models/paginated_response.model.dart';

Future<PaginatedResponse<Area>> getAreas() async {
  final epAreas = '${dotenv.env['API_URL']}/areas';

  try {
    final response = await http.get(Uri.parse(epAreas));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return PaginatedResponse<Area>.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
          Area.fromJsonModel);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load areas');
    }
  } on Exception catch (_) {
    throw Exception('Failed to load areas');
  }
}

Future<PaginatedResponse<ArticleModel>> getLastArticles() async {
  final epArticles = '${dotenv.env['API_URL']}/articles';
  try {
    final response =
        await http.get(Uri.parse("$epArticles?sort=-createdAt&limit=6"));
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
