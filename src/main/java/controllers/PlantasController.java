package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Planta;
import models.PlantaDAO;

@WebServlet(name = "PlantasController", urlPatterns = {"/PlantasController"})
public class PlantasController extends HttpServlet {

    //MÉTODO doGet:
    @Override
    protected void doGet(
            HttpServletRequest req, 
            HttpServletResponse resp) 
            throws ServletException, IOException {
        
        PlantaDAO plantaDao = new PlantaDAO();
        String accion = req.getParameter("accion");
        
        RequestDispatcher dispatcher = null;
        
        //Métodos usados desde el GET:        
        if(accion == null || accion.isEmpty()){
            dispatcher = req.getRequestDispatcher("Vistas/plantas.jsp");
        }
        else if(accion.equals("modificar")){
            dispatcher = req.getRequestDispatcher("Vistas/modificar.jsp");
        }
        else if(accion.equals("nuevo")){
            dispatcher = req.getRequestDispatcher("Vistas/nuevo.jsp");
        }
        // Métodos traídos del POST:
        else if(accion.equals("insert")){
            String tipo = req.getParameter("tipo");
            String nombre = req.getParameter("nombre");
            String descripcion = req.getParameter("descripcion");
            
            Planta planta = new Planta(0, tipo, nombre, descripcion);
            plantaDao.agregarPlanta(planta);
            
            dispatcher = req.getRequestDispatcher("Vistas/plantas.jsp");
        }
        else if(accion.equals("actualizar")){
            int idPlanta = Integer.parseInt(req.getParameter("idPlanta"));
            String tipo = req.getParameter("tipo");
            String nombre = req.getParameter("nombre");
            String descripcion = req.getParameter("descripcion");
            
            Planta planta = new Planta(idPlanta, tipo, nombre, descripcion);
            plantaDao.actualizarProducto(planta);
            
            dispatcher = req.getRequestDispatcher("Vistas/plantas.jsp");            
        }
        else if(accion.equals("eliminar")){
            int idPlanta = Integer.parseInt(req.getParameter("id"));
            plantaDao.borrarPlanta(idPlanta);
            
            dispatcher = req.getRequestDispatcher("Vistas/plantas.jsp");
        }       
        else{
            dispatcher = req.getRequestDispatcher("Vistas/plantas.jsp");
        }
        
        dispatcher.forward(req, resp);
       
    }
    
    
    //MÉTODO doPost:
    @Override
    protected void doPost(
            HttpServletRequest req, 
            HttpServletResponse resp) 
            throws ServletException, IOException {

        doGet(req,resp);
    }
    
    @Override
    public String getServletInfo() {return super.getServletInfo();}
    
}
