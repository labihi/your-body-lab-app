import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:your_body_lab/models/article.model.dart';
import 'package:your_body_lab/models/paginated_response.model.dart';
import 'package:your_body_lab/pages/home/parts/last_articles_section/article_card.dart';
import 'package:your_body_lab/services/home_page.service.dart';

class LastArticlesSectionList extends StatefulWidget {
  const LastArticlesSectionList({super.key});

  @override
  State<LastArticlesSectionList> createState() =>
      _LastArticlesSectionListState();
}

class _LastArticlesSectionListState extends State<LastArticlesSectionList> {
  late Future<PaginatedResponse<ArticleModel>>? articles;

  @override
  void initState() {
    super.initState();
    articles = getLastArticles();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: articles,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemCount: 6,
              itemBuilder: (context, index) => GestureDetector(
                    onTap: () => context.go(
                        '/areas/${snapshot.data!.docs[index].category.title}/articles/${snapshot.data!.docs[index].title}',
                        extra: snapshot.data!.docs[index]),
                    child: ArticleCard(
                      title: snapshot.data!.docs[index].title,
                      imageUrl: snapshot.data!.docs[index].image.url!,
                    ),
                  ));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  getColor(String color) {
    return Color(int.parse(color.replaceAll("#", "0xFF")));
  }
}
