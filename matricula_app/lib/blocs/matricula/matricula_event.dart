// lib/blocs/matricula/matricula_event.dart
import 'package:equatable/equatable.dart';

abstract class MatriculaEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class MatriculaBuscarEvent extends MatriculaEvent {
  final String matricula;

  MatriculaBuscarEvent(this.matricula);

  @override
  List<Object> get props => [matricula];
}

class MatriculaCargarDatosEvent extends MatriculaEvent {}
