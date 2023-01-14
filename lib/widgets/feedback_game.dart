import 'package:flutter/material.dart';
import 'package:jogo_da_memoria/constantes.dart';
import 'package:jogo_da_memoria/controles/game_controller.dart';
import 'package:jogo_da_memoria/widgets/botao.dart';
import 'package:provider/provider.dart';

class FeedbackGame extends StatelessWidget {
  final Resultado resultado;

  const FeedbackGame({
    super.key,
    required this.resultado,
  });

  String getResultado() {
    return resultado == Resultado.aprovado ? 'aprovado' : 'eliminado';
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.read<GameController>();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            '${getResultado().toUpperCase()}!',
            style: const TextStyle(fontSize: 30),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Image.asset('imagens/${getResultado()}.jpeg'),
          ),
          resultado == Resultado.eliminado
              ? BotaoIniciar(
                  titulo: 'Tentar Novamente',
                  color: Colors.white,
                  acaoClique: () => controller.reiniciarJogo(),
                )
              : BotaoIniciar(
                  titulo: 'Proximo Nivel',
                  color: Colors.white,
                  acaoClique: () => controller.proximoNivel(),
                )
        ],
      ),
    );
  }
}
