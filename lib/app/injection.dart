import 'package:breeds/app/api/api_client.dart';
import 'package:breeds/app/fetures/home_feature/data/datasource/catbreeds_datasource.dart';
import 'package:breeds/app/fetures/home_feature/data/repository/catbreeds_repository_impl.dart';
import 'package:breeds/app/fetures/home_feature/domain/repository/catbreeds_repository.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setUpInyection({
  required String baseUrl,
  required String token,
}) {
  /*
  ------------------------API CLIENT---------------------
   */
  getIt.registerLazySingleton<ApiClient>(
    () => ApiClient(
      baseUrl: baseUrl,
      token: token,
    ),
  );

  /*
  ------------------------BREEDS---------------------
   */

  getIt.registerLazySingleton<CatbreedsDatasource>(
      () => CatbreedsDatasource(apiClient: getIt<ApiClient>()));
  getIt.registerLazySingleton<CatbreedsRepository>(() =>
      CatbreedsRepositoryImpl(
          catbreedsDatasource: getIt<CatbreedsDatasource>()));
}
