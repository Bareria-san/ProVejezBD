<%-- 
    Document   : pacientes
    Created on : 14/08/2021, 9:26:09 p. m.
    Author     : alejo
--%>



<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.mysql.jdbc.Driver" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <title>Adulto Mayor</title>
    </head>
    <body>
        <ul class="nav justify-content-center bg-primary">
            <li class="nav-item">
                <h2>ADULTO MAYOR</h2>
            </li>
            <li class="nav-item">
                <h2>-</h2>
            </li>
            <li class="nav-item">
                <h2>AÑADIR</h2>
            </li>

        </ul>
        <div class = "container mt-4">
            <div class = "row justify-content-md-center">
                <div class = "col-lg-6">
                    <form action="formularioAdultoMayor.jsp" method="post">
                        
                        <div class="mb-3">
                            <label for="cc">Número de identificación</label>
                            <input type="text" class="form-control" name="cc" placeholder="cc" required="Requerido">
                        </div>

                        <div class="mb-3">
                            <label for = "nombre">Nombre paciente</label>
                            <input type="text" class="form-control" name="nombre" placeholder="nombre" required="Requerido">
                        </div>
                        <div class="mb-3">
                            <label for = "apellidos">Apellidos paciente</label>
                            <input type="text" class="form-control" name="apellidos" placeholder="apellidos"required="Requerido">
                        </div>
                        <div class="mb-3">
                            <label for = "n_habitacion">Número de habitación</label>
                            <input type="text" class="form-control" name="n_habitacion" placeholder="habitación"required="Requerido">
                        </div>
                        <label>Ficha médica</label>
                        <div class="input-group mb-4">                            
                            <input class="form-control" type="file" name = "ficha_medica">
                        </div>
                        <div class="d-grid gap-2 d-md-flex justify-content-between">
                            <button type="submit" class="btn btn-primary col-3">Volver</button>
                            <button type="submit" name="enviar" class="btn btn-primary col-3">Enviar</button>
                        </div>

                    </form>
                </div>
            </div>            
        </div>
        <%

            if (request.getParameter("enviar") != null) {

              
                String cc = request.getParameter("cc");
                String nombre = request.getParameter("nombre");
                String apellidos = request.getParameter("apellidos");
                String n_habitacion = request.getParameter("n_habitacion");

                try {

                    Connection con = null;
                    Statement st = null;
                    
                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost/provejez?user=root&password=valeria0817");
                    st = con.createStatement();
                    st.executeUpdate("insert into adulto_mayor (cc,nombre,apellidos,n_habitacion) values ('" + cc + "','" + nombre + "','" + apellidos + "','" + n_habitacion + "');");
                    request.getRequestDispatcher("adultosMayores.jsp").forward(request, response);

                } catch (Exception e) {

                    out.print(e);

                }
            }

        %>
    </body>
</html>
