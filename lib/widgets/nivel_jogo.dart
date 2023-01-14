import 'package:flutter/material.dart';
import 'package:jogo_da_memoria/controles/game_controller.dart';
import 'package:jogo_da_memoria/models/game_play.dart';
import 'package:jogo_da_memoria/paginas/modo_jogo.dart';
import 'package:jogo_da_memoria/tema.dart';
import 'package:jogo_da_memoria/constantes.dart';
import 'package:jogo_da_memoria/paginas/game_page.dart';
import 'package:jogo_da_memoria/widgets/card_game.dart';
import 'package:provider/provider.dart';

class NivelJogo extends StatelessWidget {
  final GamePlay gamePlay;

  const NivelJogo({
    super.key,
    required this.gamePlay,
  });

  startGame(BuildContext context) {
    context.read<GameController>().startGame(gamePlay: gamePlay);
    
    Navigator.push(
      context,
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (BuildContext context) => GamePage(gamePlay: gamePlay),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => startGame(context),
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: Container(
        width: 90,
        height: 90,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(
            color: gamePlay.modo == Modo.normal ? Colors.white : TemaJogo.color,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: gamePlay.modo == Modo.normal
              ? Colors.transparent
              : TemaJogo.color.withOpacity(.6),
        ),
        child: Center(
          child: Text(
            gamePlay.nivel.toString(),
            style: const TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
  }
}
