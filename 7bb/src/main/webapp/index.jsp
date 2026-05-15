 <%-- 7b. Construct a Cookie Management program using JSP to get the fields Name, Domain and Max Expiry Age ( in sec) --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head><title>Add Cookie</title></head>
<body style="font-family: sans-serif; padding: 20px;">
    <h2>Add Cookie Information</h2>
    <form method="post">
        Name: <input type="text" name="cName" required><br><br>
        Value: <input type="text" name="cValue" required><br><br>
        Domain: <input type="text" name="cDomain" value="localhost"><br><br>
        Expiry (sec): <input type="number" name="cAge" required><br><br>
        <input type="submit" value="Add Cookie">
    </form>

    <%
        String name = request.getParameter("cName");
        String val = request.getParameter("cValue");
        String age = request.getParameter("cAge");
        
        if (name != null && val != null) {
            Cookie c = new Cookie(name, val);
            c.setMaxAge(Integer.parseInt(age));
            response.addCookie(c);
            out.println("<p style='color:green;'><b>Cookie Added:</b> " + name + "=" + val + "</p>");
        }
    %>
    <br>
    <a href="./displayCookies.jsp">Go to the active cookie list</a>
</body>
</html>