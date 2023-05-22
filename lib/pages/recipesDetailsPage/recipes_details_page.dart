import 'package:flutter/material.dart';
import 'package:home_test/pages/recipesDetailsPage/widgets/recipes_details_scaffold_widget.dart';

class RecipesDetailsPage extends StatelessWidget {
  final Map<String, dynamic> recipesData;
  const RecipesDetailsPage({Key? key, required this.recipesData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      left: false,
      right: false,
      child: RecipesDetailsScaffoldWidget(
        recipesData: recipesData,
      ),
    );
  }
}
