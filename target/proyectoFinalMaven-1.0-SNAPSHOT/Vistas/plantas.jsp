<%-- 
    Document   : productos
    Created on : 1 dic. 2022, 20:14:06
    Author     : lucia
--%>

<%@page import="models.PlantaDAO"%>
<%@page import="java.util.List"%>
<%@page import="models.Planta"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Bootstrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <link rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6.1.2/css/fontawesome.min.css">
        <script src="https://kit.fontawesome.com/f3c93a9c69.js" crossorigin="anonymous"></script>
        <title>Plantas</title>
    </head>
    <body class="container justify-content-center align-items-center" style="height: 100vh">
        <header>
            <h1 class="p-4 text-center">Listado de plantas</h1>
        </header>
        <main class="d-flex justify-content-center">
            <div class="container">
                <div class="row">                    
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>Id</th>
                                <th>Tipo</th>
                                <th>Nombre</th>
                                <th>Descripcion</th>                            
                                <th>Modificar</th>
                                <th>Eliminar</th>
                            </tr>
                        </thead>
                        <tbody>            
                            <%
                            List<Planta> resultado = null;    
                            PlantaDAO planta = new PlantaDAO();
                            resultado = planta.listarPlantas();

                            for(int i = 0; i < resultado.size(); i++){
                                String ruta = "PlantasController?accion=modificar&id=" + resultado.get(i).getIdPlanta();
                                String rutaE = "PlantasController?accion=eliminar&id=" + resultado.get(i).getIdPlanta();
                            %>
                            <tr>
                                <td><%= resultado.get(i).getIdPlanta()%></td>
                                <td><%= resultado.get(i).getTipo()%></td>
                                <td><%= resultado.get(i).getNombre()%></td>
                                <td><%= resultado.get(i).getDescripcion()%></td>                            

                                <td><a class="text-success" href=<%=ruta%>><i class="fa-sharp fa-solid fa-pen"></i></a></td>
                                <td><a class="text-danger" href=<%=rutaE%>><i class="fa-sharp fa-solid fa-trash"></a></td>
                            </tr>                              
                        </tbody>
                    
                        <%
                            }
                        %>
                    
                        <tfoot>
                            <tr>
                                <td>Cantidad de plantas:</td>
                                <td><%= resultado.size() %></td>
                            </tr>
                        </tfoot>
                    </table>                    
                </div>
            </div>
        </main>
        <footer>
            <div class="container d-flex gap-2 py-3 justify-content-center">
                <a class="btn btn-primary col-3 m-4" href="PlantasController?accion=nuevo">Agregar Planta</a>
            </div>
        </footer>
    </body>
</html>
