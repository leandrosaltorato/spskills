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
  double corrente = 0;
  double distancia = 0;

  double bitola110 = 0;
  double bitola220 = 0;

  void calcular() {

    bitola110 = (2 * corrente * distancia) / 294.64;
    bitola220 = (2 * corrente * distancia) / 510.4;

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
                "A bitola recomendada para Tensão 127V é: ${bitola110.toStringAsFixed(2)}",
              ),
              Text("A bitola recomendada para Tensão 220V é: ${bitola220.toStringAsFixed(2)}"),
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
        title: Center(child: Text("Calculadora de bitola(mm2)")),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 25.0),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          spacing: 20,
          children: [
            Text("Elétrica residencial de cobre:", style: TextStyle(fontSize: 20)),

            Text("Distancia em metros:", style: TextStyle(fontSize: 20)),

            TextField(
              decoration: InputDecoration(
                labelText: "Digite a distância",
                border: OutlineInputBorder(),
              ),
              onChanged: (v) {
                distancia = double.parse(v);
              },
            ),

            Text("Corrente:", style: TextStyle(fontSize: 20)),

            TextField(
              decoration: InputDecoration(
                labelText: "Digite a corrente em amperes",
                border: OutlineInputBorder(),
              ),
              onChanged: (v) {
                corrente = double.parse(v);
              },
            ),


            ElevatedButton(
              onPressed: () {
                calcular();
                alert(context);
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
              child: Text("Calcular", 
              style: TextStyle(color: Colors.white),
              ),
            ),

            Text(
              "A bitola recomendada para Tensão 127V é: ${bitola110.toStringAsFixed(2)}",
              style: TextStyle(fontSize: 16),
            ),

            Text(
              "A bitola recomendada para Tensão 220V é: ${bitola220.toStringAsFixed(2)}",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
