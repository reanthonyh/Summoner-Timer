import 'package:flutter_test/flutter_test.dart';
import 'package:summoner_timer/core/utils/result.dart';

void main() {
  group('Result', () {
    test('success returns correct data', () {
      const result = Result.success('test data');

      String? capturedData;
      result.when(
        success: (data) => capturedData = data,
        failure: (_) => fail('Should not be failure'),
      );
      expect(capturedData, 'test data');
    });

    test('failure returns correct error', () {
      final exception = Exception('test error');
      final result = Result<String, Exception>.failure(exception);

      Exception? capturedError;
      result.when(
        success: (_) => fail('Should not be success'),
        failure: (error) => capturedError = error,
      );
      expect(capturedError, exception);
    });

    test('success with complex type works correctly', () {
      final result = Result.success({'key': 'value', 'count': 5});

      Map<String, dynamic>? captured;
      result.when(
        success: (data) => captured = data,
        failure: (_) => fail('Should not be failure'),
      );
      expect(captured?['key'], 'value');
      expect(captured?['count'], 5);
    });

    test('maybeMap handles success case', () {
      const result = Result.success(42);

      final value = result.maybeMap(success: (s) => s.data * 2, orElse: () => 0);

      expect(value, 84);
    });

    test('maybeMap handles failure case', () {
      final result = Result<int, Exception>.failure(Exception('error'));

      final value = result.maybeMap(success: (s) => s.data * 2, orElse: () => -1);

      expect(value, -1);
    });

    test('map transforms success correctly', () {
      const result = Result.success(10);

      final mapped = result.map(success: (s) => s.data * 3, failure: (f) => 0);

      expect(mapped, 30);
    });

    test('map handles failure case', () {
      final result = Result<int, Exception>.failure(Exception('error'));

      final mapped = result.map(success: (s) => s.data * 3, failure: (f) => -1);

      expect(mapped, -1);
    });

    test('mapOrNull returns null on failure', () {
      final result = Result<String, Exception>.failure(Exception('error'));

      final value = result.mapOrNull(success: (s) => s.data.toUpperCase());

      expect(value, null);
    });

    test('mapOrNull returns transformed value on success', () {
      const result = Result.success('hello');

      final value = result.mapOrNull(success: (s) => s.data.toUpperCase());

      expect(value, 'HELLO');
    });
  });
}
