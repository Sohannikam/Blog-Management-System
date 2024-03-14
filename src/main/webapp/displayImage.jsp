<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Display Image</title>
</head>
<body>
    <h2>Display Image</h2>

    <%
        // Assuming you have a parameter 'id' specifying the image to display
        int imageId = (int)session.getAttribute("id");
        if (imageId !=0) {
            // You can use the imageId to construct the URL for the ImageRetrievalServlet
            String imageURL = "ImageRetrievalServlet?id=" + imageId;
    %>
            <img src="<%= imageURL %>" alt="Image">
    <%
        } else {
    %>
            <p>No image ID provided.</p>
    <%
        }
    %>

</body>
</html>
