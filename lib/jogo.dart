import 'dart:math';

import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  const Jogo({Key? key}) : super(key: key);

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  AssetImage _imagemApp = const AssetImage("assets/images/padrao.png");
  String _mensagem = "Escolha uma das opções abaixo";

  // Coloca-se o "_" no início do nome do método para indicar que este método não pode ser executado fora desta classe
  void _opcaoSelecionada(String escolhaUsuario) {
    List<String> opcoes = [
      "pedra",
      "papel",
      "tesoura",
    ];

    int numero = Random().nextInt(3);
    String escolhaAdversario = opcoes[numero];

    // Controle de exibição aleatória da imagem escolhida pelo adversário
    switch(escolhaAdversario) {
      case "pedra":
        setState(() {
          _imagemApp = const AssetImage("assets/images/pedra.png");
        });
        break;
      case "papel":
        setState(() {
          _imagemApp = const AssetImage("assets/images/papel.png");
        });
        break;
      case "tesoura":
        setState(() {
          _imagemApp = const AssetImage("assets/images/tesoura.png");
        });
        break;
    }

    // Validação o resultado da jogada
    if(
      (escolhaUsuario == "pedra" && escolhaAdversario == "tesoura")
      || (escolhaUsuario == "tesoura" && escolhaAdversario == "papel")
      || (escolhaUsuario == "papel" && escolhaAdversario == "pedra")
    ) { // Usuário ganhador
      setState(() {
        _mensagem = "Você ganhou!!!";
      });
    } else if(
      (escolhaUsuario == "pedra" && escolhaAdversario == "papel")
      || (escolhaUsuario == "tesoura" && escolhaAdversario == "pedra")
      || (escolhaUsuario == "papel" && escolhaAdversario == "tesoura")
    ) { // Adversário ganhador
      setState(() {
        _mensagem = "Você perdeu!!!";
      });
    } else { // Resultado de empate
      setState(() {
        _mensagem = "Empate!!!";
      });
    }
  }

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
                Image(image: _imagemApp),
                Padding(
                  padding: const EdgeInsets.only(top: 32, bottom: 16),
                  child: Text(
                    _mensagem,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => _opcaoSelecionada("pedra"),
                      child: Image.asset("assets/images/pedra.png", height: 100, width: 100),
                    ),
                    const SizedBox(width: 8),
                    GestureDetector(
                      onTap: () => _opcaoSelecionada("papel"),
                      child: Image.asset("assets/images/papel.png", height: 100, width: 100),
                    ),
                    const SizedBox(width: 8),
                    GestureDetector(
                      onTap: () => _opcaoSelecionada("tesoura"),
                      child: Image.asset("assets/images/tesoura.png", height: 100, width: 100),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
