package in.sp;

import java.io.IOException;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class NewPassword
 */
@WebServlet("/newPassword")
public class NewPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		String newPassword = request.getParameter("password");
		String confPassword = request.getParameter("confPassword");
		RequestDispatcher dis = null;
		PrintWriter out= response.getWriter();
		if (newPassword != null && confPassword != null && newPassword.equals(confPassword)) {

			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				 String url = "jdbc:mysql://localhost:3306/newblog";
	             String username ="root";
	             String password = "Pass@123";
	             Connection con = DriverManager.getConnection(url,username,password);
				PreparedStatement pst = con.prepareStatement("update users set upwd = ? where uemail = ? ");
				pst.setString(1, newPassword);
				pst.setString(2, (String)session.getAttribute("email"));

				int rowCount = pst.executeUpdate();
				if (rowCount > 0) {
					 out.println("<script>alert('Password set successfully!'); window.location.href='login.jsp';</script>");
		                dis=request.getRequestDispatcher("/login.jsp");
		           	   dis.include(request, response);
				} else {
					out.println("<script>alert('fail to reset password!'); window.location.href='login.jsp';</script>");
	                dis=request.getRequestDispatcher("/login.jsp");
	           	   dis.include(request, response);
				}
			
			} catch (Exception e) {
				e.printStackTrace();
				 response.setContentType("text/html");
		         	out.print("<h3 style='color:red'> "+e.getMessage()+"</h3>");
		       	   dis=request.getRequestDispatcher("/login.jsp");
		       	   dis.include(request, response);
			}
		}
		else
		{
			out.print("password not found");
		}
	}

}
