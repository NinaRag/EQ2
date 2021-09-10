package art1;
import art.articlesPublished;

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



public class ment{
	public String name;
	public String emailId;
	String place;
	String contact;
	String qualification;
	String affiliation;
	public ArrayList<String> student = new ArrayList<>();
	ArrayList<String> ideas = new ArrayList<>();
	public ArrayList<articlesPublished> articles = new ArrayList<>();
	//public String mentorName;
	
	
	 public ment(String name, String maily,String place,String contact,String qualifica,String aff,ArrayList<String> idea,ArrayList<articlesPublished> article,ArrayList<String> student){
		this.name = name;
		this.emailId = maily;
		this.place = place;
		this.contact = contact;
		this.qualification = qualifica;
		this.affiliation = aff;
		this.ideas = idea;
		this.articles = article;
		this.student = student;
		
	
		
		
		//this.degree = deg;
		//this.year = yr;
		//this.campus = camp;
		//this.mentorName=mentorName;
	}
	 public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getemailId() {
        return emailId;
    }
    public void setemailId(String emailId) {
        this.emailId = emailId;
    }
	 public String getplace() {
        return place;
    }
    public void setplace(String place) {
        this.place = place;
    }
    public String getcontact() {
        return contact;
    }
    public void setcontact(String contact) {
        this.contact = contact;
    }
    public String getqualification() {
        return qualification;
    }
    public void setquaification(String qualification) {
        this.qualification = qualification;
    }
   
    public String getaffiliation() {
        return affiliation;
    }
    public void setaffiliation(String affiliation) {
        this.affiliation = affiliation;
    }
	public ArrayList<String> getideas() {
        return ideas;
    }
    public void setideas(ArrayList<String> ideas) {
        this.ideas = ideas;
    }
	
	public ArrayList<articlesPublished> getarticles() {
        return articles;
    }
    public void setarticles(ArrayList<articlesPublished> articles) {
        this.articles = articles;
    }
	public ArrayList<String> getstudent() {
        return student;
    }
    public void setwork(ArrayList<String> student) {
        this.student = student;
    }
    public String toString(){
        return "[" + name + "," + emailId + "," +  place + "," + contact + "," +  qualification + "," + affiliation + ","+ ideas + "," +  articles + "," + student + "]";
    }
  }