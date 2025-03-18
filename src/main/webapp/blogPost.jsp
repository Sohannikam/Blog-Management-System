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

<!-- bootstrap css  -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

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
	background-color: rgba(0, 0, 0, 0.1);
	/* Faint Black with 10% opacity */
}

.custom-panel-right {
	background-color: rgba(0, 0, 0, 0.1);
	/* Faint Black with 10% opacity */
}

.custom-panel-top {
	border-bottom: 1px solid #ddd;
	padding: 10px;
	background-color: #f8f9fa;
	text-align: center;
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


	<!-- <div class="container-fluid">
		<div class="row">
			Top Panel
			<div class="col-md-12 custom-panel-top">
				Add your top panel content here
				<h2>Explore Your Blogs</h2>
				Add whatever content you want in the top panel
			</div>
		</div> -->

		<div class="row">
			<!-- Left Side Panel -->
			<!-- <div class="col-md-2 custom-panel custom-panel-left"> -->
				<!-- Add your left side panel content here -->
				<h4></h4>
				<!-- Add whatever content you want in the left side panel -->
			</div>

			<!-- Main Content -->
			<div class="blog-container">
				<!-- Display Comments -->
				<div class="container mt-3">
					<h4></h4>

					<%
					// Retrieve the list of blog posts from the request attribute
					List<BlogPost> blogPosts = (List<BlogPost>) session.getAttribute("blogPosts");
					List<Vicomment> commentsList = (List<Vicomment>) session.getAttribute("commentsList");

					if (blogPosts != null && !blogPosts.isEmpty()) {
						// Iterate through the list of blog posts
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
						    
							<h3 class="card-title"><%=blogPost.getTitle()%></h3>
							<p class="card-text"><%=blogPost.getDescription()%></p>
							<p class="card-text"><%=blogPost.getDate()%></p>

							<!-- Display Image -->
							<!-- Display Image with reduced size -->
							<img src="data:image/jpeg;base64,<%=base64Image%>"
								class="img-fluid" alt="Blog Image"
								style="max-width: 350px; max-height: 250px;">
								
								

							<!-- Display Comments for this blog post -->

							<!-- Add Comment Form -->
							<!-- Add Comment Form -->
							<form action="AddCommentServlet" method="get"
								style="margin-top: 1em;">
								<input type="hidden" name="blogId" value="<%=blogPost.getID()%>">
								<div class="mb-3">
									<textarea class="form-control" name="comment" rows="3"
										placeholder="Type your comment here..."></textarea>
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
										<li><strong><%=comment.getEmail()%>:</strong> <%=comment.getCome()%>
											<br> <small><%=comment.getDate()%></small></li>
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
								<!-- Align buttons horizontally using a flex container -->
								<!-- <div class="d-flex justify-content-between">
									<button type="submit" class="btn btn-primary">Add
										Comment</button>
								</div> -->
							</form>

							<!-- View Comments Form (Separate form outside the Add Comment form) -->
<!-- View Comments Form (Separate form outside the Add Comment form) -->
							<form  method="Post" style="margin-top: 1em;" class="comment-form">
								<input type="hidden" name="blogId" value="<%=blogPost.getID()%>">
								<!-- Use flexbox to align the button to the right -->
								<div class="d-flex justify-content-end">
									<button type="submit"  class="btn btn-success">View
										Comments</button>			
								</div>
							</form>
							
							 <!-- Add this div to display the comments dynamically -->
        <div class="comment-section">
            <!-- This is where the comments will be dynamically loaded -->
        </div>
						
							<a name="blog<%=blogPost.getID()%>"></a>

						</div>
					</div>
					<%
					}
					} else {
					%>
					<div class="alert alert-info" role="alert">No blog posts
						found.</div>
					<%
					}
					%>

				</div>
			</div>

			<!-- Right Side Panel -->
			<!-- <div class="col-md-3 custom-panel custom-panel-right"> -->
				<!-- Add your right side panel content here -->
				<h4></h4>
				<!-- Add whatever content you want in the right side panel -->
			</div>
		</div>
	</div>

	<!-- Bootstrap JS (you might need to include this at the end of your document) -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofMz/8E+nDRdIAsjFuCZSmKbSSUnQlmh/j"
		crossorigin="anonymous"></script>

	<script src="https://code.jquery.com/jquery-3.4.1.min.js"
		integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSF1Bw8HfCJo="
		crossorigin="anonymous"></script>
	
	<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

    <script>
    $('.comment-form').submit(function(event) {
        event.preventDefault(); // Prevent default anchor behavior
        
        var form = $(this); // Get the current form being submitted
        var blogId = form.find('input[name="blogId"]').val(); // Get the blogId from the form
        
        $.ajax({
            url: 'comuser', // URL of the Blog Post servlet
            method: 'POST',
            data: form.serialize(), 
            success: function(response) {
                // Load the response into the content area
            	form.closest('.card').find('.comment-section').html(response);           
                },
            error: function(xhr, status, error) {
                console.error('Error fetching blog post data:', error);
            }
        });
    });

    </script>
</body>
</html>