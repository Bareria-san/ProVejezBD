<%-- 
    Document   : borrarAdulto
    Created on : 22 ago. 2021, 19:23:23
    Author     : Bareria-san
--%>

<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%

            Connection con = null;
            Statement st = null;

            try {

                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost/provejez?user=root&password=valeria0817");
                st = con.createStatement();
                st.executeUpdate("delete from adulto_mayor where id_adulto='" + request.getParameter("id_adulto") + "';");
                request.getRequestDispatcher("adultosMayores.jsp").forward(request, response);

            } catch (Exception e) {

                out.print(e);

            }
        %>



    </body>
</html>
