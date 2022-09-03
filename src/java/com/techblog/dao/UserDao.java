package com.techblog.dao;
import java.sql.*;


import com.techblog.entities.User;
import com.techblog.entities.contactuser;
public class UserDao {

	
	private Connection con;

	public UserDao(Connection con) {
		
		this.con = con;
	}
	
	
	
	//method to insert user to data base
	public boolean saveUser(User user) {
		boolean f=false;
		try {
		
			String query="insert into users(name,email,password,gender,about)values(?,?,?,?,?)";
			
			//prepared statement
			
			
			PreparedStatement ps=this.con.prepareStatement(query);
			
			ps.setString(1,user.getName());
			ps.setString(2,user.getEmail());
			ps.setString(3,user.getPassword());
			ps.setString(4,user.getGender());
			ps.setString(5,user.getAbout());
                      
			ps.executeUpdate();
			f=true;
			
			
			
		} catch (Exception e) {
	e.printStackTrace();
		}
		
		
		return f;
	}
	
//get user by email and userpassword
	public User getUserbyEmailandPass(String email,String pass){
            User user=null;
            
            
            try {
                String query="select *from users where email=? and password=?";
                PreparedStatement ps=con.prepareStatement(query);
                ps.setString(1, email);
                ps.setString(2, pass);
               ResultSet s=ps.executeQuery();
                if(s.next()){
                  user=new User();
                   String name=s.getString("name");
                   user.setName(name);
                    user.setEmail(s.getString("email"));
               user.setPassword(s.getString("password"));
               user.setGender(s.getString("gender"));
                user.setAbout(s.getString("about"));
                user.setProfile(s.getString("profile"));
             
               user.setId(s.getInt("id"));
                
                }
                
                
            } catch (Exception e) {
            
            e.printStackTrace();
            }
           return user;
        }




//update user
        public boolean updateUser(User user){
            boolean b=false;
            try {
                String query="update users set name=?,email=?,password=?,profile=?,about=?where id=?";
                PreparedStatement ps=con.prepareStatement(query);
          ps.setString(1,user.getName());
         ps.setString(2, user.getEmail());
         ps.setString(3, user.getPassword());
          ps.setString(4, user.getProfile());
          ps.setString(5, user.getAbout());
          ps.setInt(6, user.getId());
          ps.executeUpdate();
          b=true;
                
            } catch (Exception e) {
                e.printStackTrace();
            }
            return b;
        }


        
        
        
        
        
        
        
        
        
        
        
        
        
        
        public boolean  saveinfo(contactuser u) {
		boolean f=false;
		try {
		
			String q1="insert into contact(name,email,msg)values(?,?,?)";
			
			//prepared statement
			
			
			PreparedStatement ps=con.prepareStatement(q1);
			
			ps.setString(1,u.getName());
			ps.setString(2,u.getEmail());
			
                        ps.setString(3,u.getMsg());
			ps.executeUpdate();
			f=true;
			
			
			
		} catch (Exception e) {
	e.printStackTrace();
		}
		
		
		return f;
	}
}