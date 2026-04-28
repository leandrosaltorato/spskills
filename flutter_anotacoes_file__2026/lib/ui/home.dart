import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '/models/anotacao.dart';
import '../database/helper.dart';
import '/ui/style/colors.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Anotacao> dados = [];

  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  Future<void> carregarDados() async {
    final lista = await DatabaseHelper.instance.getAllNotes();

    setState(() {
      dados = lista;
    });
  }

  void modalAdd(String? anotacao, int? id) {
    final controller = TextEditingController(text: anotacao ?? '');

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Adicionar Anotação'),
          content: TextField(
            controller: controller,
            style: TextStyle(color: AppColors.p1),
            maxLines: null,
            minLines: 5,
            keyboardType: TextInputType.multiline,
            decoration: const InputDecoration(
              hintText: "Digite sua anotação aqui",
            ),
          ),
          actions: [
            TextButton(
              onPressed: () async {
                final texto = controller.text;

                Navigator.of(context).pop();

                if (texto.trim().isEmpty) return;

                final nota = Anotacao(
                  content: texto,
                  date: DateTime.now().toIso8601String(),
                );

                await DatabaseHelper.instance.insertNote(nota);

                await carregarDados(); 
              },
              child: const Text('Salvar'),
            ),
          ],
        );
      },
    );
  }

  void modalDelete(int id) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Excluir Anotação'),
          content: const Text('Tem certeza que deseja excluir esta anotação?'),
          actions: [
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop();
                await DatabaseHelper.instance.deleteNote(id);
                await carregarDados();
              },
              child: const Text('Sim'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Não'),
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
        title: const Text('Anotações'),
        actions: [
          GestureDetector(
            onTap: () => modalAdd(null, null),
            child: Container(
              margin: const EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                color: AppColors.p4,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.add, color: AppColors.p1, size: 35),
            ),
          ),
        ],
      ),
      body: Center(
        child: ListView.separated(
          itemCount: dados.length,
          separatorBuilder: (_, _) => const Divider(),
          itemBuilder: (context, i) {
            return ListTile(
              title: Text(
                dados[i].content.length > 30
                    ? '${dados[i].content.substring(0, 30)}...'
                    : dados[i].content,
              ),
              subtitle: Text(
                DateFormat('dd/MM/yyyy HH:mm')
                    .format(DateTime.parse(dados[i].date)),
              ),
              trailing: GestureDetector(
                onTap: () => modalDelete(dados[i].id!),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.p1,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.delete, color: AppColors.p4),
                ),
              ),
              onTap: () => modalAdd(dados[i].content, dados[i].id),
            );
          },
        ),
      ),
    );
  }
}