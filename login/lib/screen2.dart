import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ola')),
      body: const Center(
        child: Text(
          'ola matheus',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}