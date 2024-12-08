<%--
  Created by IntelliJ IDEA.
  User: asus_admin
  Date: 12/8/24
  Time: 9:49 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Sign In @ MITA</title>
  <style><%@include file="styles.css"%></style>
</head>
<body>

<div class="auth-container">
  <div id="loginForm" class="auth-form">
    <h2>Log In</h2>
    <form action="/auth/login" method="post">

      <div class="form-group">
        <label>Email</label>
        <input name="userEmail" type="email" placeholder="Enter your email" required>
      </div>

      <div class="form-group">
        <label>Password</label>
        <input name="password" type="password" placeholder="Enter your password" required>
      </div>

      <button type="submit">Log In</button>
    </form>

    <a href="signup">
      <p class="toggle-link">Don’t have an account? Click here to sign up</p>
    </a>
  </div>
</div>

</body>
</html>
