import 'package:flutter/material.dart';
import 'service.dart';
import 'roupa.dart';

class CatalogoScreen extends StatefulWidget {
  const CatalogoScreen({super.key});

  @override
  State<CatalogoScreen> createState() => _CatalogoScreenState();
}

class _CatalogoScreenState extends State<CatalogoScreen> {
  final ApiService _apiService = ApiService();

  List<Roupa> _roupas = [];
  bool _carregando = true;
  String _erro = '';

  @override
  void initState() {
    super.initState();
    _buscarRoupas();
  }

  Future<void> _buscarRoupas() async {
    setState(() {
      _carregando = true;
      _erro = '';
    });

    try {
      final roupas = await _apiService.getRoupas();
      setState(() {
        _roupas = roupas;
        _carregando = false;
      });
    } catch (e) {
      setState(() {
        _erro = 'Erro: $e';
        _carregando = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Catálogo de Roupas'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),

      body: _montarBody(),
    );
  }

  Widget _montarBody() {
    if (_carregando) {
      return Center(child: CircularProgressIndicator());
    }

    if (_erro.isNotEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 48, color: Colors.red),
            SizedBox(height: 12),
            Text(_erro, textAlign: TextAlign.center),
            SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: _buscarRoupas,
              icon: Icon(Icons.refresh),
              label: Text('Tentar novamente'),
            ),
          ],
        ),
      );
    }

    if (_roupas.isEmpty) {
      return Center(child: Text('Nenhum produto encontrado.'));
    }

    return ListView.builder(
      padding: EdgeInsets.all(12),
      itemCount: _roupas.length,
      itemBuilder: (context, index) {
        final roupa = _roupas[index];

        return Card(
          margin: EdgeInsets.only(bottom: 12),
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            contentPadding: EdgeInsets.all(12),

            leading: CircleAvatar(
              backgroundColor: Colors.deepPurple.shade100,
              child: Icon(Icons.checkroom, color: Colors.deepPurple),
            ),
            title: Text(
              roupa.nome,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text('${roupa.marca} - ${roupa.categoria}'),
            trailing: Text(
              'R\$ ${roupa.preco.toStringAsFixed(2)}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
                fontSize: 15,
              ),
            ),
          ),
        );
      },
    );
  }
}
