/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package uk.ac.dundee.computing.aec.instagrim.stores;

/**
 *
 * @author Administrator
 */
public class LoggedIn {
    boolean logedin=false;
    String Username=null;
    String firstname = null;

    public void LogedIn(){
        
    }
    
    public void setUsername(String name){
        System.out.println("setting" + Username);
        this.Username=name;
        System.out.println("setting" + name + " " + Username);
    }
    public String getUsername(){
        System.out.println("IM WORKING"+ Username);
        return Username;
        
    }
    public void setFN(String fn){
        this.firstname = fn;
    
    }
    
    public String getFN(){
        return firstname;
    }
    public void setLogedin(){
        logedin=true;
    }
    public void setLogedout(){
        logedin=false;
    }
    
    public void setLoginState(boolean logedin){
        this.logedin=logedin;
    }
    public boolean getlogedin(){
        return logedin;
    }
}
