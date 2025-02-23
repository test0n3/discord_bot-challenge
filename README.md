# Alura | ONE: Reto 01 Backend: Generador de Mensajes Automáticos para Discord

## Descripción: 
Un administrador quiere automatizar mensajes en su servidor de Discord sin depender de bots de terceros. Desarrolla un servicio backend que permita gestionar mensajes programados.

## Duración:
1 semana

## Requisitos:
- Crear un API con los siguientes endpoints:
  - `POST /message`: Guardar un mensaje programado (texto + fecha).
  - `GET /messages`: Obtener la lista de mensajes programados.
  - `DELETE /message/:id`: Eliminar un mensaje programado
- Almacenar los mensajes en una base de datos (puede ser SQLite, PostgreSQL, MongoDB, o cualquier otra opción).
- Programar la ejecución automátiva de los mensajes en la fecha indicada.
- Para la documentación de la API, se requiere el uso de Swagger/openAPI.

## Opcional:
- Integración con un bot de Discord para enviar los mensajes programados automáticamente. [Discord.dev](https://discord.com/developers/docs/intro)
- Documentación: [Integraciones de API de bots de Discord](https://pipedream.com/apps/discord-bot)
- Panel web sencillo (dashboard) para visualizar los mensajes programados.

## Entrega:
- Código en Github/Gitlab
- Documentación `README.md` con instrucciones para ejecutar el projecto.
- **Link de enlace del projecto** debe ser enviado sólo por el canal de `#entrega-retos`

---

## Ejecución

- [backend-ror](./backend-ror/README.md), backend desarrollado en Ruby on Rails.
- [backend-spring](./backend-spring/README.md), backend desarrollado en Spring Boot.

Ambas aplicaciones fueron desarrolladas con [Docker](https://www.docker.com/products/docker-desktop/). Ejecutar lo siguiente para ejecutar las aplicaciones:

```bash
  docker compose build
```
luego usar lo siguiente para ejecutar el servicio
```bash
  docker compose up
```
