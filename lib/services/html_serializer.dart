import 'package:your_body_lab/services/image.service.dart';

class HtmlSerializer {
  String serialize(List<dynamic> jsonData) {
    String html = '';

    for (var item in jsonData) {
      if (item['children'] != null) {
        if (item.containsKey('type') && item['type'] == 'ul') {
          html += '<ul>';
          // Recursively call the function for list items
          html += serialize(item['children']);
          html += '</ul>';
        } else if (item.containsKey('type') && item['type'] == 'li') {
          html += '<li>';
          // Recursively call the function for list item children
          html += serialize(item['children']);
          html += '</li>';
        } else if (item.containsKey('type') && item['type'] == 'upload') {
          html +=
              '<img src="${getMediaUrl(item['value']['filename'])}" alt="${item['alt']}">';
        } else if (item.containsKey('type') && item['type'] == 'a') {
          html += '<a href="${item['url']}">${item['children'][0]['text']}</a>';
        } else {
          // Recursively call the function for other children
          html += '${serialize(item['children'])}<br>';
        }
      } else if (item['text'] != null) {
        String text = item['text'];

        // Apply formatting if specified
        if (item['bold'] == true) {
          text = '<b>$text</b>';
        }

        if (item['italic'] == true) {
          text = '<i>$text</i>';
        }

        if (item['underline'] == true) {
          text = '<u>$text</u>';
        }

        if (item['code'] == true) {
          text = '<code>$text</code>';
        }

        text = text.replaceAll('\n', '<br>');

        // Add the text to HTML
        html += text;
      }
    }

    return html;
  }
}
