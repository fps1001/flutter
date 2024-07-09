import 'package:bloc/bloc.dart';
import 'wms_event.dart';
import 'wms_state.dart';
import 'package:mockup_mobility/services/wms_service.dart';

class WMSBloc extends Bloc<WMSEvent, WMSState> {
  final WMSService wmsService;

  WMSBloc(this.wmsService) : super(LayersInitial()) {
    on<LoadLayers>((event, emit) async {
      emit(LayersLoading());
      try {
        final layers = await wmsService.getLayers();
        emit(LayersLoaded(layers, null)); // Inicialmente, ninguna capa seleccionada
      } catch (e) {
        emit(LayersError(e.toString()));
      }
    });

    on<SelectLayer>((event, emit) {
      final currentState = state;
      if (currentState is LayersLoaded) {
        emit(LayersLoaded(currentState.layers, event.selectedLayer));
      }
    });
  }
}
