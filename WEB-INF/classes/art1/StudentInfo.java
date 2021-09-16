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



public class StudentInfo{
	public String userName;
	String emailId;
	String degree;
	String year;
	String campus;
	String status;
	public String mentorName;
	ArrayList<String> ideas = new ArrayList<>();
	public ArrayList<articlesPublished> articles = new ArrayList<>();
	public ArrayList<String> work = new ArrayList<>();
	public BigDecimal activityScore;
	public BigDecimal selfEsteemScore;
	
	 public StudentInfo(String name, String maily,String deg,String yr,String camp,ArrayList<String> idea,ArrayList<articlesPublished> article,ArrayList<String> work,BigDecimal activity,BigDecimal selfEsteem, String mentorName, String status){
		this.userName = name;
		this.emailId = maily;
		this.degree = deg;
		this.year = yr;
		this.campus = camp;
		this.ideas = idea;
		this.work = work;
		this.articles = article;
		this.activityScore = activity;
		this.selfEsteemScore = selfEsteem;
		this.mentorName=mentorName;
		this.status=status;
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
    public ArrayList<String> getideas() {
        return ideas;
    }
    public void setideas(ArrayList<String> ideas) {
        this.ideas = ideas;
    }
	public ArrayList<String> getwork() {
        return work;
    }
    public void setwork(ArrayList<String> work) {
        this.work = work;
    }
	public ArrayList<articlesPublished> getarticles() {
        return articles;
    }
    public void setarticles(ArrayList<articlesPublished> articles) {
        this.articles = articles;
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
    public String getmentor() {
        return mentorName;
    }
    public void setmentor(String mentorName) {
        this.mentorName = mentorName;
    }
	public String getStatus() {
        return status;
    }
    public void setStatus(String status) {
        this.status = status;
    }
    public String toString(){
        return "[" + userName + "," + emailId + "," +  degree + "," +  year + "," +  campus + "," +  ideas + "," +  articles + "," + work + "," + activityScore + "," +  selfEsteemScore + "," + mentorName + "," + status + "]";
    }
  }
