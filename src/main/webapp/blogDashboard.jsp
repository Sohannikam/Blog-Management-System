 <%@ page import="java.util.Base64"%>
<%@ page import="java.util.List"%>
<%@ page import="in.sp.BlogPost"%>
<%@ page import="in.sp.Vicomment"%>
<%@ page import="java.sql.Blob"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <style>
        /* Adjust card width for responsiveness */
        @media (max-width: 360px) {
            .card {
                width: 100% !important;
                margin-bottom: 15px !important; 
            }
        }
        @media only screen and (min-width: 768px) {
            .card {
                width: 100% !important;
                margin-bottom: 15px !important; 
            }
        }
        @media only screen and (min-width: 992px) {
            .card {
                width: 100% !important;
                margin-bottom: 15px !important; 
            }
        }
        @media only screen and (min-width: 1200px) {
            .card {
                width: 100% !important;
                margin-bottom: 15px !important; 
            }
        }
        body {
            background-color: #eee;
        }
    </style>

    <link href="https://fonts.googleapis.com/css2?family=Lobster&family=Pacifico&display=swap" rel="stylesheet">
    <style>
        .lobster-red {
            font-family: 'Lobster', cursive;
            color: crimson;
        }

        .pacifico-blue {
            font-family: 'Pacifico', cursive;
            color: royalblue;
        }
        
        .blog-container {
    max-height: 600px; /* Set a max height for the blog container */
    overflow-y: auto; /* Enable vertical scrolling */
    border: 1px solid #ddd;
    
    margin-bottom: 10px;
   /*  background-color: rgba(135, 206, 250, 0.5);  */ /* Same as the custom panel styling */
}

/* Hide the scrollbar in WebKit browsers */
.blog-container::-webkit-scrollbar {
    width: 8px; 
}

/* Style for the scrollbar track */
/* .blog-container::-webkit-scrollbar-track {
    background-color: #f1f1f1;
    border-radius: 10px;
} */

/* Style for the scrollbar handle */
/* .blog-container::-webkit-scrollbar-thumb {
    background-color: #888;
    border-radius: 10px;
}
 */
/* Hover effect for the scrollbar handle */
/* .blog-container::-webkit-scrollbar-thumb:hover {
    background-color: #555;
}  */
    </style>
</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <!-- Top Panel -->
            <div class="col-md-12 custom-panel-top">
                <!-- Add your top panel content here -->
                <h2></h2>
                <!-- Add whatever content you want in the top panel -->
            </div>
        </div>

        <div class="row">
            <!-- Left Side Panel -->
            <div class="col-md-2 custom-panel custom-panel-left">
                <!-- Add your left side panel content here -->
                <h4></h4>
                <!-- Add whatever content you want in the left side panel -->
            </div>

            <!-- Main Content: Adjust the width here -->
            <div class="blog-container">
                <!-- Display Comments -->
                <div class="container mt-3">
                    <h4></h4>

                   <!--  Your dynamic content here
                    Retrieve the list of blog posts from the request attribute -->
                    <%
                    List<BlogPost> blogPosts = (List<BlogPost>) session.getAttribute("blogPosts");
                    List<Vicomment> commentsList = (List<Vicomment>) session.getAttribute("commentsList");

                    if (blogPosts != null && !blogPosts.isEmpty()) {
                        for (int i = blogPosts.size() - 1; i >= 0; i--) {
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
                            <img src="data:image/jpeg;base64,<%= base64Image %>"
                                 class="img-fluid" alt="Blog Image"
                                 style="max-width: 350px; max-height: 250px;">

                            <!-- Add Comment Form -->
                            <form action="AddCommentServlet" method="get" style="margin-top: 1em;">
                                <input type="hidden" name="blogId" value="<%= blogPost.getID() %>">
                                <div class="mb-3">
                                    <textarea class="form-control" name="comment" rows="3" placeholder="Type your comment here..."></textarea>
                                </div>

                                <div class="mt-3">
                                    <h5>Comments</h5>
                                    <ul class="list-unstyled">
                                        <%
                                        if (commentsList != null && !commentsList.isEmpty()) {
                                            for (int j = commentsList.size() - 1; j >= 0; j--) {
                                                Vicomment comment = commentsList.get(j);
                                                if (comment.getBlog() == blogPost.getID()) {
                                        %>
                                        <li><strong><%= comment.getEmail() %>:</strong> <%= comment.getCome() %>
                                            <br> <small><%= comment.getDate() %></small></li>
                                        <%
                                                }
                                            }
                                        } else {
                                        %>
                                        <li>No comments yet. Be the first to comment!</li>
                                        <%
                                        }
                                        %>
                                    </ul>
                                </div>
                                <div class="d-flex justify-content-between">
                                   <button type="submit" class="btn btn-primary">Add Comment</button> 
                                </div>
                            </form>

                            <!-- View Comments Form -->
                            <form action="comindex" method="post" style="margin-top: 1em;">
                                <input type="hidden" name="blogId" value="<%= blogPost.getID() %>">
                                <div class="d-flex justify-content-end">
                                    <button type="submit" class="btn btn-success">View Comments</button>
                                </div>
                            </form>
                            <a name="blog<%= blogPost.getID() %>"></a>
                        </div>
                    </div>
                    <%
                        }
                    } else {
                    %>
                    <h1 class="pacifico-blue">Welcome Dear User</h1>
                    <%
                    }
                    %>

                </div>
            </div>

            <!-- Right Side Panel -->
            <div class="col-md-2 custom-panel custom-panel-right">
                <!-- Add your right side panel content here -->
                <h4></h4>
                <!-- Add whatever content you want in the right side panel -->
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofMz/8E+nDRdIAsjFuCZSmKbSSUnQlmh/j" crossorigin="anonymous"></script>
</body>
</html>
