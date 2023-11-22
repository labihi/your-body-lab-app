import 'package:flutter/material.dart';
import 'package:your_body_lab/components/box_divider.dart';
import 'package:your_body_lab/pages/home/parts/areas_section/areas_horizontal_scroll.dart';
import 'package:your_body_lab/pages/home/parts/last_articles_section/last_articles_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({required this.label, required this.detailsPath, Key? key})
      : super(key: key);

  final String label;
  final String detailsPath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(label)),
      body: const Padding(
        padding: EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              AreasHorizontalScroll(),
              BoxDivider(),
              LastArticlesSection(),
            ],
          ),
        ),
      ),
    );
  }
}
