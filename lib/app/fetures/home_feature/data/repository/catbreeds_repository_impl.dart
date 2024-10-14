import 'package:breeds/app/fetures/home_feature/data/datasource/catbreeds_datasource.dart';
import 'package:breeds/app/fetures/home_feature/domain/enities/catbreed_entity.dart';
import 'package:breeds/app/fetures/home_feature/domain/repository/catbreeds_repository.dart';
import 'package:breeds/app/fetures/home_feature/domain/results/catbreeds_result.dart';
import 'package:dio/dio.dart';

class CatbreedsRepositoryImpl extends CatbreedsRepository {
  final CatbreedsDatasource _catbreedsDatasource;
  CatbreedsRepositoryImpl({required CatbreedsDatasource catbreedsDatasource})
      : _catbreedsDatasource = catbreedsDatasource;
  @override
  Future<CatbreedsResult> getAll() async {
    try {
      final response = await _catbreedsDatasource.getAll();
      final catbreeds = CatBreedEntity.listModelToEntity(models: response);

      return CatbreedsSucces(catbreeds: catbreeds);
    } catch (e) {
      if (e is DioException) {
        return CatbreedsFailure(
            catbreedsFailureStatus: CatbreedsFailureStatus.server);
      } else {
        return CatbreedsFailure(
            catbreedsFailureStatus: CatbreedsFailureStatus.unknow);
      }
    }
  }
}
