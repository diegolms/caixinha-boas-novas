import 'package:dartz/dartz.dart';

import 'package:caixinha_boas_novas/core/error/failures.dart';
import 'package:caixinha_boas_novas/features/caixinha_boas_novas/domain/entities/good_new.dart';

import '../repositories/good_new_repository.dart';

class GetGoodNews {
  final GoodNewRepository repository;

  GetGoodNews(this.repository);

  Future<Either<Failure, GoodNew>?> execute() async {
    return await repository.getGoodNews();
  }

}
