import 'package:flutter/material.dart';
import 'package:jogo_da_memoria/config_jogo.dart';
import 'package:jogo_da_memoria/constantes.dart';
import 'package:jogo_da_memoria/models/game_play.dart';
import 'package:jogo_da_memoria/widgets/nivel_jogo.dart';
//import 'package:jogo_da_memoria/constants.dart';

class ModoJogo extends StatelessWidget {
  final Modo modo;

  const ModoJogo({super.key, required this.modo});

  @override
  Widget build(BuildContext context) {
    final niveis = ConfigJogo.niveis
        .map((n) => NivelJogo(gamePlay: GamePlay(modo: modo, nivel: n)))
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nivel do Jogo'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 48),
        child: GridView.count(
          crossAxisCount: 3,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          padding: const EdgeInsets.all(24),
          children: niveis,
        ),
      ),
    );
  }
}
