import '/ui/home.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with TickerProviderStateMixin {
  late AnimationController _entrada, _saida;
  double _angulo = 0, _opacidade = 1.0;

  @override
  void initState() {
    super.initState();
    entrada();
  }

  void entrada() {
    _opacidade = 1.0;
    _entrada =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500))
          ..addListener(() {
            setState(() {
              _angulo = _entrada.value * 2 * 3.14;
            });
          });
    _entrada.forward();
  }

  void saida() async {
    _saida = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _saida.addListener(() {
      setState(() {
        _opacidade = 1.0 - _saida.value;
      });
    });
    await _saida.forward();
    if (mounted) {
      await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Home()),
      );
      entrada();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _saida.dispose();
    _entrada.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Transform.rotate(
              angle: _angulo,
              child: GestureDetector(
                onTap: entrada,
                child: Image.asset(
                  "assets/icone.png",
                  width: 150,
                  opacity: AlwaysStoppedAnimation(_opacidade),
                ),
              ),
            ),
            ElevatedButton(onPressed: saida, child: const Text("Iniciar")),
          ],
        ),
      ),
    );
  }
}
