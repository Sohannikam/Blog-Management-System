<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SoulScroll - Signup</title>

    <!-- bootstrap css cdn -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <!-- font awesome cdn -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <!-- external css  -->
   <link rel="stylesheet" href="./login.css"> 
</head>
<body>


    <div class="container-fluid d-flex justify-content-center align-items-center">
        <div class="container  d-flex flex-column justify-content-center align-items-center">
            <div class="container inner-container">
                <div class="row d-flex justify-content-center ">
                    <div class="col-md-6">
                        <!-- signup form here  -->
                        <p class="fs-1 fw-bold text-center my-3 login-txt">Sign Up</p>
                        <div class="container mt-4 d-flex justify-content-center">
                      	 
                            <form method = "get" action = "register" id="signup-form">
                                <div class="form-group mb-4">
                                    <i class="fa-solid fa-user"></i>
                                    <input class="input text-center" placeholder="Enter your name" type="text" name="name1" id="signup-name" required ="required">
                                </div>
                                <div class="form-group mb-4">
                                    <i class="fa-solid fa-envelope"></i>
                                    <input class="input text-center" placeholder="Enter your email" type="email"  name="email1" id="signup-email" required ="required">
                                </div>

                                <div class="form-group mb-4">
                                    <i class="fa-solid fa-lock"></i>
                                    <input class="input text-center" placeholder="Enter your password" type="password" name="pass1" id="signup-password required ="required"">
                                </div>
                                <div class="form-group mb-4">
                                    <i class="fa-solid fa-key"></i>
                                    <input class="input text-center" placeholder="Confirm password" type="password"  name="cpass1" id="signup-confirm-password" required ="required">
                                </div>
                                
    							 <div class="form-group mb-4">
    							<label for="signup-gender">Gender</label>
    							<div class="form-check">
        							<input class="form-check-input" type="radio" name="gender1" id="male" value="male" required>
        							<label class="form-check-label" for="male">Male</label>
    							</div>
   								 <div class="form-check">
  						      <input class="form-check-input" type="radio" name="gender1" id="female" value="female" required>
   							     <label class="form-check-label" for="female">Female</label>
  							  </div>
								</div>
                                
                                <div class="form-check mb-4">
                                    <input class="form-check-input" type="checkbox" value="" id="signup-flexCheckDefault">
                                    <label class="form-check-label ms-2" for="signup-flexCheckDefault">
                                        I agree to all statements in the Terms of Service
                                    </label>
                                </div>
                                <button type="submit" class="btn btn-primary mb-4">Sign up</button>
                                
                                <div class="mb-5">
                                    	<a href="login.jsp" class="signup-image-link">I am already a
							member</a>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="col-md-4 text-center">
                        <div class="text-center mb-4">
                            <img src="./assests/signup-image.jpg" alt="Centered Image" class="mx-auto mt-5 img-fluid">
                        </div>
                        
                        <div class="container  mt-3" >
                            <p>Or Sign Up with : <span class="ms-3"><i class="fa-brands fa-facebook-f fa-lg me-3 icons "></i><i class="fa-brands fa-x-twitter fa-lg me-3 icons "></i><i  class="fa-brands fa-google fa-lg icons "></i></span></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- bootstrap js cdn -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	    <script src="./login.js"></script> 
	 
	
</body>
</html>
