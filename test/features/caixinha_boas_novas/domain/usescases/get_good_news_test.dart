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

  final goodNew = GoodNew(description: 'test', date: DateTime(2021, 01, 01));

  test(
    'should get good new from the repository',
        () async {
      when(mockGoodNewRepository!.getGoodNews())
          .thenAnswer((_) async => Right(goodNew));
      final result = await usecase!();
      expect(result, Right(goodNew));
      verify(mockGoodNewRepository!.getGoodNews());
      verifyNoMoreInteractions(mockGoodNewRepository);
    },
  );
}
