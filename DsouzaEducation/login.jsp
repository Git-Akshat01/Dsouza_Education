<%@ page import ="java.sql.*"%>
<%@ page import ="java.io.*"%>

<%! Connection con=null;
PreparedStatement pstmt=null;
ResultSet rs=null;
%>

<html>
    <head>
        <link rel="stylesheet" href="css/Loginstyle.css">
    </head>
    <body>
        <%
        try
        {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","akshat","akshat");
            pstmt=con.prepareStatement("select * from login where username=?");
            String user=request.getParameter("username");
            String pass=request.getParameter("password");
            pstmt.setString(1,user);
            rs=pstmt.executeQuery();
            while(rs.next())
            {
                String name=rs.getString(1);
                String pword=rs.getString(2);

                if(user.equals(name) && pass.equals(pword))
                {
                    out.println("Successfully Logged In");
                }
                else
                {
                    out.println("Unable to login");
                }

            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        %>
    </body>
</html>