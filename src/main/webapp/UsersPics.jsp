<%-- 
    Document   : UsersPics
    Created on : Sep 24, 2014, 2:52:48 PM
    Author     : Administrator
--%>

<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="uk.ac.dundee.computing.aec.instagrim.stores.*" %>
<%@ page import="uk.ac.dundee.computing.aec.instagrim.models.*" %>
<%@ page import = "uk.ac.dundee.computing.aec.instagrim.lib.CassandraHosts" %>
<%@ page import = "com.datastax.driver.core.Cluster" %>

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
         Cluster cluster;

                        User us = new User();
                        cluster = CassandraHosts.getCluster();
                          pm.setCluster(cluster);
                        us.setCluster(cluster);
                                 lg.setPP(us.getPP(lg.getUsername()));

        %>
        <!-- <h1> <%  out.println(lg.getUsername()); %> </h1>   -->              <!-- <a href="/Instagrim/Image/<%=lg.getPP()%>" ><img src="/Instagrim/Thumb/<%=lg.getPP()%>"></a> --->



         <!--<h1><a target="_blank" href="http://www.twitter.com/<%out.println(lg.getTwitter());%>">@<% out.println(lg.getTwitter()); %></a>  </h1>
         <h2> "<% out.println(lg.getBio()); %>" </h2> -->
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
            java.util.LinkedList<String> comments = new java.util.LinkedList<>();
            java.util.LinkedList<String> users = new java.util.LinkedList<>();

            if (lsPics == null) {
        %>
        <p>No Pictures found</p>
        <%
        } else {
            
for (int i =0; i<lsPics.size(); i++ ){ 
             	Pic p = lsPics.get(i);
                comments=pm.getComments(p.getSUUID());
                users=pm.getUsers(p.getSUUID());
                if(us.doesFollow(lg.getUsername(), p.getUser())){
                
        %>
        <a href="/Instagrim/Image/<%=p.getSUUID()%>" ><img src="/Instagrim/Thumb/<%=p.getSUUID()%>"></a>
        <a><% out.println(p.getName());  %></a>
        <% if(lg.getUsername().equals(p.getUser())){ %>
        <form action="/Instagrim/Delete/<%=p.getSUUID()%>">
    <input type="submit" value="Delete" >
        </form>
       <!-- <a href="/Instagrim/Delete/<%=p.getSUUID()%>" > Delete </a> -->
        <% } %>
        <form action="/Instagrim/UpdateAvatar/<%=p.getSUUID()%>">
    <input type="submit" value="Update Avatar" >
        </form>
        
        <IMG HEIGHT=50 WIDTH=50 SRC="/Instagrim/Image/<%=us.getPP(p.getUser())%>" >
        <a href="/Instagrim/Images/<%=p.getUser()%>" > <% out.println(p.getUser());%> </a>
        <a target="_blank" href="http://www.twitter.com/<%out.println(us.getTwitter(p.getUser()));%>">     @<% out.println("    " +us.getTwitter(p.getUser())); %></a>
        </br>
        <a><% out.println("''"+us.getBio(p.getUser())+"''"); %></a>
        </br>
        
        
         
            <form name="input" action="/Instagrim/Comment" method="post">
                <input type="text" name="user" value="<%=lg.getUsername()%>" hidden>
                <input type="text" name="picid" value="<%=p.getSUUID()%>" hidden>
                <input type="text" name="comment">


                <input type="submit" value="Comment">
            </form>
                <a>Comments:</a></br>
       <% 
       
       if (comments!=null) { 
       for(int j=0; j<comments.size();j++)
       {%>
               <IMG HEIGHT=25 WIDTH=25 SRC="/Instagrim/Image/<%=us.getPP(users.get(j))%>" >

       <a href="/Instagrim/Images/<%=users.get(j) %>" > <% out.println(users.get(j));%> </a>
        <a> <% out.println(comments.get(j)); %> </a></br>
        
        
        
        
        <%
       }
       %>
       </br>
       -------------------------------------------------------------------------------------------------------
       </br>
       </br>
       <%
       }
        
            }
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
