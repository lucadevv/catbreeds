import 'package:breeds/app/fetures/home_feature/domain/enities/catbreed_entity.dart';

abstract class CatbreedsResult {}

class CatbreedsSucces extends CatbreedsResult {
  final List<CatBreedEntity> catbreeds;

  CatbreedsSucces({required this.catbreeds});
}

class CatbreedsFailure extends CatbreedsResult {
  final CatbreedsFailureStatus catbreedsFailureStatus;

  CatbreedsFailure({required this.catbreedsFailureStatus});
}

enum CatbreedsFailureStatus {
  notFound,
  server,
  unknow,
}
