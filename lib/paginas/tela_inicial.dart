import 'package:flutter/material.dart';
import 'package:jogo_da_memoria/paginas/modo_jogo.dart';
import 'package:jogo_da_memoria/tema.dart';
import 'package:jogo_da_memoria/widgets/botao.dart';
import 'package:jogo_da_memoria/widgets/logo.dart';
import 'package:jogo_da_memoria/widgets/nivel_jogo.dart';
import 'package:jogo_da_memoria/constantes.dart';

class TelaInicial extends StatelessWidget {
  const TelaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Logo(),
            BotaoIniciar(
              titulo: 'Modo Normal',
              color: Colors.white,
              acaoClique: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) =>
                      const ModoJogo(modo: Modo.normal),
                ),
              ),
            ),
            BotaoIniciar(
              titulo: 'Modo Dificil',
              color: TemaJogo.color,
              acaoClique: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) =>
                      const ModoJogo(modo: Modo.dificil),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
