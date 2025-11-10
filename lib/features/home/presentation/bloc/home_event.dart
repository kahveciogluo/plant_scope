import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

class GetHomeDataEvent extends HomeEvent {}

class QuestionsLoadedEvent extends HomeEvent {
  final dynamic result;
  const QuestionsLoadedEvent(this.result);

  @override
  List<Object?> get props => [result];
}

class CategoriesLoadedEvent extends HomeEvent {
  final dynamic result;
  const CategoriesLoadedEvent(this.result);

  @override
  List<Object?> get props => [result];
}
