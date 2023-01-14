class ConfigJogo {
  static const niveis = [4, 16, 24, 28];
  static const cardOpcoes = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14];

  static gameBoardAxisCount(int nivel) {
    if (nivel <= 16) {
      return 4;
    } else if (nivel == 24 || nivel == 28) {
      return 4;
    }
  }
}
