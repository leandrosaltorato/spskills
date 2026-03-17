import 'package:flutter/material.dart';
import '/models/produto.dart';

class Produtos extends StatefulWidget {
  const Produtos({super.key});

  @override
  State<Produtos> createState() => _ProdutosState();
}

class _ProdutosState extends State<Produtos> {
  List<Produto> produtos = [];
  List<Produto> filtrados = [];

  @override
  void initState() {
    super.initState();
    produtos.add(Produto(1, "Lapis", "Lapis Preto B1", 1.99));
    produtos.add(Produto(2, "Lapis", "Lapis Preto B2", 1.99));
    produtos.add(Produto(3, "Lapis", "Lapis Preto B3", 1.99));
    produtos.add(Produto(4, "Borracha", "Borracha branca", 3.49));
    produtos.add(Produto(5, "Borracha", "Borracha duas cores", 4.49));
    produtos.add(Produto(6, "Caneta", "Caneta Bic Azul", 4.99));
    produtos.add(Produto(7, "Caneta", "Caneta Bic Preta", 4.99));
    produtos.add(Produto(8, "Caneta", "Caneta Bic Vermelha", 4.99));
    produtos.add(Produto(9, "Caneta", "Caneta Bic Verde", 4.99));
    filtrados = produtos;
  }

  void filtrar(String filtro) {
    setState(() {
      filtrados = produtos
          .where(
            (produto) =>
                produto.descricao.toLowerCase().contains(filtro.toLowerCase()),
          )
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Lista de Produtos")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "Filtrar...",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) => filtrar(value),
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, i) {
                  return ListTile(
                    leading: Text(filtrados[i].id.toString()),
                    title: Text(filtrados[i].nome),
                    subtitle: Text(filtrados[i].descricao),
                    trailing: Text(filtrados[i].preco.toStringAsFixed(2)),
                  );
                },
                separatorBuilder: (_, _) => Divider(),
                itemCount: filtrados.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}