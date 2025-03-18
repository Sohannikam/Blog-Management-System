<%@ page import="java.util.List" %>
<%@ page import="in.sp.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Information</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="./index.css">
    <style>
        body {
            padding: 20px;
        }

        h2 {
            color: #007BFF;
        }

        table {
            width: 80%;
            margin-top: 20px;
            border-collapse: collapse;
        }

        table, th, td {
            border: 1px solid #dee2e6;
        }

        th, td {
            padding: 20px;
            text-align: left;
        }

        th {
            background-color: #007BFF;
            color: #fff;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        strong {
            font-weight: bold;
        }
    </style>
</head>
<body>


<h2>User Information</h2>

<%
    // Retrieve the user information from the session
    List<User> userList = (List<User>) session.getAttribute("userinfo");

    // Check if the user list is not null and not empty
    if (userList != null && !userList.isEmpty()) {
%>
    <table class="table table-striped table-bordered">
        <thead class="table-dark">
            <tr>
                <th><strong>User ID</strong></th>
                <th><strong>Username</strong></th>
                <th><strong>User Email</strong></th>
                  <th><strong>Delete User</strong></th>
            </tr>
        </thead>
        <tbody>
<%
        for (int i=0; i<userList.size(); i++) {
            User user = userList.get(i);
%>
            <tr>
                <td><%= user.getUserId() %></td>
                <td><%= user.getUsername() %></td>
                <td><%= user.getEmail() %></td>
                
                 <td>
                        <form action="DeleteUserServlet" method="post">
                            <input type="hidden" name="userId" value="<%= user.getUserId() %>">
                            <input type="submit" value="Delete" style="color: red;">
                        </form>
                    </td>
            </tr>
<%
        }
%>
        </tbody>
    </table>
<%
    } else {
%>
        <p>No users found.</p>
<%
    }
%>

</body>
</html>
