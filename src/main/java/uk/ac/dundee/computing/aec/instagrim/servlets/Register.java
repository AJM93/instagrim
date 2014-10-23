/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package uk.ac.dundee.computing.aec.instagrim.servlets;

import com.datastax.driver.core.Cluster;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import uk.ac.dundee.computing.aec.instagrim.lib.CassandraHosts;
import uk.ac.dundee.computing.aec.instagrim.models.User;

/**
 *
 * @author Administrator
 */
@WebServlet(name = "Register", urlPatterns = {"/Register"})
public class Register extends HttpServlet {
    Cluster cluster=null;
    public void init(ServletConfig config) throws ServletException {
        // TODO Auto-generated method stub
        cluster = CassandraHosts.getCluster();
    }




    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //,addresses,bio,email,first_name,last_name,,twitter

        String username=request.getParameter("username");
        String password=request.getParameter("password");
        String twitter=request.getParameter("twitter");
        String email=request.getParameter("email");
        String address=request.getParameter("address");
        String bio=request.getParameter("bio");
        String fn=request.getParameter("firstname");
        String ln=request.getParameter("lastname");
         User us=new User();
        // us.RegisterUser("a", "a", "a", "a", "a", "a", "a", "a");
                //  us.RegisterUser("b", "b", "b", "c", "d", "e", "f", "g");

        us.setCluster(cluster);
        //if(""!=username){
        //if (us.userExists(username)){
          //  error("user "+ username +" exists", response);
        //}
        //}
        
        if (""!=username && ""!=password && ""!=twitter && ""!=email  && ""!=address
                 && ""!=bio && ""!=fn && ""!=ln ){
       
        us.RegisterUser(username, password, address, bio, email, fn, ln, twitter);
        
	response.sendRedirect("/Instagrim");
        }else{	
           error("One or more registration fields is missing data", response);
        }

        
    }
    
     private void error(String error, HttpServletResponse response) throws ServletException, IOException {
       PrintWriter out = null;
        out = new PrintWriter(response.getOutputStream());
        out.println(error);
        out.println("Press the 'back' button to go back to register page");

        out.close();
        return;
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
