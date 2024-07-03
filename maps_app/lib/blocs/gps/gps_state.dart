part of 'gps_bloc.dart';

class GpsState extends Equatable {
  final bool isGpsEnabled;
  final bool isGpsPermissionGranted;

  const GpsState(
      { // Se añade las llaves para que el paso sea por nombre.
      required this.isGpsEnabled,
      required this.isGpsPermissionGranted});

  @override
  List<Object> get props => [
        isGpsEnabled,
        isGpsPermissionGranted
      ]; // propiedades que permiten saber si un estado es igual a otro

  GpsState copyWith({ // copia el estado anterior. Si no lo manda coge el anterior.
    bool? isGpsEnabled,
    bool? isGpsPermissionGranted,
  }) =>
      GpsState(
          isGpsEnabled: isGpsEnabled ?? this.isGpsEnabled,
          isGpsPermissionGranted: isGpsPermissionGranted ?? this.isGpsPermissionGranted);

  @override
  String toString() =>
      '{ isGpsEnabled: $isGpsEnabled, isGpsPermissionGranted: $isGpsPermissionGranted}';
}

//final class GpsInitial extends GpsState {} // Línea por defecto eliminada

