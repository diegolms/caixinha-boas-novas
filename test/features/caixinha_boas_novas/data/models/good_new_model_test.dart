import 'dart:convert';

import 'package:caixinha_boas_novas/features/caixinha_boas_novas/data/models/good_new_model.dart';
import 'package:caixinha_boas_novas/features/caixinha_boas_novas/domain/entities/good_new.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main(){

    final tGoodNewModel = GoodNewModel(description: 'test', date: DateTime(2021,01,01));

    test(
      'should be a subclass of Good New entity',
        () async{
          expect(tGoodNewModel, isA<GoodNew>());
        },
    );

    group('fromJson', () {
      test('should return a valid model', () async {
        //arange
        final Map<String, dynamic> jsonMap = json.decode(fixture('good_new.json'));

        //act
        final result = GoodNewModel.fromJson(jsonMap);

        //assert
        expect(result, tGoodNewModel);
      });

    });

}