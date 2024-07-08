import 'package:http/http.dart' as http;
import 'package:xml/xml.dart';

class WMSService {
  final String url;

  WMSService(this.url);

  Future<List<String>> getLayers() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final document = XmlDocument.parse(response.body);

      final layers = document.findAllElements('Layer');

      final layerValues = layers.map((layer) {
        return layer.getElement('Title')?.text ?? 'Sin título';
      }).toList();

      return layerValues;
    } else {
      throw Exception('Error al obtener las capacidades WMS');
    }
  }
}
