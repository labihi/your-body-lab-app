import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:your_body_lab/models/article.model.dart';
import 'package:your_body_lab/services/html_serializer.dart';

class ArticleDetail extends StatelessWidget {
  final String title;
  final ArticleModel article;
  const ArticleDetail({super.key, required this.title, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            // child: Text(slateToHTML(article)),
            child: Column(
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 32),
                ),
                const SizedBox(height: 20),
                //Text("Tempo di lettura: ~${timeToRead(article)} minuti"),
                const SizedBox(height: 40),
                HtmlWidget(HtmlSerializer().serialize(article.content!),
                    textStyle: const TextStyle(fontSize: 20)),
              ],
            )),
      ),
    );
  }
}
