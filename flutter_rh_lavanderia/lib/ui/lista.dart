import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Lista extends StatefulWidget {
  const Lista({super.key});

  @override
  State<Lista> createState() => _ListaState();
}

class _ListaState extends State<Lista> {
  List funcionarios = [];

  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  Future<void> carregarDados() async {
    final String response =
        await rootBundle.loadString('assets/dados/funcionarios.json');

    final data = json.decode(response);

    setState(() {
      funcionarios = data; 
    });
  }

  void mostrarFuncionario(dynamic func) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(func['nome']),
          content: Text(
            'Cargo: ${func['cargo']}\n'
            'Salário: R\$ ${func['salario'].toStringAsFixed(2)}\n'
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Fechar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Funcionários'),
      ),
      body: funcionarios.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: funcionarios.length,
              itemBuilder: (context, index) {
                final func = funcionarios[index];

                return ListTile(
                  leading: Icon(Icons.person),
                  title: Text(func['nome']),
                  subtitle: Text(func['cargo']),
                  onTap: () => mostrarFuncionario(func),
                );
              },
            ),
    );
  }
}