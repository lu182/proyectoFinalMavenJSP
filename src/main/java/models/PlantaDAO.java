package models;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class PlantaDAO {
    
    //Declaro variables de tipo conexión:
    Conexion conexion;
    Connection connect; 
    
    //Constructor sin parámetros:
    public PlantaDAO(){
        conexion = new Conexion();
        connect = conexion.getConnection();
    } 
    
    //Método listarPlantas donde los elementos van a ser de tipo Planta:
    public List<Planta> listarPlantas(){
        PreparedStatement ps; 
        ResultSet rs;
        
        //Creamos nuestra lista de productos vacía que vamos a devolver a futuro:
        List<Planta> plantas = new ArrayList<>(); 
        
        //Ahora probamos con try/catch para ver que las cosas me lleguen (ya q dependemos de un 3ro, en este caso de la BD):
        try{
            ps = connect.prepareStatement("SELECT * FROM plantas");
            rs = ps.executeQuery(); 
            
            while(rs.next()){ //mientras rs tenga un siguiene resultado, va a guardar en variables el resultado de cada registro
                
                int id = rs.getInt("idPlanta");
                String tipo = rs.getString("tipo");
                String nombre = rs.getString("nombre");                
                String descripcion = rs.getString("descripcion");
                
                //Luego, creamos el objeto de tipo Planta con esos valores que obtuvimos de la BD
                Planta planta = new Planta(id, tipo, nombre, descripcion);
                
                plantas.add(planta); //Le pasamos/agregamos ese objeto producto a nuestro ArrayList vacìo.
            }
            //Luego que termine de iterar el while quien estaba obteniendo los datos de la BD, 
            //me va a devolver el ArrayList de plantas q ya no estará vacío. Luego esto lo vamos a manipular con JSP.
            return plantas; 
        }
        catch(SQLException e){
            System.out.println(e.toString());
            return null; //en caso de que haya errores va a retornar un null.
        }
        
    }
    
    public boolean agregarPlanta(Planta planta){
        PreparedStatement ps;
        
        try {
            ps = connect.prepareStatement("INSERT INTO plantas(idPlanta, tipo, nombre, descripcion) VALUES (?,?,?,?)");
            ps.setInt(1, planta.getIdPlanta());
            ps.setString(2, planta.getTipo());
            ps.setString(3, planta.getNombre());
            ps.setString(4, planta.getDescripcion());
            ps.execute();
            return true;
            
        } catch (SQLException e) {
            System.out.println(e.toString());
            return false;
        }
    }
    
    public boolean actualizarProducto(Planta planta){

        PreparedStatement ps;

        try{
            ps = connect.prepareStatement("UPDATE plantas SET tipo=?, nombre=?, descripcion=? WHERE idPlanta=?");
            ps.setString(1, planta.getTipo());
            ps.setString(2, planta.getNombre());
            ps.setString(3, planta.getDescripcion());            
            ps.setInt(4,planta.getIdPlanta());
            ps.execute();
            return true;            
        }
        catch(SQLException e){
            System.out.println(e.toString());
            return false;                
        }
    }
    
    public boolean borrarPlanta(int refIdPlanta){

        PreparedStatement ps;

          try{
            ps = connect.prepareStatement("DELETE FROM plantas WHERE idPlanta=?;");
            ps.setInt(1, refIdPlanta);
            ps.execute();
            return true;            
        }
        catch(SQLException e){
            System.out.println(e.toString());
            return false;                
        }
    }
    
    public Planta mostrarPlanta(int refIdPlanta){
        
        PreparedStatement ps;
        ResultSet rs;
        Planta planta = null;
        
        try{
            ps= connect.prepareStatement("SELECT * FROM plantas WHERE idPlanta=?");
            ps.setInt(1, refIdPlanta);
            rs = ps.executeQuery();

            while(rs.next()){
                int idPlanta = rs.getInt("idPlanta");
                String tipo = rs.getString("tipo");
                String nombre = rs.getString("nombre");                
                String descripcion = rs.getString("descripcion");
                planta = new Planta(idPlanta, tipo, nombre, descripcion);
            }
            return planta;
        }
        catch(SQLException e){
            System.out.println(e.toString());
            return planta;                
        }
        
    }
}
