<%-- 
    Document   : editdetails
    Created on : Oct 23, 2014, 7:57:11 PM
    Author     : Yogi
--%>
<%@ page import="uk.ac.dundee.computing.aec.instagrim.stores.*" %>
<%@ page import="uk.ac.dundee.computing.aec.instagrim.models.*" %>
<%@ page import = "uk.ac.dundee.computing.aec.instagrim.lib.CassandraHosts" %>
<%@ page import = "com.datastax.driver.core.Cluster" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%  LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");  
        lg.getUsername();
         Cluster cluster;
         User us = new User();
         cluster = CassandraHosts.getCluster();
         us.setCluster(cluster);
         lg.setAddress(us.getAddress(lg.getUsername()));
         lg.setBio(us.getBio(lg.getUsername()));
         lg.setEmail(us.getEmail(lg.getUsername()));
         lg.setFN(us.getFirstname(lg.getUsername()));
         lg.setLN(us.getLastName(lg.getUsername()));
         lg.setTwitter(us.getTwitter(lg.getUsername()));%>
        <h1>Edit details for <% out.println(lg.getUsername()); %></h1>
        <form method="POST"  action="EditDetails">
                <ul>
                    <li>User Name <input type="text" name="username" value="<%=lg.getUsername()%>" readOnly="true"></li>
                    <li>First Name <input type="text" name="firstname"value="<%=lg.getFN()%>"></li>
                    <li>Last Name <input type="text" name="lastname"value="<%=lg.getLN()%>"></li>
                    <li>Bio  <input type="text" name="bio"value="<%=lg.getBio()%>"></li>
                    <li>Address <input type="text" name="address"value="<%=lg.getAddress()%>"></li>
                    <li>Twitter <input type="text" name="twitter"value="<%=lg.getTwitter()%>"></li>
                    <li>Email <input type="text" name="email"value="<%=lg.getEmail()%>"></li>


                </ul>
                <br/>
                <input type="submit" value="Update"> 
            </form>
    </body>
</html>
