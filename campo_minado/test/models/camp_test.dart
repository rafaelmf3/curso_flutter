import 'package:campo_minado/models/camp.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group('Camp', () {
    test('Open Camp WITH Explosion', () {
      Camp c = Camp(line: 0, column: 0);
      c.mining();

      expect(c.open, throwsException);
    });

    test('Open Camp WITHOUT Explosion', () {
      Camp c = Camp(line: 0, column: 0);
      c.open();

      expect(c.opened, isTrue);
    });

    test('Add Neighbor', () {
      Camp c1 = Camp(line: 0, column: 0);
      Camp c2 = Camp(line: 1, column: 3);
      c1.addNeighbor(c2);
      expect(c1.neighbors.isEmpty, isTrue);
    });

    test('Add NOT Neighbor', () {
      Camp c1 = Camp(line: 3, column: 3);
      Camp c2 = Camp(line: 3, column: 4);
      Camp c3 = Camp(line: 2, column: 2);
      Camp c4 = Camp(line: 4, column: 4);
      c1.addNeighbor(c2);
      c1.addNeighbor(c3);
      c1.addNeighbor(c4);
      expect(c1.neighbors.length, 3);
    });

    test('Neighborhood Mines', () {
      Camp c1 = Camp(line: 3, column: 3);
      Camp c2 = Camp(line: 3, column: 4);
      c2.mining();
      Camp c3 = Camp(line: 2, column: 2);
      Camp c4 = Camp(line: 4, column: 4);
      c4.mining();

      c1.addNeighbor(c2);
      c1.addNeighbor(c3);
      c1.addNeighbor(c4);

      expect(c1.numberOfNeighborhoodMines, 2);
    });
  });
}
