<%-- 
    Document   : mydetails
    Created on : Oct 21, 2014, 7:42:08 PM
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
        <% LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn"); 
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
         lg.setTwitter(us.getTwitter(lg.getUsername()));
        %>
         <h1><% out.println(lg.getUsername());%></h1>
         <h1><% out.println(lg.getFN());%></h1>
         <h1><% out.println(lg.getLN());%></h1>
<h1><a target="_blank" href="http://www.twitter.com/<%out.println(lg.getTwitter());%>">@<% out.println(lg.getTwitter()); %></a>  </h1>            <h1><% out.println(lg.getBio());%></h1>

         <h1><% out.println(lg.getAddress());%></h1>
         <h1><% out.println(lg.getEmail());%></h1>
       
    </body>
</html>
