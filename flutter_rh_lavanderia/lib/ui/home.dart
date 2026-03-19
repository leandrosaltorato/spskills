import 'package:flutter/material.dart';
import 'lista.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('RH Lavanderia')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/lavanderia.png', height: 200),

          SizedBox(height: 20),

          Center(
            child: ElevatedButton(
              child: Text('Ver Funcionários'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Lista()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
