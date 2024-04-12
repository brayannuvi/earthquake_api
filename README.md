# README

# earthquake_api

## Requisitos

- Ruby (versión 3.2.2)
- Rails (versión 7.1.3.2)

## Configuración

1. Dirígete a la ubicacion donde quieres clonar el proyecto por medio de CMD.

2. Clona el repositorio: git@github.com:brayannuvi/earthquake_api.git

git clone 

3. Dirígete a la carpeta del proyecto que acabas de clonar por medio de CMD.

4. Instala las dependencias:

Ejecuta: bundle install

5. Configura la base de datos:

Ejecuta: rails db:migrate

6. Brinda permisos de modificación a la ruta que lleva al proyecto que clonaste.

## Uso

1. Dirígete a la carpeta del proyecto por medio de CMD.

2. Ejecuta: rake import_data:earthquake para cargar la información de los features.

3. Ejecuta: rails server y el front end ya tendra acceso a las APIs
