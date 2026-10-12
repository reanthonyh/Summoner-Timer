import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:summoner_timer/domain/repositories/session_repository.dart';
import 'package:summoner_timer/domain/usecases/accounts/logout_usecase.dart';
import '../../helpers/mocks.dart';

void main() {
  group('LogoutUseCase', () {
    late MockSessionRepository mockRepository;
    late LogoutUseCase useCase;

    setUp(() {
      mockRepository = MockSessionRepository();
      useCase = LogoutUseCase(repository: mockRepository);
    });

    test('clears session repository', () {
      mockRepository.whenClear();

      useCase();

      verify(() => mockRepository.clear()).called(1);
    });

    test('can be called multiple times', () {
      mockRepository.whenClear();
      mockRepository.whenClear();

      useCase();
      useCase();

      verify(() => mockRepository.clear()).called(2);
    });
  });
}