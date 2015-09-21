// Copyright (c) 2015, the tuple project authors. Please see the AUTHORS
// file for details. All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

library tuple.test;

import 'package:test/test.dart';
import 'package:tuple/tuple.dart';

main() {
  group("Tuple tests", () {
    final t = new Tuple2<int, bool>(1, true);

    test('items', () {
      expect(t.item1, equals(1));
      expect(t.item2, equals(true));
    });

    test('withItems', () {
      expect(t.withItem1(2), equals(new Tuple2<int, bool>(2, true)));
      expect(t.withItem2(false), equals(new Tuple2<int, bool>(1, false)));
    });

    test('equality', () {
      final otherT = new Tuple2<int, bool>(1, true);
      expect(t, equals(otherT));
    });

    test('nested equality', () {
      final t1 = new Tuple2<Tuple2<int, String>, bool>(
          new Tuple2<int, String>(3, 'a'), false);
      final t2 = new Tuple2<Tuple2<int, String>, bool>(
          new Tuple2<int, String>(3, 'a'), false);
      expect(t1, equals(t2));
    });

    test('can be used as keys in maps', () {
      final map = {t: 'a'};
      final key = new Tuple2<int, bool>(1, true);
      expect(map[key], equals('a'));
    });
  });
}