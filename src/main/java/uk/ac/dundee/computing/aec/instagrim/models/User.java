/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
//login,addresses,bio,email,first_name,last_name,password,twitter
package uk.ac.dundee.computing.aec.instagrim.models;
//package com.example.cassandra;

import com.datastax.driver.core.BoundStatement;
import com.datastax.driver.core.Cluster;
import com.datastax.driver.core.PreparedStatement;
import com.datastax.driver.core.ResultSet;
import com.datastax.driver.core.Row;
import com.datastax.driver.core.Session;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import uk.ac.dundee.computing.aec.instagrim.lib.AeSimpleSHA1;
import uk.ac.dundee.computing.aec.instagrim.stores.Pic;
import com.datastax.driver.core.Host;
import com.datastax.driver.core.Metadata;

/**
 *
 * @author Administrator
 */
public class User {
    Cluster cluster;
    public User(){
        
    }
            //,addresses,bio,email,first_name,last_name,,twitter

    
    public boolean RegisterUser(String username, String Password, String address, String bio, String email, String first_name, String last_name, String twitter){
        AeSimpleSHA1 sha1handler=  new AeSimpleSHA1();
        String EncodedPassword=null;
        try {
            EncodedPassword= sha1handler.SHA1(Password);
        }catch (UnsupportedEncodingException | NoSuchAlgorithmException et){
            System.out.println("Can't check your password");
            return false;
        }
                //,addresses,bio,email,first_name,last_name,,twitter

        Session session = cluster.connect("instagrim");
        PreparedStatement ps = session.prepare("insert into userprofiles (login,password,addresses,bio,email,first_name,last_name,twitter) Values(?,?,?,?,?,?,?,?)");
       
        BoundStatement boundStatement = new BoundStatement(ps);
        session.execute( // this is where the query is executed
                boundStatement.bind( // here you are binding the 'boundStatement'
                        username,EncodedPassword,address,bio,email,first_name,last_name,twitter));
        //We are assuming this always works.  Also a transaction would be good here !
        
        return true;
    }
    
    public boolean userExists(String username){
        
        Session session = cluster.connect("instagrim");
        PreparedStatement ps = session.prepare("select first_name from userprofiles where login =?");
        ResultSet rs = null;
        BoundStatement boundStatement = new BoundStatement(ps);
        rs = session.execute( // this is where the query is executed
                boundStatement.bind( // here you are binding the 'boundStatement'
                        username));
        if (rs.isExhausted()) {
            System.out.println("No Images returned");
            return true;
        } else {
            for (Row row : rs) {
               
                String StoredPass = row.getString("first_name");
               
                    return true;
            
        }
   
    
    return false; 
    }
    }
    
    public boolean IsValidUser(String username, String Password){
        AeSimpleSHA1 sha1handler=  new AeSimpleSHA1();
        String EncodedPassword=null;
        try {
            EncodedPassword= sha1handler.SHA1(Password);
        }catch (UnsupportedEncodingException | NoSuchAlgorithmException et){
            System.out.println("Can't check your password");
            return false;
        }
        Session session = cluster.connect("instagrim");
        PreparedStatement ps = session.prepare("select password from userprofiles where login =?");
        ResultSet rs = null;
        BoundStatement boundStatement = new BoundStatement(ps);
        rs = session.execute( // this is where the query is executed
                boundStatement.bind( // here you are binding the 'boundStatement'
                        username));
        if (rs.isExhausted()) {
            System.out.println("No Images returned");
            return false;
        } else {
            for (Row row : rs) {
               
                String StoredPass = row.getString("password");
                if (StoredPass.compareTo(EncodedPassword) == 0)
                    return true;
            }
        }
   
    
    return false;  
    }
       public void setCluster(Cluster cluster) {
        this.cluster = cluster;
    }
       
       public String getFirstname(String username){
           String storedfn = "";
       
           Session session = cluster.connect("instagrim");
           PreparedStatement ps = session.prepare("select first_name from userprofiles where login =?");
           ResultSet rs = null;
        BoundStatement boundStatement = new BoundStatement(ps);
        rs = session.execute( // this is where the query is executed
                boundStatement.bind( // here you are binding the 'boundStatement'
                        username));
        if (rs.isExhausted()) {
            System.out.println("No Images returned");
            return "no first name stored";
        } else {
            for (Row row : rs) {
               
                 storedfn = row.getString("first_name");
                
            }
           
           
           return storedfn;
       }
       }
       
