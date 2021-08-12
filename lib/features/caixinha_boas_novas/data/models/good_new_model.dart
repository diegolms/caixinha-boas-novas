import 'package:caixinha_boas_novas/features/caixinha_boas_novas/domain/entities/good_new.dart';
import 'package:meta/meta.dart';

class GoodNewModel extends GoodNew{

  GoodNewModel({
    required String description,
    required DateTime date
  }) : super(description: description, date: date);


  factory GoodNewModel.fromJson(Map<String, dynamic> json){
      return GoodNewModel(description: json['description'], date: DateTime.parse(json['date']));
  }
}