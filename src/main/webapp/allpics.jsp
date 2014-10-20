<%-- 
    Document   : allpics
    Created on : Oct 4, 2014, 2:41:56 AM
    Author     : Yogi
--%>

<<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="uk.ac.dundee.computing.aec.instagrim.stores.*" %>

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
         lg.getUsername();%>
         <h1> All pics </h1>
         <h1>  </h1>
         <h2>  </h2>
        </header>
        
        <nav>
            <ul>
                <li class="nav"><a href="/Instagrim/upload.jsp">Upload</a></li>
                <li class="nav"><a href="/Instagrim/Images/majed">Sample Images</a></li>
            </ul>
        </nav>
 
        <article>
           
        <%
            java.util.LinkedList<Pic> lsPics = (java.util.LinkedList<Pic>) request.getAttribute("allPics");
            if (lsPics == null) {
        %>
        <p>No Pictures found</p>
        <%
        } else {
            
for (int i =0; i<lsPics.size(); i++ ){	// my code, replicates Andy's code above
             	Pic p = lsPics.get(i);

        %>
        <a href="/Instagrim/Image/<%=p.getSUUID()%>" ><img src="/Instagrim/Thumb/<%=p.getSUUID()%>"></a>
        
        <a><% out.println(p.getName());  %></a></br>
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