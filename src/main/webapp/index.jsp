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
                        PicModel pm = new PicModel();
                        LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
                        Cluster cluster;
                                                Cluster cluster2;

                        User us = new User();
                        cluster = CassandraHosts.getCluster();
                        cluster2 = CassandraHosts.getCluster();
                        us.setCluster(cluster);
                        pm.setCluster(cluster2);

                        if (lg != null) {
                            String UserName = lg.getUsername();
                            if (lg.getlogedin()) {
                                                        lg.setPP(us.getPP(lg.getUsername()));

                                
                    %>
                    Random Pic</br>
                                <a href="/Instagrim/Image/<%=pm.getRandom()%>" ><img src="/Instagrim/Thumb/<%=pm.getRandom()%>"></a>
                                
                <li><a href="upload.jsp">Upload</a></li>

                    <li><a  href="/Instagrim/Logout">Logout</a></li>
                                    <li class="nav"><a href="/Instagrim/Images/majed">All Images</a></li>
                                    <li class="nav"><a href="/Instagrim/Discover/majed">Discover</a></li>

                                    
                                    <li class="nav"><a href="/Instagrim/mydetails.jsp">My details</a></li>
                                    <li class="nav"><a href="/Instagrim/editdetails.jsp">Edit details</a></li>
                                    

                <li><a href="/Instagrim/Images/<%=lg.getUsername()%>">Your Images</a></li>
                <form name="input" action="/Instagrim/Follow" method="post">
                <input type="text" name="user" value="<%=lg.getUsername()%>" hidden>
                <input type="text" name="user1">


                <input type="submit" value="Follow">
            </form>
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
