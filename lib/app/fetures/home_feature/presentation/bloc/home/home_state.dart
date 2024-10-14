part of 'home_bloc.dart';

class HomeState extends Equatable {
  final HomeStatus homeStatus;
  final List<CatBreedEntity> list;
  final List<CatBreedEntity> filteredList;
  final String searchTerm;
  const HomeState({
    required this.homeStatus,
    required this.list,
    required this.filteredList,
    required this.searchTerm,
  });

  HomeState copyWith({
    HomeStatus? homeStatus,
    List<CatBreedEntity>? list,
    List<CatBreedEntity>? filteredList,
    String? searchTerm,
  }) =>
      HomeState(
        homeStatus: homeStatus ?? this.homeStatus,
        list: list ?? this.list,
        filteredList: filteredList ?? this.filteredList,
        searchTerm: searchTerm ?? this.searchTerm,
      );

  factory HomeState.initial() => const HomeState(
        homeStatus: HomeStatus.initial,
        list: [],
        filteredList: [],
        searchTerm: '',
      );

  @override
  List<Object> get props => [homeStatus, list, filteredList, searchTerm];
}

enum HomeStatus {
  initial,
  loading,
  success,
  error,
}
