// lib/blocs/matricula/matricula_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matricula_app/blocs/matricula/matricula_event.dart';
import 'package:matricula_app/blocs/matricula/matricula_state.dart';
import 'package:matricula_app/services/services.dart';

class MatriculaBloc extends Bloc<MatriculaEvent, MatriculaState> {
  final DataManager dataManager;
  final ConsultaService consultaService;

  MatriculaBloc(this.dataManager, this.consultaService)
      : super(MatriculaInitial());

  Stream<MatriculaState> mapEventToState(MatriculaEvent event) async* {
    if (event is MatriculaCargarDatosEvent) {
      yield MatriculaLoading();
      try {
        await dataManager.cargarDatos();
        yield MatriculaInitial();
      } catch (e) {
        yield MatriculaError('Error al cargar los datos');
      }
    } else if (event is MatriculaBuscarEvent) {
      yield MatriculaLoading();
      try {
        final etiqueta = consultaService.buscarEtiqueta(event.matricula);
        yield MatriculaLoaded(etiqueta);
      } catch (e) {
        yield MatriculaError('Matrícula no encontrada');
      }
    }
  }
}
