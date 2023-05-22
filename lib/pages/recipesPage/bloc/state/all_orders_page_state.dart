import 'package:equatable/equatable.dart';
import 'package:home_test/pages/recipesPage/recipesResponseModel/recipes_response_model.dart';

class RecipesPageState extends Equatable {
  const RecipesPageState({
    this.isLoading,
    this.isRequestSuccessful,
    this.requestMessage,
    this.responseModel,
    this.recipesList,
    this.isItInAscending,
  });

  final bool? isLoading;
  final bool? isItInAscending;
  final bool? isRequestSuccessful;
  final List? recipesList;
  final String? requestMessage;
  final RecipesResponseModel? responseModel;
  @override
  List<Object?> get props => [
        isLoading,
        requestMessage,
        isRequestSuccessful,
        recipesList,
        responseModel,
        isItInAscending,
      ];

  RecipesPageState copyWith({
    bool? isLoading,
    bool? isRequestSuccessful,
    bool? isItInAscending,
    List? recipesList,
    String? requestMessage,
    RecipesResponseModel? responseModel,
  }) {
    return RecipesPageState(
      isLoading: isLoading,
      requestMessage: requestMessage,
      isRequestSuccessful: isRequestSuccessful,
      recipesList: recipesList,
      responseModel: responseModel,
      isItInAscending: isItInAscending,
    );
  }
}
