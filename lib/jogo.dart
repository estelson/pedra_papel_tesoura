import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  const Jogo({Key? key}) : super(key: key);

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pedra, Papel, Tesoura"),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 32, bottom: 16),
                  child: Text(
                    "Escolha do adversário",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Image.asset("assets/images/padrao.png"),
                const Padding(
                  padding: EdgeInsets.only(top: 32, bottom: 16),
                  child: Text(
                    "Escolha uma das opções abaixo",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/pedra.png", height: 100, width: 100),
                    const SizedBox(width: 8),
                    Image.asset("assets/images/papel.png", height: 100, width: 100),
                    const SizedBox(width: 8),
                    Image.asset("assets/images/tesoura.png", height: 100, width: 100),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
