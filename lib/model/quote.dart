class Quote {
  int id;
  String quote;
  String author;

  Quote({required this.id, required this.author, required this.quote});

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(id: json['id'], author: json['author'], quote: json['quote']);
  }
}
