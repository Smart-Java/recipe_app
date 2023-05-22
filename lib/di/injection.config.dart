// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i3;
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../api/apiRequestHelper/api_request_helper.dart' as _i5;
import '../connectivityManager/connectivity_manager.dart' as _i7;
import '../connectivityManager/model/connection.dart' as _i6;
import '../dioClient/dio_client_module.dart' as _i13;
import '../interceptors/network_interceptor.dart' as _i8;
import '../pages/recipesPage/bloc/recipes_page_bloc.dart' as _i12;
import '../pages/recipesPage/data/dataProvider/recipes_page_data.dart' as _i9;
import '../pages/recipesPage/data/repo/recipes_page_repo.dart' as _i11;
import '../pages/recipesPage/data/repo/repoInterface/recipes_page_repo_interface.dart'
    as _i10; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final dioClientModule = _$DioClientModule();
  gh.factory<_i3.Connectivity>(() => dioClientModule.connectivity);
  gh.lazySingleton<_i4.Dio>(() => dioClientModule.dioClient);
  gh.factory<_i5.ApiRequestHelper>(() => _i5.ApiRequestHelper(
        get<_i3.Connectivity>(),
        get<_i4.Dio>(),
      ));
  gh.lazySingleton<_i6.Connection>(
      () => _i7.ConnectivityManager(get<_i3.Connectivity>()));
  gh.lazySingleton<_i8.NetworkInterceptor>(
      () => _i8.NetworkInterceptor(get<_i6.Connection>()));
  gh.factory<_i9.RecipesPageData>(
      () => _i9.RecipesPageData(get<_i5.ApiRequestHelper>()));
  gh.factory<_i10.RecipesPageRepoInterface>(() => _i11.RecipesPageRepo(
        get<_i9.RecipesPageData>(),
        get<_i6.Connection>(),
      ));
  gh.factory<_i12.RecipesPageBloc>(
      () => _i12.RecipesPageBloc(get<_i10.RecipesPageRepoInterface>()));
  return get;
}

class _$DioClientModule extends _i13.DioClientModule {}
