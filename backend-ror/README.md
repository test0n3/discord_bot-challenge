# Alura|ONE: Reto 01 Backend: Generador de Mensajes Automáticos para Discord

## backend-ror

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

**Nota**
Para terminar la ejecución de la aplicación, hacer **CTRL + C**. Esto detendrá el servicio. Para detener todo adecuadamente, ejecutar en la terminal:
```bash
docker compose down
```

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
