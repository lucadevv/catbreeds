import 'dart:async';

import 'package:breeds/app/fetures/home_feature/domain/repository/catbreeds_repository.dart';
import 'package:breeds/app/fetures/home_feature/domain/results/catbreeds_result.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:breeds/app/fetures/home_feature/domain/enities/catbreed_entity.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final CatbreedsRepository _catbreedsRepository;
  HomeBloc({required CatbreedsRepository catbreedsRepository})
      : _catbreedsRepository = catbreedsRepository,
        super(HomeState.initial()) {
    on<GetAllEvent>(_getAllEvent);
    on<SearchBreedsEvent>(_searchBreedsEvent);
  }

  Future<void> _getAllEvent(GetAllEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(homeStatus: HomeStatus.loading));
    try {
      final response = await _catbreedsRepository.getAll();

      if (response is CatbreedsSucces) {
        emit(state.copyWith(
          list: response.catbreeds,
          filteredList: response.catbreeds,
          homeStatus: HomeStatus.success,
        ));
      }
    } catch (e) {
      emit(state.copyWith(homeStatus: HomeStatus.error));
    }
  }

  void _searchBreedsEvent(SearchBreedsEvent event, Emitter<HomeState> emit) {
    if (event.searchTerm.isEmpty) {
      emit(state.copyWith(
        filteredList: state.list,
        searchTerm: '',
      ));
    } else {
      final filteredBreeds = state.list
          .where((breed) =>
              breed.name.toLowerCase().contains(event.searchTerm.toLowerCase()))
          .toList();

      emit(state.copyWith(
        filteredList: filteredBreeds,
        searchTerm: event.searchTerm,
      ));
    }
  }
}
