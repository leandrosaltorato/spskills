class Anotacao {
  final int? id;
  final String content;
  final String date;

  Anotacao({
    this.id,
    required this.content,
    required this.date,
  });

  factory Anotacao.fromMap(Map<String, dynamic> json) => Anotacao(
        id: json['id'],
        content: json['content'],
        date: json['date'],
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'content': content,
        'date': date,
      };
}