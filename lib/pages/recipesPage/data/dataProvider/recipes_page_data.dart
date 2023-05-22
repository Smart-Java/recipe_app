import 'package:flutter/foundation.dart';
import 'package:home_test/api/apiEndpoints/api_end_points.dart';
import 'package:home_test/api/apiRequestHelper/api_request_helper.dart';
import 'package:home_test/pages/recipesPage/recipesResponseModel/recipes_response_model.dart';
import 'package:home_test/util/networkRequestMsgErrorStatusCodeConstantValueClass/network_request_error_msg_status_code_constant_value_class.dart';
import 'package:injectable/injectable.dart';

@injectable
class RecipesPageData {
  ApiRequestHelper apiRequestHelper;
  RecipesPageData(
    this.apiRequestHelper,
  );

  Future getAllRecipesRequest() async {
    dynamic recipesRequestResponse;
    recipesRequestResponse = await apiRequestHelper.getRequest(
      APIEndPoints.recipesEndPoint,
    );
    return recipesRequestResponse;
  }

  Future<RecipesResponseModel?> responseFromGetOrdersRequest() async {
    var recipesRequestResponse = await getAllRecipesRequest();
    RecipesResponseModel? responseModel;
    int getStatusCode = recipesRequestResponse.statusCode;

    switch (getStatusCode) {
      case 200:
        responseModel = RecipesResponseModel(
            status: true,
            data: recipesRequestResponse.data,
            message: 'Recipes successfully retrieve');
        break;
      case 500:
        responseModel = RecipesResponseModel(
          message:
              NetworkRequestErrorMsgStatusCodeConstantValueClass.internalError,
        );
        break;
      case 400:
        responseModel = RecipesResponseModel(
          message:
              NetworkRequestErrorMsgStatusCodeConstantValueClass.badRequest,
        );
        break;
      default:
        responseModel = RecipesResponseModel(
          message:
              NetworkRequestErrorMsgStatusCodeConstantValueClass.unknownError,
        );
    }
    return responseModel;
  }
}
