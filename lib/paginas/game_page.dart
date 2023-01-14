import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:jogo_da_memoria/controles/game_controller.dart';
import 'package:jogo_da_memoria/models/game_play.dart';
import 'package:jogo_da_memoria/models/opcao_jogo.dart';
import 'package:jogo_da_memoria/paginas/modo_jogo.dart';
import 'package:jogo_da_memoria/tema.dart';
import 'package:jogo_da_memoria/widgets/game_score.dart';
import 'package:jogo_da_memoria/widgets/nivel_jogo.dart';
import 'package:jogo_da_memoria/constantes.dart';
import 'package:jogo_da_memoria/widgets/card_game.dart';
import 'package:jogo_da_memoria/config_jogo.dart';
import 'package:provider/provider.dart';
import 'package:jogo_da_memoria/widgets/feedback_game.dart';

class GamePage extends StatelessWidget {
  final GamePlay gamePlay;

  const GamePage({
    super.key,
    required this.gamePlay,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<GameController>(context);
    
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: GameScore(modo: gamePlay.modo),
      ),
      body: Observer(
        builder: (_) {
          if (controller.venceu) {
            return const FeedbackGame(resultado: Resultado.aprovado);
          } else if (controller.perdeu) {
            return const FeedbackGame(resultado: Resultado.eliminado);
          } else {
            return Center(
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: ConfigJogo.gameBoardAxisCount(gamePlay.nivel),
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
                padding: const EdgeInsets.all(24),
                children: controller.gameCard
                    .map((OpcaoJogo opJogo) =>
                        CardGame(modo: gamePlay.modo, opcaoJogo: opJogo))
                    .toList(),
              ),
            );
          }
        },
      ),
    );
  }
}
