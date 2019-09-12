<%@page import="java.sql.*"%>
<html>
<%
String s1=(String)session.getAttribute("user");
            

	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		String db_url="jdbc:mysql://localhost:3306/db";
		String db_uname="root";
		String db_upass="root";
		Connection con =DriverManager.getConnection(db_url,db_uname,db_upass);
		String q ="select * from users where username='"+s1+"'";
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery(q);
               while(rs.next())
		{
%>
<body>
<form action="updatedata.jsp" >
<hr>
<table border="2">
		
		<tr>
			<td>UserName</td>
			<td><input type="text" readonly value="<%=rs.getString(2)%>"  name="username"></td>
		</tr>

		<tr>
			<td>Password</td>
			<td><input type="text" value="<%=rs.getString(1)%>" name="userpassword"></td>
		</tr>

		<tr>
			<td>Address</td>
			<td><input type="text" value="<%=rs.getString(3)%>" name="address" ></td>
		</tr>


		<tr>
			<td>Contact No.</td>
			<td><input type="text" value="<%=rs.getString(4)%>" name="contactno"></td>
		</tr>


		<tr>
			<td>Email-Address</td>
			<td><input type="text" value="<%=rs.getString(5)%>" name="email" ></td>
		</tr>
		<tr>

			<th colspan="2"><input type="Submit" value="Update"></th>
		</tr>
	</table>
	<hr>
</form>


<a href=buyerpage.jsp>Buyer-Page</a>
<%
                }
                con.close();
		}
		catch(Exception e)
		{
		e.printStackTrace();
		}


%>

</body>
</html>