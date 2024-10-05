<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<title>Login</title>
</head>
<body>
<div id='container'>
  <div class='signup'>
    <form action="loginAction.jsp" method="post">
      <input type="email" name="email" placeholder="Enter email" required>
      <input type="password" name="password" placeholder="Enter password" required>
      <input type="submit" value="Login">
    </form>
    
    <h2><a href="signup.jsp">Sign Up</a></h2>
    <h2><a href="forgotPassword.jsp">Forgot Password?</a></h2>
  </div>

  <div class='whysignLogin'>
    <%
      String msg = request.getParameter("msg");
      if ("notexist".equals(msg)) {
    %>
        <h1 role="alert">Incorrect Username or Password</h1>
    <%
      } else if ("invalid".equals(msg)) {
    %>
        <h1 role="alert">Something went wrong! Try again!</h1>
    <%
      }
    %>
    
    <h2>Online Shopping</h2>
    <p>The Online Shopping System allows users to shop online without visiting physical stores.</p>
  </div>
</div>
</body>
</html>
