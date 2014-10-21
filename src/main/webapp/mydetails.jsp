<%-- 
    Document   : mydetails
    Created on : Oct 21, 2014, 7:42:08 PM
    Author     : Yogi
--%>
<%@ page import="uk.ac.dundee.computing.aec.instagrim.stores.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn"); 
         lg.getUsername();%>
         <h1><% out.println(lg.getUsername());%></h1>
         <h1><% out.println(lg.getFN());%></h1>
         <h1><% out.println(lg.getLN());%></h1>
<h1><a href="http://www.twitter.com/<%out.println(lg.getTwitter());%>"><% out.println(lg.getTwitter()); %></a>  </h1>            <h1><% out.println(lg.getBio());%></h1>

         <h1><% out.println(lg.getAddress());%></h1>
         <h1><% out.println(lg.getEmail());%></h1>
       
    </body>
</html>
