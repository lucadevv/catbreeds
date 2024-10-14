import 'package:breeds/app/fetures/home_feature/domain/results/catbreeds_result.dart';

abstract class CatbreedsRepository {
  Future<CatbreedsResult> getAll();
}
