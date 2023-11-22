import 'package:your_body_lab/models/article.model.dart';

String slateToHTML(ArticleModel article) {
  // convert slate json to html string
  List<Map<String, dynamic>> content = article.content!;
  String html = '';
  for (var element in content) {
    if (element['children'][0]['type'] == null) {
      if (element['children'][0]['bold'] == true) {
        html += '<b>${element['children'][0]['text']}</b><br>';
      } else if (element['children'][0]['italic'] == true) {
        html += '<i>${element['children'][0]['text']}</i><br>';
      } else if (element['children'][0]['underline'] == true) {
        html += '<u>${element['children'][0]['text']}</u><br>';
      } else if (element['children'][0]['code'] == true) {
        html += '<code>${element['children'][0]['text']}</code><br>';
      } else {
        html += '<p>${element['children'][0]['text']}</p><br>';
      }
    }
  }
  return html;
}

num getWordCount(ArticleModel article) {
  List<Map<String, dynamic>> content = article.content!;
  num wordCount = 0;
  for (var element in content) {
    if (element['children'][0]['type'] == null) {
      wordCount += element['children'][0]['text'].split(' ').length;
    }
  }
  return wordCount;
}

String timeToRead(ArticleModel article) {
  num wordCount = getWordCount(article);
  num timeToRead = wordCount / 185;
  return timeToRead.toStringAsFixed(0);
}
