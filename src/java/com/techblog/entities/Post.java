/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.techblog.entities;

import java.security.Timestamp;

public class Post {
private int pid;
private String Ptitle;
private String Pcontent;
private String Pcode;
private String Ppic;
private java.sql.Timestamp Pdate;
private int catid;
private int userid;

    public Post(String Ptitle, String Pcontent, String Pcode, String Ppic, int catid, int userid) {
        this.Ptitle = Ptitle;
        this.Pcontent = Pcontent;
        this.Pcode = Pcode;
        this.Ppic = Ppic;
        this.catid = catid;
        this.userid = userid;
    }

    public Post(int pid, String Ptitle, String Pcontent, String Pcode, String Ppic, int catid, int userid) {
        this.pid = pid;
        this.Ptitle = Ptitle;
        this.Pcontent = Pcontent;
        this.Pcode = Pcode;
        this.Ppic = Ppic;
        this.catid = catid;
        this.userid = userid;
    }

    public Post(int pid, String Ptitle, String Pcontent, String Pcode, String Ppic, java.sql.Timestamp d, int catid, int userid) {
         this.pid = pid;
        this.Ptitle = Ptitle;
        this.Pcontent = Pcontent;
        this.Pcode = Pcode;
        this.Ppic = Ppic;
        this.catid = catid;
        this.userid = userid;
        this.Pdate=d;
    }

  

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public Post() {
    }

    public String getPcode() {
        return Pcode;
    }

    public void setPcode(String Pcode) {
        this.Pcode = Pcode;
    }

    
    public Post(String Ptitle, String Pcontent, String Ppic, int catid) {
        this.Ptitle = Ptitle;
        this.Pcontent = Pcontent;
        this.Ppic = Ppic;
        this.catid = catid;
    }


    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getPtitle() {
        return Ptitle;
    }

    public void setPtitle(String Ptitle) {
        this.Ptitle = Ptitle;
    }

    public String getPcontent() {
        return Pcontent;
    }

    public void setPcontent(String Pcontent) {
        this.Pcontent = Pcontent;
    }

    public String getPpic() {
        return Ppic;
    }

    public void setPpic(String Ppic) {
        this.Ppic = Ppic;
    }

    public java.sql.Timestamp getPdate() {
        return Pdate;
    }

    public void setPdate(java.sql.Timestamp Pdate) {
        this.Pdate = Pdate;
    }

    public int getCatid() {
        return catid;
    }

    public void setCatid(int catid) {
        this.catid = catid;
    }

}
