<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <title>Adultos Mayores</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <%
        
        Connection con = null;
        Statement st = null;
        ResultSet rs = null;
        
        %>
        <div class="container mt-5">
            <div class="row">
                <div class="col-sm">
        <table class="table table-striped">
            <thead>
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">CC</th>
                    <th scope="col">Nombre</th>
                    <th scope="col">Apellido</th>
                    <th scope="col">Habitación</th>
                    
                </tr>
            </thead>
            <tbody>
                
                
            </tbody>
            <%

                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost/provejez?user=root&password=valeria0817");
                st=con.createStatement();
                rs=st.executeQuery("select * from adulto_mayor;");
                while(rs.next()){
                    %>
                    <tr>
                        <th scope="row"><%=rs.getString(1)%></th>
                    <td><%=rs.getString(2)%></td>
                   <td><%=rs.getString(3)%></td>
                   <td><%=rs.getString(4)%></td>
                   <td><%=rs.getString(5)%></td>
                    
                </tr>
                    <%
                }

            %>
        </table>
            </div>
            </div>
            </div>

    </body>
</html>
