import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:your_body_lab/services/image.service.dart';

class ArticleCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  const ArticleCard({super.key, required this.title, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            colorFilter:
                const ColorFilter.mode(Colors.black54, BlendMode.darken),
            image: CachedNetworkImageProvider(getMediaUrl(imageUrl)),
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
