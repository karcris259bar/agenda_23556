package modelo;
//Modelo de todos los contactos
public class Contacto {
    private String nombre;
    private String apellido;
    private String email;
    // BOT DER / INSERT CODIGO / CONSTRUCTOR Y NO ELEGIMOS NADA
    //SE CREA CONTRUCTOR VACIO
    public Contacto() {
    }
    // BOT DER / INSERT CODIGO / CONSTRUCTOR Y SELECT ALL 
    //SE CREA CONTRUCTOR CON LOS CAMPOS

    public Contacto(String nombre, String apellido, String email) {
        this.nombre = nombre;
        this.apellido = apellido;
        this.email = email;
    }
// idem con getter y setter
    public String getNombre() {
        return nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public String getEmail() {
        return email;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
    
