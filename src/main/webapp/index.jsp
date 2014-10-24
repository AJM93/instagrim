<%-- 
    Document   : index
    Created on : Sep 28, 2014, 7:01:44 PM
    Author     : Administrator
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="uk.ac.dundee.computing.aec.instagrim.stores.*" %>
<%@ page import="uk.ac.dundee.computing.aec.instagrim.models.*" %>
<%@ page import = "uk.ac.dundee.computing.aec.instagrim.lib.CassandraHosts" %>
<%@ page import = "com.datastax.driver.core.Cluster" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Instagrim</title>
        <link rel="stylesheet" type="text/css" href="Styles.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <header>
            <h1>InstaGrim ! </h1>
            <h2>Your world in Black and White</h2>
        </header>
        <nav>
            <ul>


                
                    <%
                        
                        LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
                        Cluster cluster;
                        User us = new User();
                        cluster = CassandraHosts.getCluster();
                        us.setCluster(cluster);

                        if (lg != null) {
                            String UserName = lg.getUsername();
                            if (lg.getlogedin()) {
                                                        lg.setPP(us.getPP(lg.getUsername()));

                                
                    %>
                                <a href="/Instagrim/Image/<%=lg.getPP()%>" ><img src="/Instagrim/Thumb/<%=lg.getPP()%>"></a>
                <li><a href="upload.jsp">Upload</a></li>

                    <li><a  href="/Instagrim/Logout">Logout</a></li>
                                    <li class="nav"><a href="/Instagrim/Images/majed">All Images</a></li>
                                    <li class="nav"><a href="/Instagrim/mydetails.jsp">My details</a></li>
                                    <li class="nav"><a href="/Instagrim/editdetails.jsp">Edit details</a></li>
                                    

                <li><a href="/Instagrim/Images/<%=lg.getUsername()%>">Your Images</a></li>
                    <%}
                            }else{
                                %>
                 <li><a href="register.jsp">Register</a></li>
                <li><a href="login.jsp">Login</a></li>
                
                
                <%
                                        
                            
                    }%>
            </ul>
        </nav>
        <footer>
            <ul>
                <li class="footer"><a href="/Instagrim">Home</a></li>
                <li>&COPY; Alexander M</li>
            </ul>
        </footer>
    </body>
</html>
