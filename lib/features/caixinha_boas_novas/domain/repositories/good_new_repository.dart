import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/good_new.dart';

abstract class GoodNewRepository {
  Future<Either<Failure, GoodNew>>? getGoodNews();
}