<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Settings</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    
    <!-- Custom CSS -->
    <link rel="stylesheet" href="./index.css">
</head>
<body>

    <!-- Manage Profile Button -->
    <div class="container mt-5">
        <button type="button" class="btn btn-success" onclick="loadEditProfile()">Manage Profile</button>
    </div>

    <!-- This div will hold the content of Edit_profile.jsp -->
    <div id="profileContent" class="container mt-4">
        <!-- Initially, this is empty; content will load here dynamically -->
    </div>

    <!-- jQuery for AJAX -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

  

</body>
</html>
