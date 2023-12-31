
<!-- jsp permite inscrustar codigo java -->
<%@page import="java.util.List"%>
<%@page import="modelo.Contacto"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <title>Agenda 23557</title>
    </head>
    <body>
        <!-- frm para agregar nuevos contactos  -->
        <div class="container mt-3">
            <form action="AgendaServlet" method="post" class="mb-3">
                <div class="form-group">
                    <label>Nombre:</label>
                    <input type="text" class="form-control" name="nombre">
                </div>
                <div class="form-group">
                    <label>Apellido:</label>
                    <input type="text" class="form-control" name="apellido">
                </div>
                <div class="form-group">
                    <label>Email:</label>
                    <input type="email" class="form-control" name="email">
                </div>
                <br

                <button type="submit" class="btn btn-primary">Agregar Contacto</button>
            </form>
            <!--tabla p/mostrar contactos exitentes y adj accion de eliminar y ... Declaramo table  -->
            <table class="table">
                <thead>
                    <tr>
                        <!<!-- Declaramos las Filas -->
                        <th>Nombre</th>
                        <th>Apellido</th>
                        <th>Email</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                    <tbody>
                    <%
          // Recuperar la lista de contactos desde el contexto de la aplicación  
                        List<Contacto> contactos = (List<Contacto>) request.getServletContext().getAttribute("contactos");
                        if (contactos != null) {
                            for (int i = 0; i < contactos.size(); i++){
                    %>
                   <!-- el boocle for  cierra cuando se termina la fila  -->
                    <!-- tr de Apertura y cierre  -->
                    <tr>
                        <td><%= contactos.get(i).getNombre()%></td>
                        <td><%= contactos.get(i).getApellido()%></td>
                        <td><%= contactos.get(i).getEmail()%></td>
                        <td>
                    <!-- Formularios para eliminar y editar con índices de contactos -->
                            <form action="OperacionServlet" method="post" style="display: inline-block;">
                                <input type="hidden" name="accion" value="eliminar">
                                <input type="hidden" name="indice" value="<%= i %>">
                                <button type="submit" class="btn btn-danger btn-sm">Eliminar</button>
                            </form>
                            <form action="OperacionServlet" method="post" style="display: inline-block;">
                                <input type="hidden" name="accion" value="editar">
                                <input type="hidden" name="indice" value="<%= i %>">
                                <button type="submit" class="btn btn-secondary btn-sm">Editar</button>
                            </form>
                        </td>
                    </tr>
                <% 
                }
            }
            %>
                </tbody>
            


                    <!-- pegar boostrap que es p/java igual no hace falta -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>   

    </body>
</html>
