import 'dart:convert';

import 'package:flutter/material.dart';
import '/root/colors.dart';
import '/root/modais.dart';
import '/root/style.dart';
import 'package:http/http.dart' as http;
import 'home.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool olho = true;
  String mock =
      "https://raw.githubusercontent.com/wellifabio/senai2025/refs/heads/main/assets/mockups/usuarios.json";
  String email = '';
  String senha = '';
  List<dynamic> usuarios = [];

  @override
  void initState() {
    super.initState();
    carregarAPIMock();
  }

  void carregarAPIMock() async {
    try {
      final resp = await http.get(Uri.parse(mock));
      if (resp.statusCode == 200) {
        usuarios = json.decode(resp.body);
      } else {
        if (mounted) {
          Mod.msg(context, 'erro ao carregar dados da API');
        }
      }
    } catch (e) {
      if (mounted) {
        Mod.msg(context, 'erro ao carregar dados da API: $e');
      }
    }
  }

  void entrar() {
    int indice = -1;
    indice = usuarios.indexWhere((e) =>e['email'] == email);
    if(indice != -1){
      if(usuarios[indice]['senha']==senha){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> Home()));
      }else{
        if(mounted){
        Mod.msg(context, "Senha não confere");
      }
      }
    }else{
      if(mounted){
        Mod.msg(context, "E-mail nao encontrado");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 20,
            children: [
              Text("Papelaria", style: AppSt.titulo),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'E-mail',
                  labelStyle: AppSt.texto,
                ),
                onChanged: (value) {
                  email = value;
                },
              ),
              TextField(
                obscureText: olho,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Senha',
                  labelStyle: AppSt.texto,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        olho = !olho;
                      });
                    },
                    icon: Icon(olho ? Icons.visibility_off : Icons.visibility),
                  ),
                ),
                onChanged: (value) {
                  senha = value;
                },
              ),
              ElevatedButton(
                onPressed: () => entrar(),
                style: ElevatedButton.styleFrom(backgroundColor: AppColors.p5),
                child: Text("Entrar", style: TextStyle(color: AppColors.p1),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}