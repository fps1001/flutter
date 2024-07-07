import 'dart:io';
import 'package:xml/xml.dart';

class WMSService {
  final String filePath;

  WMSService(this.filePath);

  Future<List<String>> getLayers() async {
    final file = File(filePath);
    final document = XmlDocument.parse(await file.readAsString());

    final layers = document.findAllElements('Layer');

    final layerValues = layers.map((layer) {
      return layer.getElement('Title')?.value ?? 'Sin título';
    }).toList();

    return layerValues;
  }
}
