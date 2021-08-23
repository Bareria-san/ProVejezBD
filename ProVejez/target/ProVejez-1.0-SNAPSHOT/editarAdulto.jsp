<%-- 
    Document   : editarAdulto.jsp
    Created on : 22 ago. 2021, 17:00:03
    Author     : Bareria-san
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

        <%

            int id_adulto = Integer.valueOf(request.getParameter("id_adulto")).intValue();
            String cc = request.getParameter("cc");
            String nombre = request.getParameter("nombre");
            String apellidos = request.getParameter("apellidos");
            String n_habitacion = request.getParameter("n_habitacion");


        %>

        <ul class="nav justify-content-center bg-primary">
            <li class="nav-item">
                <h2>ADULTO MAYOR</h2>
            </li>
            <li class="nav-item">
                <h2>-</h2>
            </li>
            <li class="nav-item">
                <h2>EDITAR</h2>
            </li>

        </ul>
        <div class = "container mt-4">
            <div class = "row justify-content-md-center">
                <div class = "col-lg-6">
                    <form action="editarAdulto.jsp" method="get">

                        <div class="mb-3">

                            <input type="hidden" name="id_adulto" value="<%=id_adulto%>">
                        </div>

                        <div class="mb-3">
                            <label for="cc">Número de identificación</label>
                            <input type="text" class="form-control" value="<%=cc%>" name="cc" placeholder="cc" required="Requerido">
                        </div>
                        <div class="mb-3">
                            <label for = "nombre">Nombre paciente</label>
                            <input type="text" class="form-control" value="<%=nombre%>" name="nombre" placeholder="nombre" required="Requerido">
                        </div>
                        <div class="mb-3">
                            <label for = "apellidos">Apellidos paciente</label>
                            <input type="text" class="form-control" value="<%=apellidos%>" name="apellidos" placeholder="apellidos"required="Requerido">
                        </div>
                        <div class="mb-3">
                            <label for = "n_habitacion">Número de habitación</label>
                            <input type="text" class="form-control" value="<%=n_habitacion%>" name="n_habitacion" placeholder="habitación"required="Requerido">
                        </div>
                        <label>Ficha médica</label>
                        <div class="input-group mb-4">                            
                            <input class="form-control" type="file" name = "ficha_medica">
                        </div>
                        <div class="d-grid gap-2 d-md-flex justify-content-between">
                            <a href="adultosMayores.jsp" class="btn btn-primary col-3">Cancelar</a>
                            <button type="submit" name="enviar" class="btn btn-primary col-3">Guardar</button>
                        </div>

                    </form>
                </div>
            </div>            
        </div>
        <%

            if (request.getParameter("enviar") != null) {

                try {

                    Connection con = null;
                    Statement st = null;

                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost/provejez?user=root&password=valeria0817");
                    st = con.createStatement();
                    st.executeUpdate("update adulto_mayor set cc='" + cc + "' ,nombre= '" + nombre + "' ,apellidos='" + apellidos + "' ,n_habitacion='" + n_habitacion + "' where id_adulto='" + id_adulto + "';");
                    request.getRequestDispatcher("adultosMayores.jsp").forward(request, response);

                } catch (Exception e) {

                    out.print(e);

                }
            }

        %>
    </body>
</html>
