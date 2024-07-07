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

  const LayersLoaded(this.layers);

  @override
  List<Object> get props => [layers];
}

class LayersError extends WMSState {
  final String message;

  const LayersError(this.message);

  @override
  List<Object> get props => [message];
}

class LayerSelected extends WMSState {
  final String selectedLayer;

  const LayerSelected(this.selectedLayer);

  @override
  List<Object> get props => [selectedLayer];
}
