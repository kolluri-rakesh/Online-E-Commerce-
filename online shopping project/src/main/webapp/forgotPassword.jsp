<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="css/signup-style.css">
  <title>Forgot Password</title>
</head>
<body>
<div id="container">
  <div class="signup">
    <form action="forgotPasswordAction.jsp" method="post">
      <input type="email" name="email" placeholder="Enter email" required>
      <input type="tel" name="mobileNumber" placeholder="Enter Mobile Number" pattern="[0-9]{10}" title="Enter a 10-digit mobile number" required>
      
      <select name="securityQuestion" required>
        <option value="What is your date of birth?">What is your date of birth?</option>
        <option value="What’s your favorite movie?">What’s your favorite movie?</option>
        <option value="What city were you born in?">What city were you born in?</option>
      </select>

      <input type="text" name="answer" placeholder="Enter Answer" required>
      <input type="password" name="newPassword" placeholder="Enter your new password" minlength="8" required>
      <input type="submit" value="Save">
    </form>
    
    <h2><a href="login.jsp">Login</a></h2>
  </div>

  <div class="whyforgotPassword">
    <% String msg = request.getParameter("msg"); %>
    <% if ("done".equals(msg)) { %>
      <h1>Password Changed Successfully!</h1>
    <% } else if ("invalid".equals(msg)) { %>
      <h1>Something Went Wrong! Try Again!</h1>
    <% } %>

    <h2>Online Shopping</h2>
    <p>The Online Shopping System allows users to shop online without visiting physical stores.</p>
  </div>
</div>

<script>
  // Add basic client-side password validation
  document.querySelector('form').addEventListener('submit', function(e) {
    const password = document.querySelector('input[name="newPassword"]').value;
    
    if (password.length < 8) {
      e.preventDefault();
      alert('Password must be at least 8 characters long.');
    }
  });
</script>
</body>
</html>
