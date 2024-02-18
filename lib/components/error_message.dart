import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  final String message;

  const ErrorMessage(this.message, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
        child: Stack(
          children: [
            Image.asset(
              "assets/images/error.png",
              width: 800,
              height: 500,
            ),
            const Positioned(
              top: 150,
              //width of the screen - 2 * padding
              width: 200,
              child: Center(
                child: Text(
                  "OPS! Fuffi sta giocando con i nostri server!",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
