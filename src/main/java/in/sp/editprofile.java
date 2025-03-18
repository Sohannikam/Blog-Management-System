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
 * Servlet implementation class editprofile
 */

@WebServlet("/prfoedit")
public class editprofile extends HttpServlet {
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	
			String uname=request.getParameter("name1");
			String uemail=request.getParameter("email1");
			String uGen=request.getParameter("gender1");
			RequestDispatcher dis=null;
			PrintWriter out= response.getWriter();
			HttpSession session=request.getSession();
			
			
			
	        try{
	            //load the driver:
	            Class.forName("com.mysql.cj.jdbc.Driver");

	            //creating connection

	            String url = "jdbc:mysql://localhost:3306/newblog";
	            String username ="root";
	            String password = "Pass@123";
	            Connection con = DriverManager.getConnection(url,username,password);

	            // creating a query

	            String q = "update users set uname= ? , uemail=?, uGen=? where UserID=?";

	            // get the preparedStatement object

	            PreparedStatement pstmt = con.prepareStatement(q);
	            int InUserId = (Integer)session.getAttribute("userId");

	            //set the values to query

	            pstmt.setString(1,uname);
	            pstmt.setString(2,uemail);
	            pstmt.setString(3,uGen);
	            pstmt.setInt(4,InUserId );
	           
	            
	         
	            
	            int rowcount= pstmt.executeUpdate();
	            dis=request.getRequestDispatcher("login.jsp");
	            if(rowcount>0)
	            {
	            	
	            	session.setAttribute("NAME", uname); // Assuming you have set the username in session previously
	                session.setAttribute("EMAIL", uemail); // Assuming you have set the email in session previously
	                session.setAttribute("Gender", uGen);
	                
	                out.println("<script>alert('Profile Updated Successfully!'); window.location.href='profile.jsp';</script>");
	                dis=request.getRequestDispatcher("/Edit_profile.jsp");
	           	   dis.include(request, response);
	            	
	            }
	            else
	            {
	            	response.setContentType("text/html");
	            	out.print("<h3 style='color:red'> Sorry profile registration failed</h3>");
	          	   dis=request.getRequestDispatcher("/setting.jsp");
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
