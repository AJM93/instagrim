/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
//login,addresses,bio,email,first_name,last_name,password,twitter

package uk.ac.dundee.computing.aec.instagrim.stores;

/**
 *
 * @author Administrator
 */
public class LoggedIn {
    boolean logedin=false;
    String Username=null;
    String firstname = null;
    String email = null;
    String twitter = null;
    String address = null;
    String lastname= null;
    String picid = null;
   
   
        String bio = null;


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
    public void setPP(String picid){
        System.out.println("setting" + Username);
        this.picid=picid;
    }
    public String getPP(){
        return picid;
        
    }
    public void setFN(String fn){
        this.firstname = fn;
    
    }
    
    public String getFN(){
        return firstname;
    }
    public void setLN(String ln){
        this.lastname = ln;
    
    }
    
    public String getLN(){
        return lastname;
    }
    
    public void setAddress(String address){
        this.address = address;
    
    }
    
    public String getAddress(){
        return address;
    }
    
    public void setTwitter(String twitter){
        this.twitter = twitter;
    
    }
    
    public String getTwitter(){
        return this.twitter;
    }
    
    public void setEmail(String email){
        this.email = email;
    
    }
    
    public String getEmail(){
        return this.email;
    }
    public void setBio(String bio){
        this.bio = bio;
    
    }
    
    public String getBio(){
        return bio;
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
