<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <style>
       
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
</head>
<body>
   <div class="container-fluid" >
    
    <div class="container" >
        <div class="d-flex flex-column mb-3">
            <p class="mb-0">Dashboard</p>
            <h3>Blog Overview</h3>
        </div>
     <div class="row">
        <div class="col-md-4">
            <div class="card mb-2" style="width: 18rem; border-radius: 30px;">
                <div class="card-body">
                  <h5 class="card-title text-center">{User}</h5>
                  <p class="card-text text-center" id="usercount">{Number of user}</p>
                 
                </div>
              </div>
        </div>
        <div class="col-md-4">
            <div class="card mb-2" style="width: 18rem; border-radius: 30px; ">
                <div class="card-body" >
                  <h5 class="card-title text-center">{Uers active now}</h5>
                  <p class="card-text text-center">{Number of users active now}</p>
                 
                </div>
              </div>
        </div>
        <div class="col-md-4">
            <div class="card mb-2" style="width: 18rem; border-radius: 30px;">
                <div class="card-body" >
                  <h5 class="card-title text-center">{user not active}</h5>
                  <p class="card-text text-center">{Number of users not active}</p>
                 
                </div>
              </div>
        </div>
     </div>
     </div>
    



</div>



























    
</body>
</html>