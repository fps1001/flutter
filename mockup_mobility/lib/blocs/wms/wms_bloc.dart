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
        // Inicializamos selectedLayer como null al cargar las capas
        emit(LayersLoaded(layers, null));
      } catch (e) {
        emit(LayersError(e.toString()));
      }
    });

    on<SelectLayer>((event, emit) {
      if (state is LayersLoaded) {
        emit(LayersLoaded((state as LayersLoaded).layers, event.selectedLayer));
      }
    });
  }
}
