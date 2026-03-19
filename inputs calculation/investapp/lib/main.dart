import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Simulador',
      home: App(),
    ),
  );
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {

  double investimento = 0;
  int meses = 0;
  double juros = 0;

  double totalSemJuros = 0;
  double totalComJuros = 0;

  void calcular() {

    double taxa = juros / 100;

    totalSemJuros = investimento * meses;

    totalComJuros = 0;

    for (int i = 0; i < meses; i++) {
      totalComJuros = (totalComJuros + investimento) * (1 + taxa);
    }

    setState(() {});
  }

  void alert(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Resultado"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Valor total com juros compostos: R\$ ${totalComJuros.toStringAsFixed(2)}",
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("OK"),
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
        title: Center(child: Text("Simulador de Investimentos")),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 22),
        backgroundColor: const Color.fromARGB(255, 55, 128, 57),
      ),

      body: Padding(
        padding: EdgeInsets.all(15),

        child: Column(
          spacing: 40,

          children: [

            Text(
              "Investimento mensal:",
              style: TextStyle(fontSize: 18),
            ),

            TextField(
              decoration: InputDecoration(
                labelText: "Digite o valor",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: (v) {
                investimento = double.tryParse(v) ?? 0;
              },
            ),

            Text(
              "Número de meses:",
              style: TextStyle(fontSize: 18),
            ),

            TextField(
              decoration: InputDecoration(
                labelText: "Quantos meses deseja investir",
                border: OutlineInputBorder(),
              ),
              onChanged: (v) {
                meses = int.tryParse(v) ?? 0;
              },
            ),

            Text(
              "Taxa de juros ao mês:",
              style: TextStyle(fontSize: 18),
            ),

            TextField(
              decoration: InputDecoration(
                labelText: "Digite a taxa de juros",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: (v) {
                juros = double.tryParse(v) ?? 0;
              },
            ),

            ElevatedButton(
              onPressed: () {
                calcular();
                alert(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
              child: Text(
                "Simular",
                style: TextStyle(color: Colors.white),
              ),
            ),

            Text(
              "Valor total sem juros: R\$ ${totalSemJuros.toStringAsFixed(2)}",
              style: TextStyle(fontSize: 16),
            ),

            Text(
              "Valor total com juros compostos: R\$ ${totalComJuros.toStringAsFixed(2)}",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}