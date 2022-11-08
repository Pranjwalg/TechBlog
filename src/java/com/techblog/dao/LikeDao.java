
package com.techblog.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class LikeDao {
    
    Connection con;

    public LikeDao(Connection con) {
        this.con = con;
    }
    
    
    
    
    
    
 public boolean inserLike(int postid,int userid) {
     boolean f=false;
     try{
     String q="insert into Liked(Pid,Uid)values(?,?)";
     PreparedStatement ps=  con.prepareStatement(q);
     ps.setInt(1,postid);
     ps.setInt(2, userid);
     ps.executeUpdate();
     f=true;
     }
     catch(Exception e){
         e.printStackTrace();
     }
     return f;
 }
 
 
 
 
 
 
 
 public int countLike(int postid){
     int count=0;
     
     
     
     try {
         
         
         String q="select count(*)from Liked where Pid=?";
          
       PreparedStatement ps=  con.prepareStatement(q);
     ps.setInt(1,postid);
       ResultSet r=ps.executeQuery();
         if(r.next()){
             
             count=r.getInt("count(*)");
         }
     } catch (Exception e) {
         e.printStackTrace();
     }
     
     
     
     return count;
     
     
 }
 
 
 
 public boolean isLikedBYUser(int userid,int postid){
     boolean f=false;
     
     try {
         String q="select*from Liked where Uid=?and Pid=?";
         
         
        PreparedStatement ps= con.prepareStatement(q);
        ps.setInt(1,userid);
        ps.setInt(2, postid);
        ResultSet s=ps.executeQuery();
        if(s.next()){
            f=true;
        }
     } catch (Exception e) {
         e.printStackTrace();
     }
     
     return f;
 }
 
 




public boolean DeleteLikedBYUser(int userid,int postid){
     boolean f=false;
     
     try {
         String q="delete from Liked where Uid=?and Pid=?";
         
         
        PreparedStatement ps= con.prepareStatement(q);
        ps.setInt(1,userid);
        ps.setInt(2, postid);
        ResultSet s=ps.executeQuery();
        f=true;
      
     } catch (Exception e) {
         e.printStackTrace();
     }
     
     return f;
 }
 
 

















 
 
 
}
