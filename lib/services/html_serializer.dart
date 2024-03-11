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
        } else if (item.containsKey('type') && item['type'] == 'ol') {
          html += '<ol>';
          // Recursively call the function for list item children
          html += serialize(item['children']);
          html += '</ol>';
        } else if (item.containsKey('type') && item['type'] == 'h1') {
          html += '<h1>';
          html += serialize(item['children']);
          html += '</h1>';
        } else if (item.containsKey('type') && item['type'] == 'h2') {
          html += '<h2>';
          html += serialize(item['children']);
          html += '</h2>';
        } else if (item.containsKey('type') && item['type'] == 'h3') {
          html += '<h3>';
          html += serialize(item['children']);
          html += '</h3>';
        } else if (item.containsKey('type') && item['type'] == 'h4') {
          html += '<h4>';
          html += serialize(item['children']);
          html += '</h4>';
        } else if (item.containsKey('type') && item['type'] == 'h5') {
          html += '<h5>';
          html += serialize(item['children']);
          html += '</h5>';
        } else if (item.containsKey('type') && item['type'] == 'h6') {
          html += '<h6>';
          html += serialize(item['children']);
          html += '</h6>';
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
