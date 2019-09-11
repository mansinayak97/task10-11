package com.worldpay;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/SubjectPageServlet")
public class SubjectPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session=request.getSession();
		String user=(String)session.getAttribute("user");
		
		if(user==null){
			response.sendRedirect("index.jsp");
		}
		
		PrintWriter out = response.getWriter();
		Cookie ck[]=request.getCookies();
		String s1="";
		if(ck!=null)
		{
			for(Cookie c:ck)
			{
				String name=c.getName();
				if(name.equals("sub")){
					s1=c.getValue();
				}
			}
		}
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/db", "root", "root");
			String sql = "SELECT distinct genre from books";
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			out.println("<html>");
			out.println("<html><body>");
			if(s1.equals(""))
			out.println("<marquee><h4>Attractive Offers On All Books</h4></marquee>");
			
			else
				out.println("<marquee><h4>Attractive Offers On "+s1+" Books</h4></marquee>");	
			out.println("<h3>Welcome "+user+"</h3>");
			out.println("<h3>Select The Desired Subject</h3>");
			out.println("<hr>");
			while (rs.next()) {
				String sub = rs.getString(1);
				out.println("<a href=BookListServlet?subject=" + sub + ">");
				out.println(sub);
				out.println("</a><br>");
			}
			out.println("<hr>");
			out.println("<a href=buyerpage.jsp>Buyer-Page</a>");
			out.println("</body></html>");

		} catch (Exception e) {
			out.println(e);
		}
	}

}
