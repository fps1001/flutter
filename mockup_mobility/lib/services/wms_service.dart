import 'package:http/http.dart' as http;
import 'package:xml/xml.dart';

class WMSService {
  final String url;

  WMSService(this.url);

  Future<List<String>> getLayers() async {
    // Realiza una solicitud HTTP GET a la URL proporcionada
    final response = await http.get(Uri.parse(url));

    // Verifica si la respuesta es exitosa (código de estado 200)
    if (response.statusCode == 200) {
      // Analiza la respuesta XML
      final document = XmlDocument.parse(response.body);

      // Encuentra todos los elementos 'Layer' en el documento XML
      final layers = document.findAllElements('Layer');

      // Mapea cada elemento 'Layer' para obtener el texto del elemento 'Title'
      final layerValues = layers.map((layer) {
        return layer.getElement('Title')?.value ?? 'Sin título';
      }).toList();

      // Devuelve la lista de títulos de capas
      return layerValues;
    } else {
      // Lanza una excepción si la solicitud HTTP no fue exitosa
      throw Exception('Error al obtener las capacidades WMS');
    }
  }
}
