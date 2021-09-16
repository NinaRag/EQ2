package art1;

import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.sql.Statement;
import javax.servlet.http.*;
import javax.servlet.*;
import java.io.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.math.BigDecimal;
import javax.servlet.RequestDispatcher;



public class student{
	public String userName;
	String emailId;
	String degree;
	String year;
	String campus;
	public String mentorName;
	
	
	 public student(String name, String maily,String deg,String yr,String camp,String mentorName){
		this.userName = name;
		this.emailId = maily;
		this.degree = deg;
		this.year = yr;
		this.campus = camp;
		this.mentorName=mentorName;
	}
	 public String getuserName() {
        return userName;
    }
    public void setuserName(String userName) {
        this.userName = userName;
    }
    public String getemailId() {
        return emailId;
    }
    public void setemailId(String emailId) {
        this.emailId = emailId;
    }
	 public String getdegree() {
        return degree;
    }
    public void setdegree(String degree) {
        this.degree = degree;
    }
    public String getyear() {
        return year;
    }
    public void setyear(String year) {
        this.year = year;
    }
    public String getcampus() {
        return campus;
    }
    public void setcampus(String campus) {
        this.campus = campus;
    }
   
    public String getmentor() {
        return mentorName;
    }
    public void setmentor(String mentorName) {
        this.mentorName = mentorName;
    }
    public String toString(){
        return "[" + userName + "," + emailId + "," +  degree + "," +  year + "," +  campus + "," + mentorName + "]";
    }
  }