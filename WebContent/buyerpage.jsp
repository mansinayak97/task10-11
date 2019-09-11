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
		<a href="">Search-Book</a>
		<a href="DisplayCart">View-Cart</a>
		<a href="">Trace-Order</a>
		<a href="">Logout</a>
	</pre>		
	<hr>
</body>
</html>