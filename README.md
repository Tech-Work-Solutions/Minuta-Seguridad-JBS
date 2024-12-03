# Tecnologías

1. Vue
2. Xampp
3. Laravel
4. MySql

# Cómo correr el proyecto localmente?

## Dependencias en windows

1. Instalar node 16 recomendada la version 16.20.2.
   Al ser una versión vieja puede generarte conflicto con otras apps, recomendamos usar nvm para cambiar entre versiones de node.
   ![1](https://github.com/user-attachments/assets/37042e25-346f-40f9-bc7b-b106fa3c32dd)

2. Instalar xampp 7.4.33
   [Instalador Xampp windows](https://sourceforge.net/projects/xampp/files/XAMPP%20Windows/7.4.33/)
3. Si tu cuenta de root en mysql tiene una contraseña diferente a 123456, debes cambiarla de root por 123456 o la que desees en la variables de entorno y root de mysql.
   [Cambiar pass mysql](https://www.youtube.com/watch?v=HMDSPX1qN-M&t=135s)
4. Instalar Composer -> [Guía Composer](https://styde.net/instalacion-de-composer-y-laravel-en-windows/)
5. Instalar vue -> `npm install -g @vue/cli`
6. Mover/clonar todo el proyecto a `XAMPP/htdocs`
7. Dentro del proyecto, instalar dependencias -> `npm install`
8. Ejecutar `composer install` para que se cree carpeta `vendor` si hay algún error, ejecutar `composer update` y volver a ejecutar el `composer install`
9. En el archivo .env reemplazar esta var
   `APP_URL=http://localhost/seguridadapp`

## Settings

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
