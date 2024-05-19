import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:your_body_lab/services/image.service.dart';

class ArticleCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  const ArticleCard({super.key, required this.title, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Stack(
            children: [
              Image(
                image: CachedNetworkImageProvider(getMediaUrl(imageUrl)),
                fit: BoxFit.cover,
                height: double.infinity,
                alignment: Alignment.center,
              ),
              Container(
                color: Colors.black45,
                height: double.infinity,
                width: double.infinity,
              ),
            ],
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
