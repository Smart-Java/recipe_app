import 'package:home_test/connectivityManager/model/connection.dart';
import 'package:home_test/pages/recipesPage/data/dataProvider/recipes_page_data.dart';
import 'package:home_test/pages/recipesPage/data/repo/repoInterface/recipes_page_repo_interface.dart';
import 'package:home_test/pages/recipesPage/recipesResponseModel/recipes_response_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: RecipesPageRepoInterface)
class RecipesPageRepo implements RecipesPageRepoInterface {
  final RecipesPageData receipesPageData;
  final Connection connection;
  RecipesPageRepo(
    this.receipesPageData,
    this.connection,
  );

  @override
  Future<RecipesResponseModel?> getAllRecipesRepoRequest() async {
    final checkConnection = await connection.isInternetEnabled();
    RecipesResponseModel? recipesResponseModel;
    if (checkConnection) {
      recipesResponseModel = await receipesPageData
          .responseFromGetOrdersRequest()
          .onError((error, stackTrace) {
        recipesResponseModel =
            const RecipesResponseModel(message: 'An error occured, try again');
        return recipesResponseModel;
      });
    } else {
      recipesResponseModel =
          const RecipesResponseModel(message: 'Check internet connection');
    }

    return recipesResponseModel;
  }
}
