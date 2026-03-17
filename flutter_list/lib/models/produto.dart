class Produto {
  int id = 0;
  String nome = '';
  String descricao = '';
  double preco = 0.0;
  String? img;

  Produto(this.id, this.nome, this.descricao, this.preco, [this.img]);
}