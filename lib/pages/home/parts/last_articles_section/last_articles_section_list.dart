import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:your_body_lab/models/article.model.dart';
import 'package:your_body_lab/models/paginated_response.model.dart';
import 'package:your_body_lab/pages/home/parts/last_articles_section/article_card.dart';

class LastArticlesSectionList extends StatelessWidget {
  final PaginatedResponse<ArticleModel> articles;

  const LastArticlesSectionList({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemCount: 6,
        itemBuilder: (context, index) => GestureDetector(
              onTap: () => context.go(
                '/areas/${articles.docs[index].category.title}/articles/${articles.docs[index].title}',
                extra: articles.docs[index],
              ),
              child: ArticleCard(
                title: articles.docs[index].title,
                imageUrl: articles.docs[index].image.url!,
              ),
            ));
  }

  getColor(String color) {
    return Color(int.parse(color.replaceAll("#", "0xFF")));
  }
}
