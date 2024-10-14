part of 'home_bloc.dart';

class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class GetAllEvent extends HomeEvent {}

class SearchBreedsEvent extends HomeEvent {
  final String searchTerm;

  const SearchBreedsEvent(this.searchTerm);

  @override
  List<Object> get props => [searchTerm];
}
