import 'package:flutter/material.dart';
import 'package:your_body_lab/components/area_item_card.dart';

class AreaDetail extends StatelessWidget {
  final String title;
  const AreaDetail({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              AreaItemCard(
                title,
                title: "Articoli",
                imagePath: "assets/images/articles.jpg",
                destinationPath: "/areas/$title/articles",
              ),
              AreaItemCard(
                title,
                title: "Schede",
                imagePath: "assets/images/lessons.jpg",
                destinationPath: "/areas/$title/schede",
              ),
            ],
          ),
        ));
  }
}
