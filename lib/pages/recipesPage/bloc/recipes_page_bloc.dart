// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:home_test/pages/recipesPage/bloc/event/all_orders_page_event.dart';
import 'package:home_test/pages/recipesPage/bloc/state/all_orders_page_state.dart';
import 'package:home_test/pages/recipesPage/data/repo/repoInterface/recipes_page_repo_interface.dart';
import 'package:injectable/injectable.dart';

@injectable
class RecipesPageBloc extends Bloc<RecipesPageEvent, RecipesPageState> {
  final RecipesPageRepoInterface recipesPageRepo;

  List cachedRecipesList = [];

  RecipesPageBloc(
    this.recipesPageRepo,
  ) : super(const RecipesPageState()) {
    on<GetRecipesPageEvent>((event, emit) async {
      emit(
        state.copyWith(
          isLoading: true,
        ),
      );
      var requestResponse = await recipesPageRepo.getAllRecipesRepoRequest();
      cachedRecipesList =
          requestResponse!.status == true ? requestResponse.data : [];

      var notificationMessageText = requestResponse.message!.replaceFirst(
          requestResponse.message![0],
          requestResponse.message![0].toUpperCase());
      emit(
        state.copyWith(
          isLoading: false,
          isRequestSuccessful: requestResponse.status,
          responseModel: requestResponse,
          recipesList: cachedRecipesList,
          requestMessage: notificationMessageText,
        ),
      );
    });
    on<AscDescOrderOnRecipesPageEvent>((event, emit) async {
      if (event.isItForAscOrder == true) {
        cachedRecipesList.sort((a, b) {
          return compareAsciiUpperCase(a['calories'], b['calories']);
        });

        emit(state.copyWith(
          recipesList: cachedRecipesList,
          isItInAscending: true,
        ));
      } else {
        cachedRecipesList.sort((a, b) {
          return compareAsciiUpperCase(b['calories'], a['calories']);
        });
        emit(state.copyWith(
          recipesList: cachedRecipesList,
          isItInAscending: false,
        ));
      }
    });
  }
}
