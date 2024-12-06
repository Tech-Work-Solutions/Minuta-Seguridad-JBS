# Tecnologías

1. Vue
2. Xampp
3. Laravel
4. MySql

## Dependencias

Antes de configurar el proyecto, asegúrate de contar con las siguientes herramientas instaladas:

1. **Node.js (versión 16.x)**  
   Es recomendable tener instalado **nvm** para gestionar diferentes versiones de Node.js. Si no tienes Node.js o nvm, puedes instalarlo siguiendo la documentación oficial:

    - [Instalar Node.js](https://nodejs.org/)
    - [Instalar nvm](https://github.com/nvm-sh/nvm)

2. **Composer**  
   Composer es necesario para gestionar las dependencias de PHP. Sigue los pasos según tu sistema operativo:

    - **Windows:** [Guía de instalación para Windows](https://styde.net/instalacion-de-composer-y-laravel-en-windows/)
    - **Linux:** [Guía de instalación para Ubuntu](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-composer-on-ubuntu-20-04-es)

3. **Vue CLI**  
   Instala Vue CLI globalmente utilizando npm:
    ```bash
    npm install -g @vue/cli
    ```

# Instrucciones para configurar y ejecutar el proyecto

Sigue los pasos a continuación para configurar y ejecutar este proyecto correctamente:

## 1. Clonar el repositorio

Clona este repositorio en tu máquina local usando el siguiente comando:

```bash
git clone https://github.com/Tech-Work-Solutions/Minuta-Seguridad-JBS.git
```

## 2. Configurar la base de datos

Asegúrate de tener MySQL instalado en tu sistema. Luego, realiza lo siguiente:

-   Ejecuta el script SQL que se encuentra en el repositorio `minutas_jbs.sql` para inicializar la base de datos:
    ```bash
    mysql -u <usuario> -p <nombre_base_de_datos> < archivo.sql
    ```
    > **Nota:** Reemplaza <usuario> y <nombre_base_de_datos> con las credenciales correspondientes.

## 3. Configurar las variables de entorno

-   Crea un archivo .env en la raíz del proyecto (si aún no existe).
-   Ajusta las variables de entorno necesarias según el formato proporcionado en el archivo de ejemplo .env.example.

## 4. Seleccionar la versión correcta de Node.js

Asegúrate de usar la versión `16.x` de Node.js:

```bash
nvm use 16
```

## 5. Instalar las dependencias de Node.js

Ejecuta el siguiente comando para instalar las dependencias del proyecto:

```bash
npm install
```

## 6. Actualizar e instalar dependencias de Composer

Si el proyecto incluye dependencias de PHP, ejecuta los siguientes comandos:

```bash
composer update
composer install
```

## 6. Ejecutar el proyecto

Para ejecutar el proyecto en modo desarrollo, utiliza:

```bash
npm run dev
```

O, si necesitas que los archivos se recompilen automáticamente, utiliza:

```bash
npm run watch
```

Para ejecutar el servidor, usa:

```bash
npm run start:server
```

¡Listo para usar! 😊

## Configuración en Windows con Apache

### Requisitos previos en Windows

1. Instalar Node.js (versión recomendada: 16.20.2).
   Es preferible usar nvm para cambiar entre versiones:

    ![1](https://github.com/user-attachments/assets/37042e25-346f-40f9-bc7b-b106fa3c32dd)

2. Instalar XAMPP (versión recomendada: 7.4.33):

    [Instalador Xampp windows](https://sourceforge.net/projects/xampp/files/XAMPP%20Windows/7.4.33/)

3. Si tu usuario `root` tiene una contraseña diferente a `123456`, cámbiala o ajusta la variable de entorno en el archivo `.env`:

    [Cambiar pass mysql](https://www.youtube.com/watch?v=HMDSPX1qN-M&t=135s)

4. Instalar Composer:

    [Guía Composer](https://styde.net/instalacion-de-composer-y-laravel-en-windows/)

5. Instalar vue:

    ```bash
    npm install -g @vue/cli
    ```

6. Mover el proyecto a `XAMPP/htdocs`
7. En proyecto, instalar dependencias:
    ```bash
    npm install
    ```
8. Ejecutar composer:
    ```bash
    composer update
    composer install
    ```
9. En el archivo `.env` reemplazar esta var
   `APP_URL=http://localhost/seguridadapp`

## Configuración adicional

1. Configurar la Raíz del DocumentRoot a la Carpeta public. Agregar lo siguiente en el archivo `C:\xampp\apache\conf\extra\httpd-vhosts.conf`

    ![1 9](https://github.com/user-attachments/assets/04114cc7-e1fe-4569-9cd5-daca62e6b8df)

    ![2](https://github.com/user-attachments/assets/27f442b1-29fd-488c-8031-0bb7d024634f)

2. Editar los hosts

`C:\Windows\System32\drivers\etc\hosts`
agregar `127.0.0.1 seguridadapp.local`

3. Verificar que `mod_rewrite` esté Habilitado

En Apache revisa en: `C:\xampp\apache\conf\httpd.conf`

Asegúrarse de que la línea `LoadModule rewrite_module modules/mod_rewrite.so` no esté comentada.

![3](https://github.com/user-attachments/assets/30f61228-f6d5-4b34-84d0-fe0b8e40a1a8)

Verificar que este la siguiente configuración

    <Directory "C:/xampp/htdocs">
        Options Indexes FollowSymLinks
        AllowOverride All
        Require all granted
    </Directory>

4. reiniciar apache

5. Ejecutar `npm run dev`

6. Acceder a la url http://seguridadapp.local para ver la aplicación en ejecución.

![4](https://github.com/user-attachments/assets/05d179fb-06ec-45ec-ae3c-4d7cfa348d16)
