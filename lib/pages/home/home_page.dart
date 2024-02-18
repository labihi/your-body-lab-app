import 'package:flutter/material.dart';
import 'package:your_body_lab/components/box_divider.dart';
import 'package:your_body_lab/components/error_message.dart';
import 'package:your_body_lab/models/area.model.dart';
import 'package:your_body_lab/models/article.model.dart';
import 'package:your_body_lab/models/paginated_response.model.dart';
import 'package:your_body_lab/pages/home/parts/areas_section/areas_horizontal_scroll.dart';
import 'package:your_body_lab/pages/home/parts/last_articles_section/last_articles_section.dart';
import 'package:your_body_lab/services/home_page.service.dart';

class HomePage extends StatefulWidget {
  const HomePage({required this.label, required this.detailsPath, Key? key})
      : super(key: key);

  final String label;
  final String detailsPath;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<PaginatedResponse<ArticleModel>> articles;
  late Future<PaginatedResponse<Area>> areas;

  @override
  void initState() {
    super.initState();
    articles = getLastArticles();
    areas = getAreas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.label)),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: RefreshIndicator(
          onRefresh: () async {
            setState(() {
              articles = getLastArticles();
              areas = getAreas();
            });
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            clipBehavior: Clip.none,
            child: FutureBuilder(
              future: Future.wait([articles, areas], eagerError: true),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  print(snapshot.data!.last.docs);
                  return Column(
                    children: [
                      AreasHorizontalScroll(
                        areas: snapshot.data!.last as PaginatedResponse<Area>,
                      ),
                      const BoxDivider(),
                      LastArticlesSection(
                        articles: snapshot.data!.first
                            as PaginatedResponse<ArticleModel>,
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: ErrorMessage(snapshot.error.toString()),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
