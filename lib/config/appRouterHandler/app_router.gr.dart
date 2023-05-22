// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    RecipesRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const RecipesPage(),
      );
    },
    RecipesDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<RecipesDetailsRouteArgs>();
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: RecipesDetailsPage(
          key: args.key,
          recipesData: args.recipesData,
        ),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          RecipesRoute.name,
          path: '/',
        ),
        RouteConfig(
          RecipesDetailsRoute.name,
          path: '/recipes-details-page',
        ),
      ];
}

/// generated route for
/// [RecipesPage]
class RecipesRoute extends PageRouteInfo<void> {
  const RecipesRoute()
      : super(
          RecipesRoute.name,
          path: '/',
        );

  static const String name = 'RecipesRoute';
}

/// generated route for
/// [RecipesDetailsPage]
class RecipesDetailsRoute extends PageRouteInfo<RecipesDetailsRouteArgs> {
  RecipesDetailsRoute({
    Key? key,
    required Map<String, dynamic> recipesData,
  }) : super(
          RecipesDetailsRoute.name,
          path: '/recipes-details-page',
          args: RecipesDetailsRouteArgs(
            key: key,
            recipesData: recipesData,
          ),
        );

  static const String name = 'RecipesDetailsRoute';
}

class RecipesDetailsRouteArgs {
  const RecipesDetailsRouteArgs({
    this.key,
    required this.recipesData,
  });

  final Key? key;

  final Map<String, dynamic> recipesData;

  @override
  String toString() {
    return 'RecipesDetailsRouteArgs{key: $key, recipesData: $recipesData}';
  }
}
