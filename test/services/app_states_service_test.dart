import 'package:flutter_test/flutter_test.dart';
import 'package:food_bite/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('AppStatesServiceTest -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
