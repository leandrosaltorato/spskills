import 'package:anotacoes/ui/style/theme.dart';

import '/ui/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Anotações',
    theme: AppTheme.appTheme,
    home: Splash(),
  ));
}
