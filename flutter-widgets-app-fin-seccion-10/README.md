# widgets_app:
Aplicación copiada del repositorio del profesor. Con anotaciones en este README.md

## Manejo de git de un proyecto:
git init 
-Indica que quieres dar seguimiento al proyecto: inicializa un repositorio.
git add .
git commit -m "First commit"
- Hace el primer commit.
git status
- Sirve para ver en qué rama estamos trabajando ( **debemos dejar la rama main pues se supone es la de producción** )
git checkout -b nombre_nueva_rama 
- el -b indica que se cree una rama nueva
git checkout -- .
- Devuelve al estado del último commit.