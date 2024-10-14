class CatbreedsModel {
  final String id;
  final String name;
  final String origin;
  final int intelligence;
  final String? description; // Puede ser null
  final String? referenceImageId; // Puede ser null
  final String? imageUrl; // El campo imageUrl es opcional

  CatbreedsModel({
    required this.id,
    required this.name,
    required this.origin,
    required this.intelligence,
    this.description, // Puede ser null
    this.referenceImageId, // Puede ser null
    this.imageUrl, // Inicialmente puede ser null
  });

  // Factory para construir el modelo desde JSON
  factory CatbreedsModel.fromJson(Map<String, dynamic> json) => CatbreedsModel(
        id: json["id"] ?? '',
        name: json["name"] ?? 'Unknown',
        origin: json["origin"] ?? 'Unknown',
        intelligence: json["intelligence"] ?? 0,
        description: json["description"],
        referenceImageId: json["reference_image_id"],
      );

  // Método copyWith para crear una copia del modelo con nuevas propiedades
  CatbreedsModel copyWith({
    String? id,
    String? name,
    String? origin,
    int? intelligence,
    String? description,
    String? referenceImageId,
    String? imageUrl,
  }) {
    return CatbreedsModel(
      id: id ?? this.id,
      name: name ?? this.name,
      origin: origin ?? this.origin,
      intelligence: intelligence ?? this.intelligence,
      description: description ?? this.description,
      referenceImageId: referenceImageId ?? this.referenceImageId,
      imageUrl: imageUrl ?? this.imageUrl, // Aquí podemos actualizar la imagen
    );
  }
}
