import 'package:flutter/material.dart';
import '/root/theme.dart';
import '/ui/splash.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Funcionarios",
      theme: AppTheme.appTheme,
      home: Splash(),
    ),
  );
}
