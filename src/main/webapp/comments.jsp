<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    
     <!-- bootstrap css  -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <!-- fonr awseome cdn  -->
    <link rel="stylesheet" href="./index.css">
</head>
<body>
    <div class="container-fluid" >
    
        <div class="container" >
            <div class="d-flex flex-column mb-3">
                <h3>Comments</h3>
                              
                  
                <% List<String> commentsList= (List<String>)session.getAttribute("commentsList");
                if (commentsList != null && !commentsList.isEmpty()) {
                    for (int i = 0; i < commentsList.size(); i++) {
                        String comment = commentsList.get(i);
                
                %>
                            <p><%= comment %></p>
<%
        }
    } else {
%>
        <p>No comments found.</p>
<%
    }
%>
</form>
            </div>
           


        
    </div>
    
</body>
</html>