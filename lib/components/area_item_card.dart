import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AreaItemCard extends StatelessWidget {
  final String areaTitle;
  final String title;
  final String imagePath;
  final String destinationPath;

  const AreaItemCard(
    this.areaTitle, {
    super.key,
    required this.title,
    required this.imagePath,
    required this.destinationPath,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 200,
      child: GestureDetector(
        onTap: () => {context.go(destinationPath)},
        child: Card(
          child: Stack(
            children: [
              SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image(
                        width: double.infinity,
                        fit: BoxFit.cover,
                        image: AssetImage(imagePath),
                      ),
                      Container(
                        color: Colors.black54,
                        height: double.infinity,
                        width: double.infinity,
                      ),
                      Text(
                        title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
