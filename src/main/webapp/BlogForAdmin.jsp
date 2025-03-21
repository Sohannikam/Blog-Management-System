<%@ page import="java.util.Base64" %>
<%@ page import="java.util.List" %>
<%@ page import="in.sp.BlogPost" %>
<%@ page import="java.sql.Blob" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <!-- bootstrap css  -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <!-- font awesome cdn  -->
    <link rel="stylesheet" href="./index.css">

    <style>
        /* Custom styling for panels */
        .custom-panel {
            border: 1px solid #ddd;
            padding: 10px;
            margin-bottom: 10px;
            background-color: rgba(135, 206, 250, 0.5);
        }

        .custom-panel-left {
            background-color: rgba(0, 0, 0, 0.1); /* Faint Black with 10% opacity */
        }

        .custom-panel-right {
            background-color: rgba(0, 0, 0, 0.1); /* Faint Black with 10% opacity */
        }

        .custom-panel-top {
            border-bottom: 1px solid #ddd;
            padding: 10px;
            background-color: #f8f9fa;
            text-align: center;
        }
    </style>
</head>
<body>
 
    <div class="container-fluid">
        

        <div class="row">
            <!-- Left Side Panel -->
          

            <!-- Main Content -->
            <div class="blog-container">
                <!-- Display Comments -->
                <div class="container mt-3">
                    <h4></h4>
                    <form>
                        <%
                            // Retrieve the list of blog posts from the request attribute
                            List<BlogPost> blogPosts = (List<BlogPost>)session.getAttribute("blogPosts");

                            if (blogPosts != null && !blogPosts.isEmpty()) {
                                // Iterate through the list of blog posts
                                for (int i = blogPosts.size()-1; i >= 0; i--) {
                                    BlogPost blogPost = blogPosts.get(i);
                                    Blob imageBlob = blogPost.getImage();
                                    byte[] imageData = null;

                                    if (imageBlob != null) {
                                        // Convert Blob to byte array
                                        imageData = imageBlob.getBytes(1, (int) imageBlob.length());
                                    }

                                    // Encode byte array to Base64 for image source
                                    String base64Image = imageData != null ? Base64.getEncoder().encodeToString(imageData) : "";
                        %>
                                    <div class="card mb-3">
                                        <div class="card-body">
                                            <h3 class="card-title"><%= blogPost.getTitle() %></h3>
                                            <p class="card-text"><%= blogPost.getDescription() %></p>
                                            <p class="card-text"><%= blogPost.getDate() %></p>

                                            <!-- Display Image -->
                                           <!-- Display Image with reduced size -->
                                           <img src="data:image/jpeg;base64,<%= base64Image %>" class="img-fluid" alt="Blog Image" style="max-width: 350px; max-height: 250px;">


                                            <!-- Add Comment Form -->
                                         <form method="post" action="DeleteBlogPostServlet">
    <input type="hidden" name="blogPostId" value="<%= blogPost.getID() %>">
    <div style="margin-top: 1em;"> <!-- Add margin-top for spacing -->
        <button type="submit" class="btn btn-danger">Delete</button>
    </div>
</form>
                                        </div>
                                    </div>
                        <%
                                }
                            } else {
                        %>
                                <div class="alert alert-info" role="alert">
                                    No blog posts found.
                                </div>
                        <%
                            }
                        %>
                    </form>
                </div>
            </div>

            <!-- Right Side Panel -->
            
        </div>
    </div>

    <!-- Bootstrap JS (you might need to include this at the end of your document) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofMz/8E+nDRdIAsjFuCZSmKbSSUnQlmh/j" crossorigin="anonymous"></script>
</body>
</html>
