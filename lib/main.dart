import 'package:flutter/material.dart';
import 'package:sa2/view/login_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Autenticação e Configurações',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: LoginView(),
    );
  }
}
