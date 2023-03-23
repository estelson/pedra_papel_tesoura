import 'package:flutter/material.dart';
import 'package:pedra_papel_tesoura/jogo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Jogo(),
    );
  }
}