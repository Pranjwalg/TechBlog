/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.techblog.dao;

import com.techblog.entities.contactuser;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;


public class contactDao {
    
    private final Connection con;

	public contactDao(Connection con) {
		
		this.con = con;
	}
	
    
   
     public boolean a(contactuser user) {
         
         boolean f=false;
        try{ 
         String q="insert into con(contactn,contactemail,msg)values(?,?,?)";
        PreparedStatement ps= con.prepareStatement(q);
        ps.setString(1,user.getName());
        ps.setString(2, user.getEmail());
               
        ps.setString(3, user.getMsg());
        ps.executeUpdate();
        f=true;
        }
        catch(Exception e){
    e.printStackTrace();
        }
        return f;
}

}