<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<title>Signup</title>
</head>
<body>
<div id='container'>
  <div class='signup'>
    <form action="signupAction.jsp" method="post">
      <input type="text" name="name" placeholder="Enter Name" required>
      <input type="email" name="email" placeholder="Enter Email" required>
      <input type="text" name="mobilenumber" placeholder="Enter Mobile Number" required>
      <select name="securityQuestion" required>
        <option value="What is your date of birth?">What is your date of birth?</option>
        <option value="What’s your favorite movie?">What’s your favorite movie?</option>
        <option value="What city were you born in?">What city were you born in?</option>
      </select>
      <input type="text" name="answer" placeholder="Enter answer" required>
      <input type="password" name="password" placeholder="Enter Password" required>
      <input type="submit" value="Signup">
    </form>
    <h2><a href="login.jsp">Login</a></h2>
  </div>

  <div class='whysign'>
    <%
      String msg = request.getParameter("msg");
      if ("valid".equals(msg)) {
    %>
      <h1>Successfully registered!</h1>
    <%
      } else if ("invalid".equals(msg)) {
    %>
      <h1>Something went wrong! Try again!</h1>
    <%
      }
    %>
    
    <h2>Online Shopping</h2>
    <p>The Online Shopping System is the application that allows the users to shop online without going to the shops to buy them.</p>
  </div>
</div>
</body>
</html>
