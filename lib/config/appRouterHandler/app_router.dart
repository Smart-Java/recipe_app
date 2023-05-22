import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:home_test/pages/recipesDetailsPage/recipes_details_page.dart';
import 'package:home_test/pages/recipesPage/recipes_page.dart';

part 'app_router.gr.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',              
  routes: <AutoRoute>[
    AutoRoute(page: RecipesPage, initial: true,),
    AutoRoute(page: RecipesDetailsPage,),
  ],
)

class AppRouter extends _$AppRouter{} 