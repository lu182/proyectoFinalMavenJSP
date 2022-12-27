<%-- 
    Document   : nuevo
    Created on : 1 dic. 2022, 20:14:00
    Author     : lucia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Bootstrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <title>Agregar Planta</title>
    </head>
    <body class="container justify-content-center align-items-center" style="height: 100vh">
        <header>
            <h1 class="p-5 text-center">Agregar Planta</h1>
        </header>
        <main class="d-flex justify-content-center">
            <div class="container">
                <form class="p-5" action="PlantasController?accion=insert" method="POST">                
                    
                    <div class="mb-3">
                        <label for="nombre">Nombre</label>
                        <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Ingrese el nombre de la planta">
                    </div>

                    <div class="mb-3">
                        <label for="tipo">Tipo</label>
                        <input type="text" class="form-control" id="tipo" name="tipo" placeholder="Ingrese el tipo de planta">
                    </div>

                    <div class="mb-3">
                        <textarea class="form-control fw-light" placeholder="Ingresa una descripción de la planta" name="descripcion" style="height: 200px" id="descripcion"></textarea>
                        <label for="descripcion">Ingresa una descripción de la planta</label>
                    </div>                    

                    <button type="submit" class="btn btn-primary">Agregar</button>
                </form>
            </div>
        </main>
    </body>
</html>
