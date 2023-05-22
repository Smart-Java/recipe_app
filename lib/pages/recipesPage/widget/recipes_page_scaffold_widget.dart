import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_test/config/appColors/app_colors.dart';
import 'package:home_test/pages/recipesPage/bloc/recipes_page_bloc.dart';
import 'package:home_test/pages/recipesPage/bloc/event/all_orders_page_event.dart';
import 'package:home_test/pages/recipesPage/bloc/state/all_orders_page_state.dart';
import 'package:home_test/pages/recipesPage/widget/recipes_list_items_widget.dart';

class RecipesPageScaffoldWidget extends StatefulWidget {
  const RecipesPageScaffoldWidget({Key? key}) : super(key: key);

  @override
  State<RecipesPageScaffoldWidget> createState() =>
      _RecipesPageScaffoldWidgetState();
}

class _RecipesPageScaffoldWidgetState extends State<RecipesPageScaffoldWidget> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool showRefresh = false;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<RecipesPageBloc>(context).add(const GetRecipesPageEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RecipesPageBloc, RecipesPageState>(
      listener: (context, state) {
        if (state.recipesList != null && state.recipesList!.isEmpty) {
          setState(() {
            showRefresh = true;
          });
        }
      },
      child: Scaffold(
        key: _scaffoldKey,
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          backgroundColor: AppColors.appBar,
          elevation: 1.0,
          centerTitle: true,
          title: Text(
            'All Recipes',
            style: Theme.of(context).textTheme.headline5,
          ),
          actions: [
            showRefresh == true
                ? IconButton(
                    onPressed: () {
                      BlocProvider.of<RecipesPageBloc>(context)
                          .add(const GetRecipesPageEvent());
                    },
                    icon: const Icon(
                      Icons.refresh,
                      color: AppColors.primaryColor,
                      size: 30.0,
                    ),
                  )
                : Container(),
          ],
        ),
        body: const RecipesListItemsWidget(),
      ),
    );
  }
}
