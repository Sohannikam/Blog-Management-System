<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Soul Scroll</title>
    <!-- Google Fonts cdm  -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;300&family=Roboto:wght@300&display=swap"
        rel="stylesheet">

    <!-- bootstrap cdn  -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <!-- font awsome cdn  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
        integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            font-family: 'Roboto', sans-serif;
        }

        .navbar-brand {
            cursor: default;
        }

        .soul {
            color: rgb(235, 74, 104) !important;
        }



        .Explore {
            margin-top: 10rem !important;
            color: yellow !important;
        }

        /* styles.css */
        .card img {
            transition: transform 0.3s ease-in-out;
        }

        .card img:hover {
            transform: scale(1.1);
        }

        @media(max-width:768px) {
            
            .signupbtn {
                display: flex;
                justify-content: center;
                align-items: center;
                margin-bottom: 8px;
            }

            .footercol {
                margin-left: -1.7rem;
            }

            .home,
            .drop,
            .user {

                color: antiquewhite !important;
            }

        }

        .dropdown{
            background-color: transparent !important;
        }

        @media(min-width:768px) and  (max-width:992px){
            .newsletter{
                margin-left: -2rem !important;
            }

           
        }
       
    </style>
</head>

<body>

    <nav class="navbar navbar-expand-lg navbar-light bg-transparent fixed-top">
        <div class="container-fluid">
            <a class="navbar-brand fw-bold fs-3 soul" href="#">Soul Scroll <i
                    class="fa-solid fa-pen-fancy fa-fade"></i></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav m-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active fw-bolder  home" aria-current="page" href="#">Home</a>
                    </li>
                    <li class="nav-item dropdown ">
                        <a class="nav-link dropdown-toggle fw-bolder drop" href="#" id="navbarDropdown" role="button"
                            data-bs-toggle="dropdown" aria-expanded="false">
                            Category
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="./Tech.jsp">Technology</a></li>
                            <li><a class="dropdown-item" href="#">Sports</a></li>
                            <li><a class="dropdown-item" href="#">Travel</a></li>
                            <li><a class="dropdown-item" href="#">Film</a></li>

                        </ul>
                    </li>

                </ul>

                <div class="dropdown">
                    <button class="btn  dropdown-toggle" type="button" id="dropdownMenuButton1"
                        data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="fa-solid fa-user user"></i>
                    </button>
                    <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                        <li><a class="dropdown-item" href="Signup.jsp">Signup</a></li>
                        <li><a class="dropdown-item" href="login.jsp">Login</a></li>

                    </ul>


                </div>
                <form>
                    <a class="btn btn-success" href="login.jsp">
                        <i class="fa-solid fa-plus"></i> Create Blog
                    </a>

                </form>

            </div>
        </div>
    </nav>

    <!-- navbar ends  -->

    <div class="container-fluid"
        style="background-image:url(./assests/homebg.jpg); background-size: cover; background-repeat: no-repeat; height: 100vh;">



        <div class="card-img-overlay">
            <!-- Card content goes here -->
            <div>
                <marquee behavior="" direction="right">
                    <h2 class="Explore fw-bold  text-dark">Explore the World with Soul Scroll</h2>
                </marquee>
                <p class="text-white fw-bolder">Unlock the true potential of your digital narrative with Soul Scroll,
                    your all-in-one solution for seamless blog management. Immerse yourself in a world where creativity
                    meets efficiency, empowering you to focus on what truly matters.</p>
                <div class="text-center">
                    <button class="btn text-center btn-primary"> react article</button>
                </div>
            </div>


        </div>
    </div>
    </div>

    <!-- this section ends here  -->

    <div class="container-fluid mt-5">
        <div class="conatainer ">
            <h2 class="text-center fw-bolder mt-3 mb-5">Popular Categories</h2>
        </div>
        <div class="container mt-3">
            <div class="row" id="card-container">
                <!-- Bootstrap cards will be added here dynamically using JavaScript -->
            </div>
        </div>
    </div>

    <!-- newsletter section  -->


    <div class="container-fluid bg-dark mt-5">
        <div class="container bg-white d-flex justify-content-center align-items-center  ">
            <div class="row mb-2 news">
                <div class="col-md-7 col-sm-12 newsletter">
                    <h3 class="text-dark text-center">Subscribe for Soul Scroll Newsletter</h3>
                </div>
                <div class="col-md-4 col-sm-12 mt-3 mt-md-0">
                    <input class="form-control text-center" id="email" type="email" pattern=".+@globex\.com" size="30"
                        placeholder="Enter Email Address">
                </div>
                <div class="col-md-1 col-sm-12 mt-3 mt-md-0">
                    <div class="signupbtn">
                        <button type="button" onclick="subscribe()" class="btn  btn-dark btn-block">Signup</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="container mt-3">
            <div class="row">
                <div class="col-md-4">
                    <p class="text-white">"Enter the realm of the <b class="text-warning"> Soul Scroll</b>, where the
                        written word springs to life and narratives whisper their truths, one elegant scroll at a time"
                        <i class="fa-solid fa-award fa-fade"></i>
                    </p>
                </div>
                <div class="col-md-3 col-sm-6 mt-3 mt-md-0 footercol">
                    <ul>
                        <li><a href="" style="text-decoration: none;">Home</a></li>
                        <li><a href="" style="text-decoration: none;">Blog</a></li>
                        <li><a href="" style="text-decoration: none;">Support</a></li>
                    </ul>
                </div>
                <div class="col-md-3 col-sm-6 mt-3 mt-md-0  footercol">
                    <ul>
                        <li><a href="" style="text-decoration: none;">Privacy Policy</a></li>
                        <li><a href="" style="text-decoration: none;">Security</a></li>
                        <li><a href="" style="text-decoration: none;">About</a></li>
                    </ul>
                </div>
                <div class="col-md-2 col-sm-12 mt-3 mt-md-0 footercol">
                    <ul>
                        <li><a href="https://www.instagram.com/_soul_scroll_/" target="_blank"
                                style="text-decoration: none;">Instagram</a></li>
                        <li><a href="" style="text-decoration: none;">Facebook</a></li>
                        <li><a href="" style="text-decoration: none;">Twitter</a></li>
                        <li><a href="" style="text-decoration: none;">Threads</a></li>
                    </ul>
                </div>
            </div>

            <hr class="border" />
            <div class="text-center text-white py-3">© 2023 Soul Scroll Industries, Incorporated. All rights reserved.
            </div>
        </div>
    </div>










   









    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>


    <!-- bootstrap js cdn  -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
        
        <script src="Home.js"></script>

</body>

</html>