// lib/services/consulta_service.dart
import 'package:matricula_app/services/services.dart';

class ConsultaService {
  final DataManager dataManager;

  ConsultaService(this.dataManager);

  String buscarEtiqueta(String matricula) {
    final etiqueta = dataManager.buscarEtiqueta(matricula);
    if (etiqueta == null) {
      throw Exception('Matrícula no encontrada');
    }
    return etiqueta;
  }
}
