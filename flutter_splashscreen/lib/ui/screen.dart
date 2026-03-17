import 'dart:async';
import 'package:flutter/material.dart';
import 'home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _moveController;
  late Animation<Offset> _offsetAnimation;


  @override
  void initState() {
    super.initState();

    _moveController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0, -2), 
      end: const Offset(0, 0), 
    ).animate(CurvedAnimation(
      parent: _moveController,
      curve: Curves.easeOut,
    ));


    _moveController.forward();


    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const Home(title: 'Home'),
        ),
      );
    });
  }

  @override
  void dispose() {
    _moveController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade900,
      body: Center(
          child: SlideTransition(
            position: _offsetAnimation,
            child: Image.asset(
              'assets/logo.png',
              width: 200,
              height: 200,
            ),
          ),
        ),
      );  }
}