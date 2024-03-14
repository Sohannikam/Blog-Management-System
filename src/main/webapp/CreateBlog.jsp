<!DOCTYPE html>
<html>
<head>
    <title>Create Blog</title>
</head>
<body>
    <h2>Create a New Blog</h2>
    <form action="CreateBlogServlet1" method="post">
        <label for="title">Title:</label>
        <input type="text" id="title" name="title" required><br>

        <label for="description">Description:</label><br>
        <textarea id="description" name="description" rows="15" cols="70" required></textarea><br>

        <label for="category">Category:</label>
        <select id="category" name="category" required>
            <option value="Technology">Technology</option>
            <option value="Sport">Sport</option>
            <option value="Travel">Travel</option>
            <option value="Film">Film</option>
        </select><br>

        <!-- Add other form elements or submit button if needed -->
        <br>
        
        <input type="submit" value="Create Blog">
    </form>
</body>
</html>
