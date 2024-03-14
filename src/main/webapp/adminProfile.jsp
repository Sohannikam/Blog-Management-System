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
</head>
<body>
    <div class="container mt-5">
        <div class="card">
            <div class="card-body">
                <h1 class="card-title">WELCOME</h1>

                <!-- Display user information -->
                <form action="view" method="get">
                    <div class="mb-3">
                        <label for="name" class="form-label">Name:</label>
                        <h5 class="card-text" id="name"><%= session.getAttribute("AName1") %></h5>
                    </div>
                    <div class="mb-3">
                        <label for="email" class="form-label">Email:</label>
                        <h5 class="card-text" id="email"><%= session.getAttribute("AEmail1") %></h5>
                    </div>
                   
                </form>

                <form class="logout-button" action="Logout" method="get">
                    <button type="submit" class="btn btn-danger">Logout</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
