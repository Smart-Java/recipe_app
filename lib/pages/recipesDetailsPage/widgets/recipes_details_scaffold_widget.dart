import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:home_test/config/appColors/app_colors.dart';
import 'package:home_test/pages/recipesDetailsPage/widgets/recipes_details_image_widget.dart';
import 'package:home_test/pages/recipesDetailsPage/widgets/recipes_details_property_value_widget.dart';

class RecipesDetailsScaffoldWidget extends StatefulWidget {
  final Map<String, dynamic> recipesData;
  const RecipesDetailsScaffoldWidget({
    Key? key,
    required this.recipesData,
  }) : super(key: key);

  @override
  State<RecipesDetailsScaffoldWidget> createState() =>
      _RecipesDetailsScaffoldWidgetState();
}

class _RecipesDetailsScaffoldWidgetState
    extends State<RecipesDetailsScaffoldWidget> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Map<String, dynamic> recipesData = {};

  @override
  void initState() {
    super.initState();
    setState(() {
      recipesData = widget.recipesData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: AppColors.appBar,
        elevation: 1.0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            context.router.pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 30,
            color: AppColors.primaryColor,
          ),
        ),
        title: Text(
          recipesData['name'],
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            RecipesDetailsImageWidget(imageNetworkPath: recipesData['image']),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RecipesDetailsProperyValueWidget(
                    property: 'Description',
                    value: recipesData['description'],
                    isItForDescription: true,
                  ),
                  RecipesDetailsProperyValueWidget(
                    property: 'Headline',
                    value: recipesData['headline'],
                    isItForDescription: false,
                  ),
                  RecipesDetailsProperyValueWidget(
                    property: 'Calories',
                    value: recipesData['calories'],
                    isItForDescription: false,
                  ),
                  RecipesDetailsProperyValueWidget(
                    property: 'Difficulty',
                    value: '${recipesData['difficulty']}',
                    isItForDescription: false,
                  ),
                  RecipesDetailsProperyValueWidget(
                    property: 'Cardos',
                    value: recipesData['carbos'],
                    isItForDescription: false,
                  ),
                  RecipesDetailsProperyValueWidget(
                    property: 'Fats',
                    value: recipesData['fats'],
                    isItForDescription: false,
                  ),
                  RecipesDetailsProperyValueWidget(
                    property: 'Proteins',
                    value: recipesData['proteins'],
                    isItForDescription: false,
                  ),
                  RecipesDetailsProperyValueWidget(
                    property: 'Time',
                    value: recipesData['time'],
                    isItForDescription: false,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
