import 'package:equatable/equatable.dart';

class GoodNew extends Equatable {
  final String description;
  final DateTime date;

  GoodNew({
    required this.description,
    required this.date
  });

  @override
  List<Object> get props => [description, date];
}