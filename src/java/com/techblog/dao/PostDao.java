/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.techblog.dao;
import com.techblog.entities.Category;
import com.techblog.entities.Post;
import com.techblog.entities.User;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
public class PostDao {
    //fetch the all category from db
    
    Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }
    public ArrayList  getALLCategories(){
        ArrayList<Category>list=new ArrayList<>();
        
        try {
           String q="Select *from Categories";
           
            Statement s=con.createStatement();
          ResultSet set= s.executeQuery(q);
            while (set.next()) {                
             int cid=set.getInt("cid");
             String name=set.getString("name");
             String description=set.getString("description");
               Category c=new Category(cid, name, description);
               list.add(c);
          
            }
           
           
           
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return list;
        
        
    }
    
    
    
    
    public boolean savePost(Post p){
        boolean save=false;
        
        try {
           String query="insert into Post(Ptitle,Pcontent,Pcode,Ppic,catid,userid)values(?,?,?,?,?,?)";
           PreparedStatement ps=con.prepareStatement(query);
           ps.setString(1,p.getPtitle());
           ps.setString(2,p.getPcontent());
           ps.setString(3, p.getPcode());
           ps.setString(4, p.getPpic());
           ps.setInt(5,p.getCatid());
           ps.setInt(6, p.getUserid());
           
           
           
           ps.executeUpdate();
           save=true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        
        return save;
        
    }




//get All Posts
public List<Post>getAllPosts(){
    
       List<Post>l=new ArrayList<>();
     try {
        PreparedStatement p=con.prepareStatement("select*from Post order by pid desc");
    ResultSet set=p.executeQuery();
   
         while (set.next()) {             
             int pid=set.getInt("pid");
             String Ptitle=set.getString("Ptitle");
             
             String Pcontent=set.getString("Pcontent");
             String Pcode=set.getString("Pcode");
             
             String Ppic=set.getString("Ppic");
            Timestamp d=set.getTimestamp("Pdate");
             int catid=set.getInt("catid");
             int userid=set.getInt("userid");
     Post post=new Post(pid, Ptitle, Pcontent, Pcode, Ppic,d,catid, userid);
            l.add(post);
             
             
         }
     
     
     
     } catch (Exception e) {
        e.printStackTrace();
    }
       
       
       
   return l;



}








//get post by category



public List<Post> getPostCatId(int catid){
    List<Post>l1=new ArrayList<>();
    
    try {
        PreparedStatement p=con.prepareStatement("select*from Post where catid=?");
    
        
        p.setInt(1,catid);
        
        ResultSet set=p.executeQuery();
   
         while (set.next()) {             
             int pid=set.getInt("pid");
             String Ptitle=set.getString("Ptitle");
             
             String Pcontent=set.getString("Pcontent");
             String Pcode=set.getString("Pcode");
             
             String Ppic=set.getString("Ppic");
            
         
             int userid=set.getInt("userid");
     Post post=new Post(pid, Ptitle, Pcontent, Pcode, Ppic,catid, userid);
            l1.add(post);
             
             
         }
     
     
     
     } catch (Exception e) {
        e.printStackTrace();
    }
       
       
       
       
       
       
    return l1;
}














public Post getPostById(int postid) throws SQLException{
Post p=null;
    
    String q="select*from Post where pid=?";
    
    
      PreparedStatement ps=con.prepareStatement(q);
ps.setInt(1, postid);

ResultSet set=ps.executeQuery();
if(set.next())
{
    int pid=set.getInt("pid");
             String Ptitle=set.getString("Ptitle");
             
             String Pcontent=set.getString("Pcontent");
             String Pcode=set.getString("Pcode");
             
             String Ppic=set.getString("Ppic");
            Timestamp d=set.getTimestamp("Pdate");
             int catid=set.getInt("catid");
             int userid=set.getInt("userid");
     p=new Post(pid, Ptitle, Pcontent, Pcode, Ppic,d,catid, userid);
     
}





        return p;



}




public User getUserByPost(int userid) throws SQLException{
    User u=new User();
   String q="select*from users where id=?" ;
  PreparedStatement  ps= con.prepareStatement(q);
   
  ps.setInt(1, userid);
 ResultSet s= ps.executeQuery();
 if(s.next()){
   u.setName(s.getString("name"));
   
 }
    
 return  u;
    
}




public List<Post>getonly4Post(){
    
       List<Post>l=new ArrayList<>();
     try {
        PreparedStatement p=con.prepareStatement("select*from Post order by pid desc Limit 1");
    ResultSet set=p.executeQuery();
   
         while (set.next()) {             
             int pid=set.getInt("pid");
             String Ptitle=set.getString("Ptitle");
             
             String Pcontent=set.getString("Pcontent");
             String Pcode=set.getString("Pcode");
             
             String Ppic=set.getString("Ppic");
            Timestamp d=set.getTimestamp("Pdate");
             int catid=set.getInt("catid");
             int userid=set.getInt("userid");
     Post post=new Post(pid, Ptitle, Pcontent, Pcode, Ppic,d,catid, userid);
            l.add(post);
             
             
         }
     
     
     
     } catch (Exception e) {
        e.printStackTrace();
    }
       
       
       
   return l;



}











 public ArrayList  getonly2(){
        ArrayList<Category>list=new ArrayList<>();
        
        try {
           String q="Select *from Categories Limit 5";
           
            Statement s=con.createStatement();
          ResultSet set= s.executeQuery(q);
            while (set.next()) {                
             int cid=set.getInt("cid");
             String name=set.getString("name");
             String description=set.getString("description");
               Category c=new Category(cid, name, description);
               list.add(c);
          
            }
           
           
           
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return list;
        
        
    }
    
    























}


