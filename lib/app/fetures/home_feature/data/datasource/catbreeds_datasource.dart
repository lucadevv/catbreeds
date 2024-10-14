import 'package:breeds/app/api/api_client.dart';
import 'package:breeds/app/core/constans/app_end_points.dart';
import 'package:breeds/app/fetures/home_feature/data/models/catbreeds_model.dart';
import 'package:flutter/material.dart';

class CatbreedsDatasource {
  final ApiClient _apiClient;
  CatbreedsDatasource({required ApiClient apiClient}) : _apiClient = apiClient;

  Future<List<CatbreedsModel>> getAll() async {
    try {
      final response = await _apiClient.getData(
        AppEndPoints.breeds,
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        List<CatbreedsModel> breeds =
            data.map((json) => CatbreedsModel.fromJson(json)).toList();

        List<CatbreedsModel> updatedBreeds = [];
        for (var breed in breeds) {
          await Future.delayed(const Duration(milliseconds: 500));
          final imageUrl = await getImageUrl(breed.referenceImageId);
          final updatedBreed = breed.copyWith(imageUrl: imageUrl);
          updatedBreeds.add(updatedBreed);
        }

        return updatedBreeds;
      } else {
        throw Exception("Error al obtener las razas: ${response.statusCode}");
      }
    } catch (e) {
      debugPrint("Excepción al obtener las razas: $e");
      return [];
    }
  }

  Future<String?> getImageUrl(String? referenceImageId) async {
    try {
      if (referenceImageId != null) {
        final response = await _apiClient.getData(
          "${AppEndPoints.breedImage}/$referenceImageId",
        );
        if (response.statusCode == 200) {
          return response.data['url'];
        } else {
          debugPrint("Error al obtener la imagen: ${response.statusCode}");
          return null;
        }
      }
      return null;
    } catch (e) {
      debugPrint("Excepción al obtener la imagen: $e");
      return null;
    }
  }
}
