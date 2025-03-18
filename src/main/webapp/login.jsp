<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SoulScroll - Login</title>

    <!-- bootstrap css cdn -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <!-- font awesome cdn -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <!-- external css  -->
    <link rel="stylesheet" href="./login.css">
    <meta name="google-signin-client_id" content="748235790548-4d5tm8g0hqjjfam3omcvp8t6jmq070a8.apps.googleusercontent.com">
</head>
<body>

    <div class="container-fluid d-flex justify-content-center align-items-center">
        <div class="container d-flex flex-column justify-content-center align-items-center">
            <div class="container inner-container">
                <div class="row d-flex justify-content-center">
                    <div class="col-md-6">
                        <!-- login form here  -->
                        <p class="fs-1 fw-bold text-center my-3 login-txt">Login</p>
                        <div class="container mt-4 d-flex justify-content-center">
                            <form method="get" action="Login" id="login-form">
                                <div class="form-group mb-4">
                                    <i class="fa-solid fa-envelope"></i>
                                    <input class="input text-center" placeholder="Enter your email" type="email" name="Uusername" id="login-email" required="required">
                                </div>
                                <div class="form-group mb-4">
                                    <i class="fa-solid fa-lock"></i>
                                    <input class="input text-center" placeholder="Enter your password" type="password" name="Upassword" id="login-password" required="required">
                                </div>
                                <div class="d-flex justify-content-between align-items-center mb-4">
                                    <button type="submit" class="btn btn-primary">Login</button>
                                    <a class="btn btn-success" href="Adminlogin.jsp">Admin Login</a>
                                    
                                </div>
                                <div class="d-flex justify-content-end form-group">
                                    <a href="Home.jsp">Back to Home</a>
                                    <a href="Signup.jsp" class="signup-image-link ms-3">Create an account</a>
                                </div>
                                   
                            </form>
                        </div>
                    </div>
                    <div class="col-md-4 text-center">
                        <div class="text-center mb-4">
                            <img src="./assests/signup-image.jpg" alt="Centered Image" class="mx-auto mt-5 img-fluid">
                        </div>
                        
                        <div class="container mt-3">
                            <p>Or Login with : <span class="ms-3"><i class="fa-brands fa-facebook-f fa-lg me-3 icons "></i><i class="fa-brands fa-x-twitter fa-lg me-3 icons "></i><i  class="fa-brands fa-google fa-lg icons "onclick="startGoogleSignIn()"></i></span></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- bootstrap js cdn -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script>
        window.onload = function (){
            gapi.load('auth2' , function(){
                gapi.auth2.init();
            });
        };

        function startGoogleSignIn(){
            gapi.auth2.getAuthInstance().signin();
        }

        function onSignIn(googleUser){
            try{
                var profile = googleUser.getBasicProfile();
                var email = profile.getEmail();
                console.log("User signed in with google: "+email);
            } catch(error) {
                console.log(error);
            }
        }
    </script>
</body>
</html>
