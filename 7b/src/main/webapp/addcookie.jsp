 <%@ page import="javax.servlet.http.Cookie" %>
<html>
<body>

<%
    String name = request.getParameter("cname");
    String value = request.getParameter("cvalue");
    String ageStr = request.getParameter("cage");

    int age = 0;

    // Validation
    if(name == null || value == null || ageStr == null ||
       name.trim().equals("") || value.trim().equals("")) {
        out.println("<h3>Error: All fields are required!</h3>");
        return;
    }

    try {
        age = Integer.parseInt(ageStr);
    } catch(Exception e) {
        out.println("<h3>Error: Enter valid number for Max Age!</h3>");
        return;
    }

    // Remove spaces (important for cookies)
    name = name.replaceAll(" ", "_");
    value = value.replaceAll(" ", "_");

    // Create Cookie
    Cookie cookie = new Cookie(name, value);

    cookie.setMaxAge(age);   // expiry time
    cookie.setPath("/");     // accessible everywhere

    response.addCookie(cookie);
%>

<h2>Cookie Added Successfully!</h2>

<p><b>Name:</b> <%= name %></p>
<p><b>Value (Domain):</b> <%= value %></p>
<p><b>Max Age:</b> <%= age %> seconds</p>

<br><br>
<a href="showCookies.jsp">👉 Go to Active Cookie List</a>

</body>
</html>