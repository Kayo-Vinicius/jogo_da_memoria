import 'package:flutter/material.dart';
import 'package:jogo_da_memoria/tema.dart';

class BotaoIniciar extends StatelessWidget {
  final String titulo;
  final Color color;
  final Function acaoClique;

  const BotaoIniciar(
      {super.key,
      required this.titulo,
      required this.color,
      required this.acaoClique});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: OutlinedButton(
        style: TemaJogo.estiloBotao(color: color),
        onPressed: () => acaoClique(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              titulo,
              style: const TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
