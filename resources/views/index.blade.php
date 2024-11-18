<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="shortcut icon" href="{{ asset('img/logo.png') }}" type="image/x-icon">
        <meta name="csrf-token" content="{{ csrf_token() }}">
        <link rel="stylesheet" href="{{ asset('css/app.css') }}">
        <title>Seguridad JBS</title>
        <style>
            .active-menu{
                font-weight: bold;                
                color: green;                
            }
        </style>
    </head>
    <body>
        <div id="app">
            <my-app></my-app>
        </div>   
    </body>

    <script src="{{ asset('js/app.js') }}"></script>    
</html>
