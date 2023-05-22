import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_test/config/appColors/app_colors.dart';
import 'package:home_test/config/appRouterHandler/app_router.dart';
import 'package:home_test/config/appShimmerEffect/app_shimmer_effect.dart';
import 'package:home_test/pages/recipesPage/bloc/recipes_page_bloc.dart';
import 'package:home_test/pages/recipesPage/bloc/event/all_orders_page_event.dart';
import 'package:home_test/pages/recipesPage/bloc/state/all_orders_page_state.dart';
import 'package:home_test/pages/recipesPage/widget/recipes_custom_list_item_widget.dart';
import 'package:home_test/util/listNotReadyWidget/list_not_ready_widget.dart';

class RecipesListItemsWidget extends StatefulWidget {
  const RecipesListItemsWidget({Key? key}) : super(key: key);

  @override
  State<RecipesListItemsWidget> createState() => _RecipesListItemsWidgetState();
}

class _RecipesListItemsWidgetState extends State<RecipesListItemsWidget> {
  List recipesList = [];

  bool loadShimmer = false;

  String emptyRecipesList = '';

  Size deviceSize = const Size(0.0, 0.0);

  bool isItInAscending = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    setState(() {
      deviceSize = size;
    });
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<RecipesPageBloc>(context)
            .add(const GetRecipesPageEvent());
      },
      color: AppColors.blackColor,
      child: BlocConsumer<RecipesPageBloc, RecipesPageState>(
        listener: (context, state) {
          if (state.recipesList != null && state.recipesList!.isEmpty) {
            var message = state.requestMessage as String;
            setState(() {
              emptyRecipesList = message;
            });
          }

          if (state.recipesList != null && state.recipesList!.isNotEmpty) {
            setState(() {
              recipesList = state.recipesList!;
            });
          } else {
            setState(() {
              recipesList = [];
            });
          }

          if (state.isItInAscending == false || state.isItInAscending == true) {
            setState(() {
              isItInAscending = state.isItInAscending!;
            });
          }

          if (state.isLoading == true || state.isLoading == false) {
            setState(() {
              loadShimmer = state.isLoading!;
            });
          }

          if (state.requestMessage != null &&
              state.requestMessage!.isNotEmpty) {
            displayMessage(context, state.requestMessage!);
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
            ),
            child: loadShimmer == true
                ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: GridView.builder(
                      itemCount: 10,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10.0,
                        crossAxisSpacing: 10.0,
                        childAspectRatio: 1.05,
                      ),
                      itemBuilder: (context, index) {
                        return const AppShimmerEffect.rectangular(
                          height: 40,
                          width: double.infinity,
                        );
                      },
                    ),
                  )
                : recipesList.isNotEmpty
                    ? SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 5.0,
                          ),
                          child: Column(
                            children: [
                              Align(
                                alignment: AlignmentDirectional.topEnd,
                                child: IconButton(
                                  onPressed: () {
                                    BlocProvider.of<RecipesPageBloc>(context)
                                        .add(
                                      AscDescOrderOnRecipesPageEvent(
                                        isItForAscOrder: !isItInAscending,
                                      ),
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.sort,
                                    color: AppColors.blackColor,
                                  ),
                                ),
                              ),
                              GridView.builder(
                                  itemCount: recipesList.length,
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 10.0,
                                    crossAxisSpacing: 10.0,
                                    childAspectRatio: 1.05,
                                  ),
                                  itemBuilder: (context, index) {
                                    return RecipesCustomListItemWidget(
                                      imageNetworkPath:
                                          recipesList[index]['thumb'] ?? '',
                                      title: recipesList[index]['name'],
                                      navFunctionality: () {
                                        context.router.push(
                                          RecipesDetailsRoute(
                                            recipesData: recipesList[index],
                                          ),
                                        );
                                      },
                                    );
                                  })
                            ],
                          ),
                        ),
                      )
                    : ListNotReadyWidget(
                        message: emptyRecipesList,
                      ),
          );
        },
      ),
    );
  }

  void displayMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(message),
        ),
        duration: const Duration(seconds: 5),
        backgroundColor: AppColors.blackColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        margin: EdgeInsets.only(
          bottom: deviceSize.height - 100,
          right: 10.0,
          left: 10.0,
        ),
      ),
    );
  }
}
