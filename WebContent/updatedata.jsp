<%@page import="java.sql.*"%>

<%
String id=(String)session.getAttribute("uid");
%>

<%	String s1=request.getParameter("username");
	String s2=request.getParameter("userpassword");
	String s3=request.getParameter("address");
	String s4=request.getParameter("contactno");
    String s5=request.getParameter("email");

	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		String db_url="jdbc:mysql://localhost:3306/db";
		String db_uname="root";
		String db_upass="root";
		Connection con =DriverManager.getConnection(db_url,db_uname,db_upass);
		String q ="update users set username='"+s1+"' ,password='"+s2+"',address='"+s3+"',mobile='"+s4+"',email='"+s5+"' where id='"+id+"'";
		Statement st=con.createStatement();
		st.executeUpdate(q);
                response.sendRedirect("ShowProfile.jsp");
		con.close();
		}
		catch(Exception e)
		{
		out.print(""+e);
		}
%>