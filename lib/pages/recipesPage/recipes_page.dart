import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_test/di/injection.dart';
import 'package:home_test/pages/recipesPage/bloc/recipes_page_bloc.dart';
import 'package:home_test/pages/recipesPage/widget/recipes_page_scaffold_widget.dart';

class RecipesPage extends StatelessWidget {
  const RecipesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      left: false,
      right: false,
      child: BlocProvider(
        create: (context) => getIt<RecipesPageBloc>(),
        child: const RecipesPageScaffoldWidget()),
    );
  }
}
