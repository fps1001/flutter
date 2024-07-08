
# Mockup Mobility

Este proyecto es un prototipo para mi propuesta de Trabajo de Fin de Grado (TFG). La aplicación recibe información de un servidor WMS y muestra las capas en un mapa utilizando la biblioteca `flutter_map`.

## Descripción

**Mockup Mobility** es una aplicación móvil que integra información de servidores Web Map Service (WMS) y la representa en un mapa interactivo. Utiliza `flutter_map` para la visualización y gestión de capas geográficas.

## Características

- Integración con servidores WMS para la obtención de datos geográficos.
- Visualización de capas en un mapa interactivo utilizando `flutter_map`.
- Interfaz de usuario intuitiva y fácil de usar.
- Capacidad para manejar múltiples capas y fuentes de datos.

## Requisitos

- [Flutter](https://flutter.dev/docs/get-started/install)
- [Dart](https://dart.dev/get-dart)
- Conexión a un servidor WMS

## Instalación

Para clonar y ejecutar este proyecto, sigue estos pasos:

1. Clona el repositorio:
   ```bash
   git clone https://github.com/fps1001/flutter.git
   cd flutter/mockup_mobility
   ```

2. Instala las dependencias:
   ```bash
   flutter pub get
   ```

3. Ejecuta la aplicación:
   ```bash
   flutter run
   ```

## Uso

1. Inicia la aplicación en tu dispositivo o emulador.
2. Configura la URL del servidor WMS en la configuración de la aplicación.
3. Selecciona las capas que deseas visualizar en el mapa.
4. Navega y explora las capas geográficas en el mapa interactivo.

## Estructura del Proyecto

```
mockup_mobility/
├── lib/
│   ├── main.dart
│   ├── map_view.dart
│   ├── wms_service.dart
│   └── ...
├── test/
│   └── ...
└── pubspec.yaml
```

## Contribuciones

Las contribuciones son bienvenidas. Si tienes ideas o mejoras, siéntete libre de abrir un issue o enviar un pull request.

## Licencia

Este proyecto está licenciado bajo la Licencia MIT. Consulta el archivo [LICENSE](../LICENSE) para obtener más detalles.

## Contacto

Para cualquier consulta, puedes contactarme en [fps1001@alu.ubu.es](mailto:fps1001@alu.ubu.es).
