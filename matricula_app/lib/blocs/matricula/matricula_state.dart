// lib/blocs/matricula/matricula_state.dart
import 'package:equatable/equatable.dart';

abstract class MatriculaState extends Equatable {
  @override
  List<Object> get props => [];
}

class MatriculaInitial extends MatriculaState {}

class MatriculaLoading extends MatriculaState {}

class MatriculaLoaded extends MatriculaState {
  final String etiqueta;

  MatriculaLoaded(this.etiqueta);

  @override
  List<Object> get props => [etiqueta];
}

class MatriculaError extends MatriculaState {
  final String message;

  MatriculaError(this.message);

  @override
  List<Object> get props => [message];
}
