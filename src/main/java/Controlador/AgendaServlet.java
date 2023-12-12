package Controlador;
// aca podemos heredar metodos de otras clases y nos decidimos como queremos que funcione
//Ctrol ship i importa automaticamente

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
// Para no importar todo hacemos import javax.servlet
import modelo.Contacto;

// las anotaciones permiten DEFINIR COSAS
// Con extends hereda y con servlet establece la URL
@WebServlet(name = "AgendaServlet", urlPatterns = {"/AgendaServlet"})

public class AgendaServlet extends HttpServlet {

    // Override Permite sobreescribir el metodo
    @Override
    // METODO QUE NOS PERMITE COMUNICARNOS DESDE EL FRM A CREAR
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
// RECORRE LOS DATOS DEL FRM
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String email = request.getParameter( "email");
// Crear instancia p/agregar contaco
        
        Contacto nuevoContacto = new Contacto(nombre, apellido, email);
        
// obtener lISTA contacto   
        List<Contacto> contactos = (List<Contacto>) getServletContext().getAttribute("contactos");
        if(contactos == null) {
            contactos = new ArrayList<>();
        }
        // AÑADIR NUEVO CONTACTO
        contactos.add(nuevoContacto);
// GUARDAR lISTA ACTUALIZADA 
        getServletContext().setAttribute( "contactos", contactos);
 // Devolver Redirige al jsp lo que coresponda;
        request.getRequestDispatcher( "index.jsp").forward(request, response);
    }
}



