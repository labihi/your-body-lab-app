import 'package:flutter_dotenv/flutter_dotenv.dart';

String getImageUrl(imageUrl) {
  return "${dotenv.env['BASE_URL']}$imageUrl";
}
