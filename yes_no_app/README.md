# yes_no_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

Sentido de las capas:
1. Presentation será todo lo que verá el usuario.
1.1. Dentro habrá una carpeta screens que serán las pantallas tal y como serían las páginas de una página web.
1.2 Widgets serán carpetas de componentes que se pueden reutilizar.
2. En la carpeta domain: van las entidades.
3. Providers: carpeta de proveedor de estado, en este proyecto será provider
4. carpeta infrastructure: serán los mappers.


Si el objeto o la clase es privada y viene precedida por guión bajo no hace falta llamar al super.key porque no se va a usar.



Temas puntuales de la sección
En esta sección 6 nos enfocaremos en trabajar la lógica de negocio de nuestra aplicación, en pocas palabras haremos funcionar el diseño hecho en la sección anterior.

Puntualmente veremos:

Gestores de estado: **PROVIDER**

Mappers: para crear el mapeo a la clase desde el api: usamos la web: https://quicktype.io/ 

Peticiones HTTP: SE USA DIO EN VEZ DE HTTP. MEJOR.

Dio

Paquetes

Funciones que retornan valores como callbacks

Scroll

Provider

Y más cosas

Al finalizar la sección tendremos una buena base de como alojar el estado fuera de los widgets y que los widgets se actualicen y tomen la información que necesitan del gestor de estado.