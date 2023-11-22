class Media {
  String? id;
  String? alt;
  String updatedAt;
  String createdAt;
  String? url;
  String? filename;
  String? mimeType;
  int? filesize;
  int? width;
  int? height;
  Sizes? sizes;

  Media({
    required this.id,
    required this.updatedAt,
    required this.createdAt,
    this.alt,
    this.url,
    this.filename,
    this.mimeType,
    this.filesize,
    this.width,
    this.height,
    this.sizes,
  });

  factory Media.fromJson(Map<String, dynamic> json) {
    return Media(
      id: json['_id'] as String?,
      alt: json['alt'] as String?,
      updatedAt: json['updatedAt'] as String,
      createdAt: json['createdAt'] as String,
      url: json['url'] as String?,
      filename: json['filename'] as String?,
      mimeType: json['mimeType'] as String?,
      filesize: json['filesize'] as int?,
      width: json['width'] as int?,
      height: json['height'] as int?,
      sizes: json['sizes'] != null
          ? Sizes.fromJson(json['sizes'] as Map<String, dynamic>)
          : null,
    );
  }

  static Media fromJsonModel(Map<String, dynamic> json) => Media.fromJson(json);
}

class Sizes {
  Thumbnail? thumbnail;
  Card? card;
  Tablet? tablet;

  Sizes({
    this.thumbnail,
    this.card,
    this.tablet,
  });

  final Map<String, dynamic> _sizes = <String, dynamic>{};
  static Sizes fromJson(Map<String, dynamic> json) {
    final sizes = Sizes();
    json.forEach((key, value) {
      sizes._sizes[key] = value;
    });
    return sizes;
  }

  static Sizes fromJsonModel(Map<String, dynamic> json) => Sizes.fromJson(json);
}

class Thumbnail {
  String? url;
  int? width;
  int? height;
  String? mimeType;
  int? filesize;
  String? filename;

  Thumbnail({
    this.url,
    this.width,
    this.height,
    this.mimeType,
    this.filesize,
    this.filename,
  });

  factory Thumbnail.fromJson(Map<String, dynamic> json) {
    return Thumbnail(
      url: json['url'] as String?,
      width: json['width'] as int?,
      height: json['height'] as int?,
      mimeType: json['mimeType'] as String?,
      filesize: json['filesize'] as int?,
      filename: json['filename'] as String?,
    );
  }

  static Thumbnail fromJsonModel(Map<String, dynamic> json) =>
      Thumbnail.fromJson(json);
}

class Card {
  String? url;
  int? width;
  int? height;
  String? mimeType;
  int? filesize;
  String? filename;

  Card({
    this.url,
    this.width,
    this.height,
    this.mimeType,
    this.filesize,
    this.filename,
  });

  factory Card.fromJson(Map<String, dynamic> json) {
    return Card(
      url: json['url'] as String?,
      width: json['width'] as int?,
      height: json['height'] as int?,
      mimeType: json['mimeType'] as String?,
      filesize: json['filesize'] as int?,
      filename: json['filename'] as String?,
    );
  }

  static Card fromJsonModel(Map<String, dynamic> json) => Card.fromJson(json);
}

class Tablet {
  String? url;
  int? width;
  int? height;
  String? mimeType;
  int? filesize;
  String? filename;

  Tablet({
    this.url,
    this.width,
    this.height,
    this.mimeType,
    this.filesize,
    this.filename,
  });

  factory Tablet.fromJson(Map<String, dynamic> json) {
    return Tablet(
      url: json['url'] as String?,
      width: json['width'] as int?,
      height: json['height'] as int?,
      mimeType: json['mimeType'] as String?,
      filesize: json['filesize'] as int?,
      filename: json['filename'] as String?,
    );
  }

  static Tablet fromJsonModel(Map<String, dynamic> json) =>
      Tablet.fromJson(json);
}
