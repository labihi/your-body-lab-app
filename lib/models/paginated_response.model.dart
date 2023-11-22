class PaginatedResponse<T> {
  final List<T> docs;
  final bool hasNextPage;
  final bool hasPrevPage;
  final int limit;
  final int? nextPage;
  final int page;
  final int pagingCounter;
  final int? prevPage;
  final int totalDocs;
  final int totalPages;

  const PaginatedResponse({
    required this.docs,
    required this.hasNextPage,
    required this.hasPrevPage,
    required this.limit,
    required this.nextPage,
    required this.page,
    required this.pagingCounter,
    required this.prevPage,
    required this.totalDocs,
    required this.totalPages,
  });

  factory PaginatedResponse.fromJson(
      Map<String, dynamic> json, Function fromJsonModel) {
    final docs = json['docs'].cast<Map<String, dynamic>>();

    return PaginatedResponse(
      docs: List<T>.from(docs.map((itemsJson) => fromJsonModel(itemsJson))),
      hasNextPage: json['hasNextPage'] as bool,
      hasPrevPage: json['hasPrevPage'] as bool,
      limit: json['limit'] as int,
      nextPage: json['nextPage'] as int?,
      page: json['page'] as int,
      pagingCounter: json['pagingCounter'] as int,
      prevPage: json['prevPage'] as int?,
      totalDocs: json['totalDocs'] as int,
      totalPages: json['totalPages'] as int,
    );
  }
}
