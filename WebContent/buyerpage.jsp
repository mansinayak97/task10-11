<%
	String user=(String)session.getAttribute("user");
	if(user==null){
	response.sendRedirect("index.jsp");
	}
%>

<html>
<body>
	<h3>DashBoard-For-Buyer</h3>
	<hr>
	<pre>
		<a href="SubjectPageServlet">Explore-Store</a>
		<a href="ShowBooks.jsp">View All Books</a>
		<a href="SubjectCascading.jsp">Search-Book</a>
		<a href="DisplayCart">View-Cart</a>
		<a href="ShowProfile.jsp">User Profile</a>
		<a href="">Logout</a>
	</pre>		
	<hr>
</body>
</html>