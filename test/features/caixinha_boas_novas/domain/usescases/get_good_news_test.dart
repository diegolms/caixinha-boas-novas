import 'package:caixinha_boas_novas/features/caixinha_boas_novas/domain/entities/good_new.dart';
import 'package:caixinha_boas_novas/features/caixinha_boas_novas/domain/repositories/good_new_repository.dart';
import 'package:caixinha_boas_novas/features/caixinha_boas_novas/domain/usescases/get_good_news.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockGoodNewRepository extends Mock
    implements GoodNewRepository {}

void main() {
  GetGoodNews? usecase;
  MockGoodNewRepository? mockGoodNewRepository;

  setUp(() {
    mockGoodNewRepository = MockGoodNewRepository();
    usecase = GetGoodNews(mockGoodNewRepository!);
  });

  final goodNew = GoodNew(text: 'test');

  test(
    'should get good new from the repository',
        () async {
      // "On the fly" implementation of the Repository using the Mockito package.
      // When getConcreteNumberTrivia is called with any argument, always answer with
      // the Right "side" of Either containing a test NumberTrivia object.
      when(mockGoodNewRepository!.getGoodNews())
          .thenAnswer((_) async => Right(goodNew));
      // The "act" phase of the test. Call the not-yet-existent method.
      final result = await usecase!.execute();
      // UseCase should simply return whatever was returned from the Repository
      expect(result, Right(goodNew));
      // Verify that the method has been called on the Repository
      verify(mockGoodNewRepository!.getGoodNews());
      // Only the above method should be called and nothing more.
      verifyNoMoreInteractions(mockGoodNewRepository);
    },
  );
}
