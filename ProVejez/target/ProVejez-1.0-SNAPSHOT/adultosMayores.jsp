<%-- 
    Document   : adultosMayores
    Created on : 22 ago. 2021, 0:58:34
    Author     : Bareria-san
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" 
              rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
              crossorigin="anonymous">
        <style>
            #scroll{
                height:550px;
                width:550px;
                overflow-y:scroll;
                overflow-x:hidden;
            }
        </style>

        <title>Pacientes</title>
    </head>
    <body>

        <%

            Connection con = null;
            Statement st = null;
            ResultSet rs = null;

        %>
        <script>

        </script>


        <div class="container">
            <div class="row justify-content-between">
                <div class="col-4">
                    <figure class="figure mt-4">
                        <img src="images/LogoCompleto.png" class="figure-img img-fluid rounded" 
                             alt="Logo Provejez" width="375">
                    </figure>
                    <div class="d-grid gap-1  mt-3">
                        <a class="btn btn-primary" type="button" href="formularioAdultoMayor.jsp">                                
                            Agregar
                        </a>
                        <a class="btn btn-primary" type="button" href="formularioAdultoMayor.jsp">                                
                            Volver
                        </a>
                    </div>
                </div>
                <div class="col-6">
                    <div class="accordion accordion-flush mt-5 mr-5" id="scroll">


                        <%                            Class.forName("com.mysql.jdbc.Driver");
                            con = DriverManager.getConnection("jdbc:mysql://localhost/provejez?user=root&password=valeria0817");
                            st = con.createStatement();
                            rs = st.executeQuery("select * from adulto_mayor;");

                            while (rs.next()) {

                        %>

                        <div class="accordion-item">
                            <h2 class="accordion-header" id="flush-heading<%=rs.getString(1)%>">

                                <button class="accordion-button collapsed" type="button" 
                                        data-bs-toggle="collapse" data-bs-target="#flush-collapse<%=rs.getString(1)%>" 
                                        aria-expanded="false" aria-controls="flush-collapse<%=rs.getString(1)%>">

                                    Habitación: <%=rs.getString(5)%> &nbsp;&nbsp;&nbsp;&nbsp;
                                    <%=rs.getString(3)%> <%=rs.getString(4)%> 

                                </button>

                            </h2>
                            <div id="flush-collapse<%=rs.getString(1)%>" class="accordion-collapse collapse" 
                                 aria-labelledby="flush-heading<%=rs.getString(1)%>" data-bs-parent="#accordionFlushExample">
                                <div class="accordion-body justify-content-center">      

                                    <a class="btn btn-primary" href="#" role="button">Ver perfil</a>
                                    <a class="btn btn-primary" href="editarAdulto.jsp?id_adulto=<%=rs.getString(1)%>&cc=<%=rs.getString(2)%>&nombre=<%=rs.getString(3)%>&apellidos=<%=rs.getString(4)%>&n_habitacion=<%=rs.getString(5)%>" role="button">Modificar</a>
                                    <a class="btn btn-primary" href="#borrarAdulto.jsp?id_adulto=<%=rs.getString(1)%>" role="button">Eliminar</a>

                                </div>
                            </div>
                            <%
                                }


                            %>
                        </div>
                    </div>
                </div>
            </div>
            <script src="js/query.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>


    </body>
</html>
