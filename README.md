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

## Desarrollo

### backend-ror
Aplicación desarrollada en: 
- [Ruby on Rails](https://www.rubyonrails.org/), que facilita desarrollo de la Aplicación.
- MongoDB, base de datos para documentos, por las características del sistema, no se hace necesario un RDBMS como MySQL, PostgreSQL.

El sistema usa de un borrado suave, los registros no se borran, solo cambian su estado.

#### Estructura del registro:
**Message**
- **message_body**: texto del mensaje
- **release_date**: fecha en la que el mensaje debe ser entregado a Discord
- **state**: estado del mensaje, son 3: `pending`, `sent` y `deleted`

#### Ejecución
Primero, clonar el repositorio para tener la aplicación localmente: 
  ```bash
  git clone git@github.com:test0n3/discord_bot-challenge.git
  ```
La aplicación fue desarrollada dentro de Docker, para su ejecución se requiere [Docker Desktop](https://www.docker.com/products/docker-desktop/), elija la versión adecuada para su sistema.
Usar la siguiente sentencia desde la terminal, dentro del directorio `backend-ror/`:
  ```bash
  docker compose build
  ```
luego usar lo siguiente para ejecutar el servicio:
  ```bash
  docker compose up
  ```
Mediante Docker, ya no es necesario detallar un proceso para la instalación del lenguaje, framework o base de datos.

- Para revisar el API del servicio se puede usar [Bruno](https://www.usebruno.com/), [Postman](https://www.postman.com/), o [Insomnia](https://insomnia.rest/) en el URI: `http://localhost:3000/api/v1/messages`
  - para ver la lista de mensajes: **GET** `http://localhost:3000/api/v1/messages`, solo se verán los mensajes pendientes de enviar ordenados por fecha de envio.

    ```javascript
    [{
      "_id": "6cc682baf786",
      "message_body": "mensaje de prueba",
      "release_date": "2025-02-20",
      "state": 1
    }]
    ```

  - para agregar un mensaje: **POST** `http://localhost:3000/api/v1/messages`, se require pasar la siguiente información:
    ```javascript
    {
      "message_body": "mensaje de prueba, introduzca su mensaje",
      "release_date": "2025-02-20"
    }
    ```
  - para borrar un mensaje: **DELETE** `http://localhost:3000/api/v1/messages/:id` (escoger algún `_id` de la lista de mensajes para borrar).



- Para ver la lista de mensajes pendientes de enviar, usar: `http://localhost:3000/messages`. Esta interfaz solo permite ver la lista de mensajes y el borrado.
