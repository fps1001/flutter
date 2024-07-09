import 'package:equatable/equatable.dart';

abstract class WMSState extends Equatable {
  const WMSState();

  @override
  List<Object> get props => [];
}

class LayersInitial extends WMSState {}

class LayersLoading extends WMSState {}

class LayersLoaded extends WMSState {
  final List<String> layers;
  final String? selectedLayer;

  const LayersLoaded(this.layers, this.selectedLayer);

  @override
  List<Object> get props => [layers, selectedLayer ?? ''];  // Convertir null a una cadena vacía
}

class LayersError extends WMSState {
  final String message;

  const LayersError(this.message);

  @override
  List<Object> get props => [message];
}
