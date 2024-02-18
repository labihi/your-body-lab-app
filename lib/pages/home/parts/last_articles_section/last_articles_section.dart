import 'package:flutter/material.dart';
import 'package:your_body_lab/models/article.model.dart';
import 'package:your_body_lab/models/paginated_response.model.dart';
import 'package:your_body_lab/pages/home/parts/last_articles_section/last_articles_section_list.dart';

class LastArticlesSection extends StatelessWidget {
  final PaginatedResponse<ArticleModel> articles;
  const LastArticlesSection({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          children: [
            Text("Ultimi articoli", style: TextStyle(fontSize: 30)),
          ],
        ),
        LastArticlesSectionList(
          articles: articles,
        )
      ],
    );
  }
}
