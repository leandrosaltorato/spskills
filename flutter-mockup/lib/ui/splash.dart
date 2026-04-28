import 'package:flutter/material.dart';
import 'home.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with TickerProviderStateMixin {
  late AnimationController _vertical, _horizontal;
  double _x = 0, _y = -500;

  @override
  void initState() {
    super.initState();
    movimentos();
    entrada();
  }

  void movimentos() {
    _vertical =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800))
          ..addListener(() {
            setState(() {
              _y = _vertical.value * 500 - 500;
            });
          });

    _horizontal =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800))
          ..addListener(() {
            setState(() {
              _x = _horizontal.value * 300;
            });
          });
  }

  void resetAnimation() {
    _horizontal.reset();
    _vertical.reset();
    setState(() {
      _x = 0;
      _y = -500;
    });
  }

  void entrada() {
    _vertical.forward();
  }

  void saida() {
    _vertical.reverse().then((value) => irParaHome());
  }

  void irParaHome() async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Home()),
    );
    resetAnimation();
    entrada();
  }

  @override
  void dispose() {
    super.dispose();
    _vertical.dispose();
    _horizontal.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Funcionarios")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 40,
          children: [
            Transform.translate(
              offset: Offset(_x, _y),
              child: Image.asset('assets/icone.png', width: 150),
            ),
            ElevatedButton(onPressed: saida, child: Text("Entrar")),
          ],
        ),
      ),
    );
  }
}
