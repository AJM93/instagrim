/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uk.ac.dundee.computing.aec.instagrim.stores;

import com.datastax.driver.core.utils.Bytes;
import java.nio.ByteBuffer;



/**
 *
 * @author Administrator
 */
public class Pic {

    private ByteBuffer bImage = null;
    private int length;
    private String type;
        private String user;

    private java.util.UUID UUID=null;
    private String name= null;
    
    public void Pic() {

    }
    
    public void setName(String name){
        this.name = name;
    }
    public String getName(){
        return name;
    }
    public void setUser(String user){
        this.user = user;
    }
    public String getUser(){
        return user;
    }
    public void setUUID(java.util.UUID UUID){
        this.UUID =UUID;
    }
    public java.util.UUID getUUID(){
        return this.UUID;
    }
    public String getSUUID(){
        return UUID.toString();
    }
    public void setPic(ByteBuffer bImage, int length,String type) {
        this.bImage = bImage;
        this.length = length;
        this.type=type;
    }

    public ByteBuffer getBuffer() {
        return bImage;
    }

    public int getLength() {
        return length;
    }
    
    public String getType(){
        return type;
    }

    public byte[] getBytes() {
         
        byte image[] = Bytes.getArray(bImage);
        return image;
    }

}