    /**
     *
     * @param username
     * @return
     */
    public String getBio(String username){
           String storedbio = "";
       
           Session session = cluster.connect("instagrim");
           PreparedStatement ps = session.prepare("select bio from userprofiles where login =?");
           ResultSet rs = null;
        BoundStatement boundStatement = new BoundStatement(ps);
        rs = session.execute( // this is where the query is executed
                boundStatement.bind( // here you are binding the 'boundStatement'
                        username));
        if (rs.isExhausted()) {
            System.out.println("No Images returned");
            return "no first name stored";
        } else {
            for (Row row : rs) {
               
                 storedbio = row.getString("bio");
                
            }
           
           
           return storedbio;
       }
       }
    
    public String getTwitter(String username){
           String storedtwitter = "";
       
           Session session = cluster.connect("instagrim");
           PreparedStatement ps = session.prepare("select twitter from userprofiles where login =?");
           ResultSet rs = null;
        BoundStatement boundStatement = new BoundStatement(ps);
        rs = session.execute( // this is where the query is executed
                boundStatement.bind( // here you are binding the 'boundStatement'
                        username));
        if (rs.isExhausted()) {
            System.out.println("No Images returned");
            return "no first name stored";
        } else {
            for (Row row : rs) {
               
                 storedtwitter = row.getString("twitter");
                
            }
           
           
           return storedtwitter;
       }
       }
    
    public String getLastName(String username){
           String storedlastname = "";
       
           Session session = cluster.connect("instagrim");
           PreparedStatement ps = session.prepare("select last_name from userprofiles where login =?");
           ResultSet rs = null;
        BoundStatement boundStatement = new BoundStatement(ps);
        rs = session.execute( // this is where the query is executed
                boundStatement.bind( // here you are binding the 'boundStatement'
                        username));
        if (rs.isExhausted()) {
            System.out.println("No Images returned");
            return "no first name stored";
        } else {
            for (Row row : rs) {
               
                 storedlastname = row.getString("last_name");
                
            }
           
           
           return storedlastname;
       }
       }
    
    public String getAddress(String username){
           String storedaddress = "";
       
           Session session = cluster.connect("instagrim");
           PreparedStatement ps = session.prepare("select addresses from userprofiles where login =?");
           ResultSet rs = null;
        BoundStatement boundStatement = new BoundStatement(ps);
        rs = session.execute( // this is where the query is executed
                boundStatement.bind( // here you are binding the 'boundStatement'
                        username));
        if (rs.isExhausted()) {
            System.out.println("No Images returned");
            return "no first name stored";
        } else {
            for (Row row : rs) {
               
                 storedaddress = row.getString("addresses");
                
            }
           
           
           return storedaddress;
       }
       }
    
    public String getEmail(String username){
           String storedemail = "";
       
           Session session = cluster.connect("instagrim");
           PreparedStatement ps = session.prepare("select email from userprofiles where login =?");
           ResultSet rs = null;
        BoundStatement boundStatement = new BoundStatement(ps);
        rs = session.execute( // this is where the query is executed
                boundStatement.bind( // here you are binding the 'boundStatement'
                        username));
        if (rs.isExhausted()) {
            System.out.println("No Images returned");
            return "no first name stored";
        } else {
            for (Row row : rs) {
               
                 storedemail = row.getString("email");
                
            }
           
           
           return storedemail;
       }
       }
    
    public void editBio(String newbio, String login) {
        System.out.println("editbio");
        Session session = cluster.connect("instagrim");
        

          // PreparedStatement ps = session.prepare("UPDATE userprofiles SET bio ='" + newbio + "' where login ='"+ login+"'");
           //BoundStatement boundStatement = new BoundStatement(ps);
          // UPDATE userprofiles SET bio ='bio' where login = 'Yogehh';
           
           //ResultSet rs = null;
           //rs = session.execute( // this is where the query is executed
             //   boundStatement.bind( // here you are binding the 'boundStatement'
               //         newbio,login));
           
        
    }
}

    

