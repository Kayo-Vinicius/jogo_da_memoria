import 'dart:math';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:jogo_da_memoria/constantes.dart';
import 'package:jogo_da_memoria/controles/game_controller.dart';
import 'package:jogo_da_memoria/models/opcao_jogo.dart';
import 'package:jogo_da_memoria/tema.dart';
import 'package:provider/provider.dart';

class CardGame extends StatefulWidget {
  final Modo modo;
  final OpcaoJogo opcaoJogo;

  const CardGame({
    super.key,
    required this.modo,
    required this.opcaoJogo,
  });

  @override
  State<CardGame> createState() => _CardGameState();
}

class _CardGameState extends State<CardGame>
    with SingleTickerProviderStateMixin {
  late final AnimationController animacaoCard;

  @override
  void initState() {
    super.initState();
    animacaoCard = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
  }

  @override
  void dispose() {
    animacaoCard.dispose();
    super.dispose();
  }
  
  AssetImage getImage(double angulo) {
    if (angulo > 0.5 * pi) {
      return AssetImage('imagens/${widget.opcaoJogo.opcao.toString()}.jpeg');
    } else {
      return widget.modo == Modo.normal
          ? const AssetImage('imagens/card_normal.jpeg')
          : const AssetImage('imagens/card_dificil.jpeg');
    }
  }

  flipCard() {
    final game = context.read<GameController>();

    if (!animacaoCard.isAnimating &&
        !widget.opcaoJogo.cardIgual &&
        !widget.opcaoJogo.selecionado &&
        !game.jogadaCompleta) {
      animacaoCard.forward();
      game.escolher(widget.opcaoJogo, resetCard);
    }
  }

  resetCard() {
    animacaoCard.reverse();
  }


  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animacaoCard,
      builder: (BuildContext context, _) {
        final angulo = animacaoCard.value * pi;
        final transforma = Matrix4.identity()
          ..setEntry(3, 2, 0.002)
          ..rotateY(angulo);

        return GestureDetector(
          onTap: () => flipCard(),
          child: Transform(
            transform: transforma,
            alignment: Alignment.center,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: widget.modo == Modo.normal
                      ? Colors.white
                      : TemaJogo.color,
                  width: 2,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: getImage(angulo),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
