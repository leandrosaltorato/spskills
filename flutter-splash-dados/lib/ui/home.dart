import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splash/ui/splash.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String nome = '';
  String idade = '';

  @override
  void initState() {
    super.initState();
    obterDados();
  }

  Future<void> obterDados() async {
    final prefs = await SharedPreferences.getInstance();

    if (prefs.containsKey('nome') && prefs.containsKey('idade')) {
      setState(() {
        nome = json.decode(prefs.getString('nome')!);
        idade = json.decode(prefs.getString('idade')!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Bem-vindo, $nome', style: TextStyle(fontSize: 22)),

            const SizedBox(height: 10),

            if (idade.isNotEmpty)
              Text('Idade: $idade anos', style: TextStyle(fontSize: 18)),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => SplashScreen()),
                );
              },
              child: Text('Voltar'),
            ),
          ],
        ),
      ),
    );
  }
}
