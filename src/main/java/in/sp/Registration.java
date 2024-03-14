package in.sp;

import jakarta.servlet.RequestDispatcher;
 
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

/**
 * Servlet implementation class Registration
 */
@WebServlet("/register")
public class Registration extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uname=request.getParameter("name1");
		String uemail=request.getParameter("email1");
		String upwd=request.getParameter("pass1");
		String ucpwd=request.getParameter("cpass1");
		String uGen=request.getParameter("gender1");
		RequestDispatcher dis=null;
		PrintWriter out= response.getWriter();
		HttpSession session=request.getSession();
		
		if(!upwd.equals(ucpwd)) {
            out.println("<script>alert('Password didnt mathced!'); window.location.href='Signup.jsp';</script>");
		}
		
        try{
            //load the driver:
            Class.forName("com.mysql.cj.jdbc.Driver");

            //creating connection

            String url = "jdbc:mysql://localhost:3306/newblog";
            String username ="root";
            String password = "Pass@123";
            Connection con = DriverManager.getConnection(url,username,password);

            // creating a query

            String q = "insert into users(uname,uemail,uGen,upwd,ucpwd) values (?,?,?,?,?)";

            // get the preparedStatement object

            PreparedStatement pstmt = con.prepareStatement(q);

            //set the values to query

            pstmt.setString(1,uname);
            pstmt.setString(2,uemail);
            pstmt.setString(3,uGen);
            pstmt.setString(4,upwd);
            pstmt.setString(5,ucpwd);
            
         
            
            int rowcount= pstmt.executeUpdate();
            dis=request.getRequestDispatcher("login.jsp");
            if(rowcount>0)
            {
                out.println("<script>alert('Registration successful!'); window.location.href='login.jsp';</script>");
                dis=request.getRequestDispatcher("/login.jsp");
           	   dis.include(request, response);
            	
            }
            else
            {
            	response.setContentType("text/html");
            	out.print("<h3 style='color:red'> Sorry registration failed</h3>");
          	   dis=request.getRequestDispatcher("/login.jsp");
          	   dis.include(request, response);
            }

        
          
            con.close();
          
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
	}


	}


