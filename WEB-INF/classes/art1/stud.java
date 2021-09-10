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



public class stud{
	public String userName;
	String emailId;
	String degree;
	String year;
	String campus;
	
	
	public BigDecimal activityScore;
	public BigDecimal selfEsteemScore;
	
	 public stud(String name, String maily,String deg,String yr,String camp,BigDecimal activity,BigDecimal selfEsteem){
		this.userName = name;
		this.emailId = maily;
		this.degree = deg;
		this.year = yr;
		this.campus = camp;
		
		this.activityScore = activity;
		this.selfEsteemScore = selfEsteem;
		
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

    public BigDecimal getactivityScore() {
        return activityScore;
    }
    public void setactivityScore(BigDecimal activityScore) {
        this.activityScore = activityScore;
    }
	public BigDecimal getselfEsteemScore() {
        return selfEsteemScore;
    }
    public void setselfEsteemScore(BigDecimal selfEsteemScore) {
        this.selfEsteemScore = selfEsteemScore;
    }
   
    public String toString(){
        return "[" + userName + "," + emailId + "," +  degree + "," +  year + "," +  campus + "," + activityScore + "," +  selfEsteemScore + "," + "]";
    }
  }
