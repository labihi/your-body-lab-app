import 'package:flutter_dotenv/flutter_dotenv.dart';

String getMediaUrl(imageUrl) {
  return "${dotenv.env['IMAGE_URL']}$imageUrl";
}
