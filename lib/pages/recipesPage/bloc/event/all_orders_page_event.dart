import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
abstract class RecipesPageEvent extends Equatable {
  const RecipesPageEvent();
}

// ignore: must_be_immutable
class GetRecipesPageEvent extends RecipesPageEvent {
  const GetRecipesPageEvent() : super();

  @override
  List<Object?> get props => [];
}

// ignore: must_be_immutable
class AscDescOrderOnRecipesPageEvent extends RecipesPageEvent {
  bool isItForAscOrder;

  AscDescOrderOnRecipesPageEvent({
    required this.isItForAscOrder,
  }) : super();

  @override
  List<Object?> get props => [
        isItForAscOrder,
      ];
}
