import 'package:jogo_da_memoria/config_jogo.dart';
import 'package:jogo_da_memoria/constantes.dart';
import 'package:jogo_da_memoria/models/game_play.dart';
import 'package:jogo_da_memoria/models/opcao_jogo.dart';
import 'package:mobx/mobx.dart';

part 'game_controller.g.dart';

class GameController = GameControllerBase with _$GameController;

abstract class GameControllerBase with Store {
  @observable
  List<OpcaoJogo> gameCard = [];

  @observable
  int score = 0;

  @observable
  bool venceu = false;

  @observable
  bool perdeu = false;

  late GamePlay _gamePlay;
  List<OpcaoJogo> _cartaEscolhida = [];
  List<Function> _escolhaIgual = [];
  int _acertos = 0;
  int _numPares = 0;

  @computed
  bool get jogadaCompleta => (_cartaEscolhida.length == 2);

  startGame({required GamePlay gamePlay}) {
    _gamePlay = gamePlay;
    _acertos = 0;
    _numPares = (_gamePlay.nivel / 2).round();
    venceu = false;
    perdeu = false;

    _resetScore();
    _gerarCard();
  }

  _resetScore() {
    _gamePlay.modo == Modo.normal ? score = 0 : score = _gamePlay.nivel;
  }

  _gerarCard() {
    List<int> cardOpocoes = ConfigJogo.cardOpcoes.sublist(0)..shuffle();
    cardOpocoes = cardOpocoes.sublist(0, _numPares);
    gameCard = [...cardOpocoes, ...cardOpocoes]
        .map((opcao) =>
            OpcaoJogo(opcao: opcao, cardIgual: false, selecionado: false))
        .toList();
    gameCard.shuffle();
  }

  escolher(OpcaoJogo opcao, Function resetCard) async {
    opcao.selecionado = true;
    _cartaEscolhida.add(opcao);
    _escolhaIgual.add(resetCard);

    await _compararEscolha();
  }

  _compararEscolha() async {
    if (jogadaCompleta) {
      if (_cartaEscolhida[0].opcao == _cartaEscolhida[1].opcao) {
        _acertos++;
        _cartaEscolhida[0].cardIgual = true;
        _cartaEscolhida[1].cardIgual = true;
      } else {
        await Future.delayed(const Duration(seconds: 1), () {
          for (var i in [0, 1]) {
            _cartaEscolhida[i].selecionado = false;
            _escolhaIgual[i]();
          }
        });
      }
      _resetJogada();
      _updateScore();
      _checarResultado();
    }
  }

  _checarResultado() async {
    bool allMatched = _acertos == _numPares;
    if (_gamePlay.modo == Modo.normal) {
      await _checarResultadoNormal(allMatched);
    } else {
      await _checarResultadoDificil(allMatched);
    }
  }

  _checarResultadoNormal(bool allMatched) async {
    await Future.delayed(const Duration(seconds: 1), () => venceu = allMatched);
  }

  _checarResultadoDificil(bool allMatched) async {
    if (_chancesAcabaram()) {
      await Future.delayed(const Duration(seconds: 1), () => perdeu = true);
    }
    if (allMatched && score >= 0) {
      await Future.delayed(
          const Duration(seconds: 1), () => venceu = allMatched);
    }
  }

  _chancesAcabaram() {
    return score < _numPares - _acertos;
  }

  _resetJogada() {
    _cartaEscolhida = [];
    _escolhaIgual = [];
  }

  _updateScore() {
    _gamePlay.modo == Modo.normal ? score++ : score--;
  }

  reiniciarJogo() {
    startGame(gamePlay: _gamePlay);
  }

  proximoNivel() {
    int nivelIndex = 0;

    if (_gamePlay.nivel != ConfigJogo.niveis.last) {
      nivelIndex = ConfigJogo.niveis.indexOf(_gamePlay.nivel) + 1;
    }

    _gamePlay.nivel = ConfigJogo.niveis[nivelIndex];
    startGame(gamePlay: _gamePlay);
  }
}
