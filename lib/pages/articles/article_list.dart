import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:your_body_lab/models/article.model.dart';
import 'package:your_body_lab/models/paginated_response.model.dart';
import 'package:your_body_lab/pages/home/parts/last_articles_section/article_card.dart';
import 'package:your_body_lab/services/article.service.dart';

class ArticleList extends StatefulWidget {
  final String title;
  const ArticleList({super.key, required this.title});

  @override
  State<ArticleList> createState() => _ArticleListState();
}

class _ArticleListState extends State<ArticleList> {
  late Future<PaginatedResponse<ArticleModel>>? articles;

  @override
  void initState() {
    super.initState();
    articles = getArticlesFromArea(widget.title);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Articoli di ${widget.title}"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
          future: articles,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.docs.isEmpty) {
                return const Center(
                    child: Text("Non ci sono articoli in questa area"));
              } else {
                return GridView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.docs.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) => GestureDetector(
                          onTap: () => context.go(
                              '/areas/${snapshot.data!.docs[index].category.title}/articles/${snapshot.data!.docs[index].title}',
                              extra: snapshot.data!.docs[index]),
                          child: ArticleCard(
                            title: snapshot.data!.docs[index].title,
                            imageUrl: snapshot.data!.docs[index].image.url!,
                          ),
                        ));
              }
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
