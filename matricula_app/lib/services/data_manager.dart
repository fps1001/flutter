// lib/services/data_manager.dart
//import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:archive/archive_io.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataManager {
  static const String dataUrl =
      'https://sedeapl.dgt.gob.es/IEST_INTER/MICRODATOS/salida/distintivoAmbiental/export_dist_ambiental.zip';
  static const String localFileName = 'export_distintivo_ambiental.txt';
  static const String zipFileName = 'export_dist_ambiental.zip';
  static const String lastUpdatedKey = 'last_updated';
  Map<String, String> _matriculas = {};

  Future<void> cargarDatos() async {
    final dir = await getApplicationDocumentsDirectory();
    final localFile = File('${dir.path}/$localFileName');

    if (await _necesitaActualizar(localFile)) {
      await _descargarDatos(dir);
    }

    _matriculas = await _leerArchivo(localFile);
  }

  Future<bool> _necesitaActualizar(File localFile) async {
    if (!await localFile.exists()) {
      return true;
    }

    final lastUpdated = await _getLastUpdated();
    final now = DateTime.now();
    return now.difference(lastUpdated).inDays > 0;
  }

  Future<void> _descargarDatos(Directory dir) async {
    final response = await http.get(Uri.parse(dataUrl));
    final zipFile = File('${dir.path}/$zipFileName');
    await zipFile.writeAsBytes(response.bodyBytes);

    final bytes = zipFile.readAsBytesSync();
    final archive = ZipDecoder().decodeBytes(bytes);

    for (final file in archive) {
      if (file.name == localFileName) {
        final dataFile = File('${dir.path}/$localFileName');
        await dataFile.writeAsBytes(file.content);
        break;
      }
    }

    await _setLastUpdated(DateTime.now());
  }

  Future<void> _setLastUpdated(DateTime dateTime) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(lastUpdatedKey, dateTime.toIso8601String());
  }

  Future<DateTime> _getLastUpdated() async {
    final prefs = await SharedPreferences.getInstance();
    final lastUpdated = prefs.getString(lastUpdatedKey);
    return lastUpdated != null
        ? DateTime.parse(lastUpdated)
        : DateTime.fromMillisecondsSinceEpoch(0);
  }

  Future<Map<String, String>> _leerArchivo(File localFile) async {
    final data = await localFile.readAsString();
    final lines = data.split('\n');
    final Map<String, String> matriculas = {};

    for (final line in lines) {
      final parts = line.split('|');
      if (parts.length == 2) {
        matriculas[parts[0]] = parts[1];
      }
    }

    return matriculas;
  }

  String? buscarEtiqueta(String matricula) {
    return _matriculas[matricula];
  }
}
