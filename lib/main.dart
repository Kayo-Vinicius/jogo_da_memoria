import 'package:flutter/material.dart';
import 'package:jogo_da_memoria/controles/game_controller.dart';
import 'package:jogo_da_memoria/paginas/tela_inicial.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jogo_da_memoria/tema.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider<GameController>(create: (_) => GameController()),
      ],
      child: const App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animes Memory',
      debugShowCheckedModeBanner: false,
      theme: TemaJogo.tema,
      home: const TelaInicial(),
    );
  }
}
