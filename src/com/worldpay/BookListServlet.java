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

/**
 * Servlet implementation class BookListServlet
 */
@WebServlet("/BookListServlet")
public class BookListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		StringBuffer sb=new StringBuffer();
		String subject[]=request.getParameterValues("subject");
		for(String i:subject){
			//StringBuffer i1=new StringBuffer(i);
			sb=sb.append("'");
			sb=sb.append(i);
			sb=sb.append("'");
			sb=sb.append(",");
		}
		sb=sb.replace(sb.length()-1, sb.length(), "");
		System.out.println(sb);
		//Cookie cSub=new Cookie("sub",subject);
		//cSub.setMaxAge(7*24*60*60);
		//response.addCookie(cSub);
		PrintWriter out=response.getWriter();
		try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/db","root","root");
		String sql="SELECT bookId,bookName from books where genre in ("+sb+")";
		/*sql.replace('{', '(');
		sql.replace('}', ')');*/
		PreparedStatement ps=con.prepareStatement(sql);
		//ps.setString(1, subject);
		ResultSet rs=ps.executeQuery();
		out.println("<html>");
		out.println("<html><body>");
		out.println("<h3>Select The Desired Title</h3>");
		out.println("<hr>");
		while(rs.next()){
			String code=rs.getString(1);
			String title=rs.getString(2);
			
			out.println("<a href=BookDetailsServlet?code="+code+">");
			out.println(title);
			out.println("</a><br>");
		}
		out.println("<hr>");
		out.println("<a href=SubjectPageServlet>Subject-Page</a>");
		out.println("<a href=buyerpage.jsp>Buyer-Page</a>");
		out.println("</body></html>");
		
		}catch(Exception e){
			out.println(e);
		}

	}

}
