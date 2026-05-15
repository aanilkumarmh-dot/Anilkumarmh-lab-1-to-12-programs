 <%-- 7b. Active Cookie List --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head><title>Active Cookies</title></head>
<body style="font-family: sans-serif; padding: 20px;">
    <h2>Active Cookie List</h2>
    <table border="1" style="border-collapse: collapse; width: 300px;">
        <tr><th>Name</th><th>Value</th></tr>
        <%
            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                for (Cookie c : cookies) {
                    out.println("<tr><td>" + c.getName() + "</td><td>" + c.getValue() + "</td></tr>");
                }
            }
        %>
    </table>
    <br>
    <a href="./index.jsp">Back to Add Cookie</a>
</body>
</html>