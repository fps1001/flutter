import 'package:equatable/equatable.dart';


abstract class WMSEvent extends Equatable {
  const WMSEvent();

  @override
  List<Object> get props => [];
}

class LoadLayers extends WMSEvent {}

class SelectLayer extends WMSEvent {
  final String selectedLayer;

  const SelectLayer(this.selectedLayer);

  @override
  List<Object> get props => [selectedLayer];
}
