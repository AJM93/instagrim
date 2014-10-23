<%-- 
    Document   : UsersPics
    Created on : Sep 24, 2014, 2:52:48 PM
    Author     : Administrator
--%>

<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="uk.ac.dundee.computing.aec.instagrim.stores.*" %>
<%@ page import="uk.ac.dundee.computing.aec.instagrim.models.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Instagrim</title>
        <link rel="stylesheet" type="text/css" href="/Instagrim/Styles.css" />
    </head>
    <body>
        <header>
        <% LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn"); 
         lg.getUsername();
         PicModel pm = new PicModel();
        %>
         <h1> <%  out.println(lg.getUsername()); %> </h1>
         <h1><a target="_blank" href="http://www.twitter.com/<%out.println(lg.getTwitter());%>">@<% out.println(lg.getTwitter()); %></a>  </h1>
         <h2> "<% out.println(lg.getBio()); %>" </h2>
        </header>
        
        <nav>
            <ul>
                <li><a href="/Instagrim/Images/<%=lg.getUsername()%>">Your Images</a></li>
                <li class="nav"><a href="/Instagrim/upload.jsp">Upload</a></li>
                <li class="nav"><a href="/Instagrim/Images/majed">All Images</a></li>
            </ul>
        </nav>
 
        <article>
           
        <%
            java.util.LinkedList<Pic> lsPics = (java.util.LinkedList<Pic>) request.getAttribute("Pics");
            if (lsPics == null) {
        %>
        <p>No Pictures found</p>
        <%
        } else {
            
for (int i =0; i<lsPics.size(); i++ ){ 
             	Pic p = lsPics.get(i);

        %>
        <a href="/Instagrim/Image/<%=p.getSUUID()%>" ><img src="/Instagrim/Thumb/<%=p.getSUUID()%>"></a>
        <a href="/Instagrim/Images/<%=p.getUser()%>" > <% out.println(p.getUser());%> </a>
        <a><% out.println(p.getName());  %></a>
        <a href="/Instagrim/Delete/<%=p.getSUUID()%>" > Delete </a></br>
        
        
        <%
        
            }
            }
        %>
       
        </article>
        <footer>
            <ul>
                <li class="footer"><a href="/Instagrim">Home</a></li>
            </ul>
        </footer>
    </body>
</html>
