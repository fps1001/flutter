# maps_app

Sentido de las carpetas:
- Blocs: usaré Bloc como gestor de estado. Aquí se almacenan. Se comunican entre ellos.
- Helpers: funciones de propósito general.
- Models: modelos de entidades.
- Screens: pantallas completas (tienen un scafold).
- Services: realizarán las peticiones http.
- Views: widgets grandes (p.e: el mapa es una view de una screen).
- Themes: el tema visual de la aplicación/mapa
- ui: snackbar, errores, etc.
- widgets: widget independientes.

En cada carpeta con mucho contenido y para evitar largas importaciones uso un archivo de barril, para importar todo lo necesario con una sola línea.