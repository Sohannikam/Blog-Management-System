<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Soul Scroll Dashboard</title>

     <!-- bootstrap css  -->
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
     
     <!-- fonr awseome cdn  -->
    
     <link rel="stylesheet" href="./index.css">

     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
        


    <div class="main-container d-flex">
        <div class="sidebar" id="side_nav">

            <div class="header-box px-2 pt-3 pb-4 d-flex justify-content-between">
                <h1 class="fs-4"><span class="bg-white text-dark rounded shadow px-2 me-2">SS</span><span class="text-white">Soul Scroll</span></h1>
                <button class="btn d-md-none d-block close-btn px-1 py-0 text-white  "><i class="fa-solid fa-bars-staggered"></i></button>
            </div>
             <ul class="list-unstyled px-2">
                <li class=""><a href="#AdminMainDashboard" class="nav-link text-decoration-none px-3 py-2 d-block"><i class="fa-solid fa-gauge"></i> Admin Dashboard OverView</a></li>
                <li class=""><a href="#BlogDelete" class="nav-link text-decoration-none px-3 py-2 d-block"><i class="fa-solid fa-note-sticky"></i> Blog Post</a></li>
                <li class=""><a href="#addNewPost" class="nav-link text-decoration-none px-3 py-2 d-block"><i class="fa-solid fa-pen-to-square"></i>  Add New post</a></li>
                <li class=""><a href="#manageComments" class="nav-link text-decoration-none px-3 py-2 d-block"><i class="fa-solid fa-comments"></i> Manage Comments</a></li>
                <li class=""><a href="#AdminManageUser" class="nav-link text-decoration-none px-3 py-2 d-block"><i class="fa-solid fa-image-portrait"></i> Manage User</a></li>
                <li class=""><a href="#AdminAaddNewCategory" class="nav-link text-decoration-none px-3 py-2 d-block"><i class="fa-solid fa-plus"></i> Add New Category</a></li>
              
               
             </ul>
             <hr class="h-color mx-2">

             <ul class="list-unstyled px-2">
                <li class=""><a href="" class="text-decoration-none px-3 py-2 d-block"><i class="fa-solid fa-gear"></i> Settings</a></li>
                <!-- <li class=""><a href="" class="text-decoration-none px-3 py-2 d-block"><i class="fal fa-bell"></i> Notification</a></li> -->
             </ul>
            
        </div>


                     <!-- .............................. vertical Navbar Ends Here ................. -->





        <div class="content">
            <nav class="navbar navbar-expand-md navbar-light bg-light">
                <div class="container-fluid">
                    
                    <div class="d-flex justify-content-between d-md-none d-block">
                        <button class="btn px-1 py-0 open-btn me-2"><i class="fa-solid fa-bars-staggered"></i></button>
                  <a class="navbar-brand fs-4" href="#"><span class="bg-dark rounded px-2 py-0 text-white">$S</span></a>
                 
                </div>
                  <button class="navbar-toggler p-0 border-0" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <i class="fa fa-bars"></i>
                  </button>
                  <div class="collapse navbar-collapse justify-content-end" id="navbarSupportedContent">
                    <ul class="navbar-nav   mb-2 mb-lg-0">
                      <form action="AdminProf" method="get">
        <button type="submit" class="btn btn-success">Admin Profile</button>
    </form>
                    </ul>
                  </div>
                </div>
              </nav>

              <!-- ............. Dashbaord upper Navbar Ends Here ................  -->


              <div class="dashboard-content px-3 pt-4 " id="content-area">
                  <!-- dashboard content area  -->
        <!-- ...................... Loading Content dynamically ................  -->

        </div>
    </div>





      











    
    <!-- jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    
    <script src="./index.js "></script>
<!-- Your custom script -->


</body>
</html>