import 'package:campo_minado/models/board.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  test('Game Win', () {
    Board board = Board(
      lines: 2,
      columns: 2,
      bombs: 0,
    );

    board.camps[0].mining();
    board.camps[3].mining();

    //Playing
    board.camps[0].toggleMarqued();
    board.camps[1].open();
    board.camps[2].open();
    board.camps[3].toggleMarqued();

    expect(board.resolved, isTrue);
  });
}
