import 'package:breeds/app/fetures/home_feature/data/models/catbreeds_model.dart';

class CatBreedEntity {
  final String id;
  final String name;
  final String origin;
  final int intelligence;
  final String description;
  final String? imageUrl;

  CatBreedEntity({
    required this.id,
    required this.name,
    required this.origin,
    required this.intelligence,
    required this.description,
    this.imageUrl,
  });

  factory CatBreedEntity.modelToEntity({required CatbreedsModel model}) =>
      CatBreedEntity(
          id: model.id,
          name: model.name,
          origin: model.origin,
          intelligence: model.intelligence,
          description: model.description ?? "no-description",
          imageUrl: model.imageUrl);

  static List<CatBreedEntity> listModelToEntity(
      {required List<CatbreedsModel> models}) {
    return models
        .map((model) => CatBreedEntity.modelToEntity(model: model))
        .toList();
  }
}
