package in.sp;

import jakarta.servlet.RequestDispatcher;

import jakarta.servlet.ServletException;
import jakarta.servlet.ServletOutputStream;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * Servlet implementation class Displayimage
 */
public class Displayimage extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		RequestDispatcher dis= null;
		HttpSession session=request.getSession();
	try
	{
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		String url="jdbc:mysql://localhost:3306/newblog";
		String username="root";
		String password="Pass@123";
		Connection con=DriverManager.getConnection(url,username,password);
		
		String q="SELECT pic, content_type FROM images WHERE id = 1";
		PreparedStatement pstmt= con.prepareStatement(q);
	try
	{
		ResultSet rs= pstmt.executeQuery();
				if(rs.next())
				{
					Blob blob = rs.getBlob("pic");
					int id1=rs.getInt(1);
					
					
                    InputStream inputStream = blob.getBinaryStream();
                    OutputStream outputStream = response.getOutputStream();
                    byte[] buffer = new byte[2000000];
                    int bytesRead = -1;
                    while ((bytesRead = inputStream.read(buffer)) != -1) {
                        outputStream.write(buffer, 0, bytesRead); 
		            }
                    
                    inputStream.close();
                    outputStream.close();
                   
				
	}
				else
                {
                	System.out.print("code fialed");
                }
	}
	catch(Exception e)
	{
		System.out.print("exception is"+e);
	}
	
	}
	catch(Exception e)
	{
		e.printStackTrace();
		   System.out.print("<h3 style='color:red'> "+e.getMessage()+"</h3>");
     	   dis=request.getRequestDispatcher("/profile.jsp");
     	   dis.include(request, response);
	}
	}
}
	

	

