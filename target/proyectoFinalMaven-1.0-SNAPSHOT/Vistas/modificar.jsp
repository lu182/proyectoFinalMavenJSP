<%-- 
    Document   : modificar
    Created on : 1 dic. 2022, 20:13:49
    Author     : lucia
--%>

<%@page import="models.PlantaDAO"%>
<%@page import="models.Planta"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Bootstrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <title>Modificar Planta</title>
    </head>
    <body>
        <%
        int refIdPlanta = Integer.parseInt(request.getParameter("id"));
        Planta resultado = null;
        PlantaDAO planta = new PlantaDAO();
        resultado = planta.mostrarPlanta(refIdPlanta);
        %>
        <div class="row">
            <form class="p-5" action="PlantasController?accion=actualizar" method="POST">
             
                <div class="mb-3">
                    <input type="hidden" class="form-control" id="idPlanta" name="idPlanta" value=<%=resultado.getIdPlanta()%>>
                </div>
             
                <div class="mb-3">
                    <label for="nombre">Tipo</label>
                    <input type="text" class="form-control" id="tipo" name="tipo" value=<%=resultado.getTipo()%>>
                </div>

                <div class="mb-3">
                    <label for="marca">Nombre</label>
                    <input type="text" class="form-control" id="nombre" name="nombre" value=<%=resultado.getNombre()%>>
                </div>
                
                <div class="mb-3">
                    <label for="descripcion">Ingresa una descripción de la planta</label>
                    <textarea class="form-control" placeholder="Ingresa una descripción de la planta" name="descripcion" style="height: 200px" id="descripcion" value=<%=resultado.getDescripcion()%>></textarea>
                                       
                </div>                
            
                <button type="submit" class="btn btn-primary">Modificar</button>
            </form>
        </div>
    </body>
</html>
