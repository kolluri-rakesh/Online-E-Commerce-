<%@page import ="project.ConnectionProvider"%>
<%@page import ="java.sql.*"%>
<%@include file ="header.jsp" %>
<%@include file ="footer.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home</title>
<style>
h3 {
	color: yellow;
	text-align: center;
}
</style>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">Home <i class="fa fa-institution"></i></div>
<%
String msg = request.getParameter("msg");
    if ("added".equals(msg)) {
%>
        <h3 class="alert">Product added successfully!</h3>
        <%} %>
        
<%
      if ("exist".equals(msg)) {
%>
        <h3 class="alert">Product already exists in your cart! Quantity increased!</h3>
<%} %>
    <%  if ("invalid".equals(msg)) {
%>
        <h3 class="alert">Something went wrong! Try again!</h3>
<%} %>

<table>
    <thead>
      <tr>
        <th scope="col">ID</th>
        <th scope="col">Name</th>
        <th scope="col">Category</th>
        <th scope="col"><i class="fa fa-inr"></i> Price</th>
        <th scope="col">Add to cart <i class='fas fa-cart-plus'></i></th>
      </tr>
    </thead>
    <tbody>
    <%
    Connection con = null;
    Statement st = null;
    ResultSet rs = null;
    
    try {
        con = ConnectionProvider.getCon();
        st = con.createStatement();
        rs = st.executeQuery("select *from product where active='yes'");
        while (rs.next()) {
    %>
      <tr>
        <td><%=rs.getString(1) %></td>
        <td><%=rs.getString(2) %></td>
        <td><%=rs.getString(3) %></td>
        <td><i class="fa fa-inr"></i><%=rs.getString(4) %> </td>
        <td><a href="addToCartAction.jsp?id=<%=rs.getString(1) %>">Add to cart <i class='fas fa-cart-plus'></i></a></td>
      </tr>
    <%
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            if (rs != null) rs.close();
            if (st != null) st.close();
            if (con != null) con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    %>
    </tbody>
</table>

<br><br><br>

</body>
</html>
