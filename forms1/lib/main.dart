import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SumForm(),
    );
  }
}

class SumForm extends StatefulWidget {
  const SumForm({super.key});

  @override
  State<SumForm> createState() => SumState();
}

class SumState extends State<SumForm> {
  TextEditingController num1 = TextEditingController();
  TextEditingController num2 = TextEditingController();

  void calcularSoma() {
    double n1 = double.tryParse(num1.text) ?? 0;
    double n2 = double.tryParse(num2.text) ?? 0;
    double soma = n1 + n2;


    int resultadofinal = soma.toInt();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Resultado"),
          content: Text("A soma é: $resultadofinal"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("OK"),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Soma")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: num1,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Campo 1",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              TextField(
                controller: num2,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Campo 2",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: calcularSoma,
                    child: const Text("Somar"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}