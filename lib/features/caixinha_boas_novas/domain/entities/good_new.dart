import 'package:equatable/equatable.dart';

class GoodNew extends Equatable {
  final String text;

  GoodNew({
    required this.text
  });

  @override
  List<Object> get props => [text];
}