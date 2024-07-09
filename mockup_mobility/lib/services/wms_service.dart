import 'package:http/http.dart' as http;
import 'package:xml/xml.dart';
import 'dart:convert';

class WMSService {
  final String url;

  WMSService(this.url);

  Future<Map<String, String>> getLayers() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final document = XmlDocument.parse(utf8.decode(response.bodyBytes));

      final layers = document.findAllElements('Layer');

      final layerValues = {
        for (var layer in layers)
          if (layer.getElement('Title')?.innerText != null && layer.getElement('Name')?.innerText != null)
            layer.getElement('Title')!.innerText: layer.getElement('Name')!.innerText
      };

      return layerValues;
    } else {
      throw Exception('Error al obtener las capacidades WMS');
    }
  }
}
