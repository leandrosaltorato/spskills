class Roupa {
  final int id;
  final String nome;
  final double preco;
  final String categoria;
  final String marca;
  final String? img;

  Roupa({
    required this.id,
    required this.nome,
    required this.preco,
    required this.categoria,
    required this.marca,
    this.img,
  });

  factory Roupa.fromJson(Map<String, dynamic> json) {
    return Roupa(
      id: json['id'],
      nome: json['nome'],
      preco: double.parse(json['preco'].toString()),
      categoria: json['categoria'] ?? '',
      marca: json['marca'] ?? '',
      img: json['img'],
    );
  }
}
