<%@page import ="project.ConnectionProvider"%>
<%@page import ="java.sql.*"%>
<%

try {
    Connection con = ConnectionProvider.getCon();
    Statement st = con.createStatement();
    
    // Query to create the 'users' table
    String q1 = "CREATE TABLE users ("
               + "name VARCHAR(100),"
               + "email VARCHAR(100) PRIMARY KEY,"
               + "mobileNumber BIGINT,"
               + "securityQuestion VARCHAR(200),"
               + "answer VARCHAR(200),"
               + "password VARCHAR(100),"
               + "address VARCHAR(500),"
               + "city VARCHAR(100),"
               + "state VARCHAR(100),"
               + "country VARCHAR(100))";
    
    // Query to create the 'product' table
    String q2 = "CREATE TABLE product ("
               + "id INT PRIMARY KEY AUTO_INCREMENT,"
               + "name VARCHAR(500),"
               + "category VARCHAR(500),"
               + "price INT,"
               + "active VARCHAR(10))";
    
    String q3 = "CREATE TABLE cart (email varchar(100),product_id int,price int,total int,address varchar(500),city varchar(100),state varchar(100),country varchar(100),mobileNumber bigint,orderDate varchar(100),deliveryDate varchar(100),paymentMethod varchar(100),transactionId varchar(100),status varchar(10))";
    
    // Print the queries for debugging purposes
    System.out.print(q1);
    System.out.print(q2);
    System.out.print(q3);
    
    // Execute both queries
    //st.execute(q1);
    //st.execute(q2);
    st.execute(q3);
    
    System.out.println("Tables created successfully");
    
    // Close the connection
    con.close();
    
} catch (Exception e) {
    System.out.print(e);
}

%>
