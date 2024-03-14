<!DOCTYPE html>
<html>
<head>
    <title>Create Blog</title>

    
    
    
    <style>
  

 
    form {
        max-width: 600px;
        margin: 0 auto;
        background-color: #fff;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    label {
        font-weight: bold;
        margin-bottom: 5px;
    }

    input[type="text"],
    textarea,
    select {
        width: 100%;
        padding: 8px;
        margin-bottom: 10px;
        box-sizing: border-box;
        border: 1px solid #ccc;
        border-radius: 4px;
    }

    input[type="submit"] {
        background-color: #007bff;
        color: #fff;
        padding: 10px 20px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }

    input[type="submit"]:hover {
        background-color: #0056b3;
    }
</style>
    
</head>
<body>
    <h2>Create a New Blog</h2>
    <form action="CreateBlogServlet10" method="post" enctype="multipart/form-data">
        <label for="title">Title:</label>
        <input type="text" id="title" name="title" required="required"><br>
        
        <label for="description">Description:</label><br>
        <textarea id="description" name="description" rows="10" cols="70" required="required"></textarea><br>

        <label for="category">Category:</label>
        <select id="category" name="category" required="required">
            <option value="Technology">Technology</option>
            <option value="Sport">Sport</option>
            <option value="Travel">Travel</option>
            <option value="Film">Film</option>
        </select><br>
  <label for="image">Choose Image:</label>
        <input type="file" id="image" name="image" accept="image/*" required="required"><br>

        <!-- Add other form elements or submit button if needed -->
        <br>
        
        <input type="submit" value="Create Blog">
    </form>
</body>
</html>
