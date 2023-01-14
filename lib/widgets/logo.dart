import 'package:flutter/material.dart';
import 'package:jogo_da_memoria/tema.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: Image.asset(
            'imagens/logo.jpeg',
            width: 80,
            height: 80,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 80),
          child: RichText(
            text: TextSpan(
              text: 'Jogo da',
              style: DefaultTextStyle.of(context).style.copyWith(fontSize: 30),
              children: const[
                TextSpan(text: ' Memoria',
                style: TextStyle(color: TemaJogo.color),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
