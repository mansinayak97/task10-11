<%@page import="java.sql.*"%>
<%!
	int getDiscount(int price){
	int dis=0;
	if(price>700)
		dis=price-price*30/100;
	else
		dis=price-price*20/100;
	return dis;
}
%>

<%Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con = java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/db","root", "root");
String sql="Select * from books";
java.sql.PreparedStatement ps=con.prepareStatement(sql);
ResultSet rs=ps.executeQuery();
%>

<html>
<body>
	<h3>Book-List</h3>
	<hr>
	<table>
	<tr>
		<th>Book Id</th>
		<th>Book Name</th>
		<th>Author Name</th>
		<th>Genre</th>
		<th>Price</th>
	</tr>
	<%
		while(rs.next())
		{
			String s1=rs.getString(1);
			String s2=rs.getString(2);
			String s3=rs.getString(3);
			String s4=rs.getString(4);
			String s5=rs.getString(5);
		
		
	%>
	<tr>
		<td><%=s1 %></td>
		<td><%=s2 %></td>
		<td><%=s3 %></td>
		<td><%=s4 %></td>
		<td><%=s5 %></td>
		<td><%=getDiscount(Integer.parseInt(s5)) %>
	</tr>
	<%	
		} 
		con.close();
	%>
	</table>
	<hr>
	<a href="buyerpage.jsp">Buyer page</a>
</body>
</html>