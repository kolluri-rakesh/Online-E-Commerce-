<%@page import ="project.ConnectionProvider"%>
<%@page import ="java.sql.*"%>
<%@page import ="java.security.MessageDigest"%> <!-- Import for password hashing -->
<%@page import ="java.util.Base64"%> <!-- Optional for encoding hashed passwords -->
<%
String email = request.getParameter("email");
String mobileNumber = request.getParameter("mobileNumber");
String securityQuestion = request.getParameter("securityQuestion");
String answer = request.getParameter("answer");
String newPassword = request.getParameter("newPassword");

int check = 0;

try {
    Connection con = ConnectionProvider.getCon();
    
    // PreparedStatement for secure query execution
    String query = "SELECT * FROM users WHERE email=? AND mobileNumber=? AND securityQuestion=? AND answer=?";
    PreparedStatement pst = con.prepareStatement(query);
    pst.setString(1, email);
    pst.setString(2, mobileNumber);
    pst.setString(3, securityQuestion);
    pst.setString(4, answer);
    
    ResultSet rs = pst.executeQuery();
    
    if (rs.next()) {
        check = 1;
        
        // Hash the new password before storing it
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        byte[] hash = md.digest(newPassword.getBytes("UTF-8"));
        String hashedPassword = Base64.getEncoder().encodeToString(hash); // You can store in Base64 for easy retrieval

        // Update the password securely
        String updateQuery = "UPDATE users SET password=? WHERE email=?";
        PreparedStatement updatePst = con.prepareStatement(updateQuery);
        updatePst.setString(1, hashedPassword);
        updatePst.setString(2, email);
        updatePst.executeUpdate();
        
        response.sendRedirect("forgotPassword.jsp?msg=done");
    } else {
        response.sendRedirect("forgotPassword.jsp?msg=invalid");
    }

    // Close connections to avoid resource leaks
    rs.close();
    pst.close();
    con.close();
} catch (Exception e) {
    log("Error during password reset: " + e); // Use proper logging
}
%>
