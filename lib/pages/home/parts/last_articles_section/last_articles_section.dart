import 'package:flutter/material.dart';
import 'package:your_body_lab/pages/home/parts/last_articles_section/last_articles_section_list.dart';

class LastArticlesSection extends StatelessWidget {
  const LastArticlesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            Text("Ultimi articoli", style: TextStyle(fontSize: 30)),
          ],
        ),
        LastArticlesSectionList()
      ],
    );
  }
}
