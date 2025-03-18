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

	
    <!-- signup form here  -->
                        <p class="fs-1 fw-bold text-center my-3 login-txt">Edit Profile</p>
                        <div class="container mt-4 d-flex justify-content-center">
                      	 
                            <form method = "post" action = "prfoedit" >
                                <div class="form-group mb-4">
                                    <i class="fa-solid fa-user"></i>
                                    <input class="input text-center"  value="<%= session.getAttribute("NAME") %>"placeholder="Enter your name" type="text" name="name1" id="signup-name" required ="required">
                                </div>
                                <div class="form-group mb-4">
                                    <i class="fa-solid fa-envelope" ></i>
                                    <input class="input text-center" value="<%= session.getAttribute("UEmail") %>" placeholder="Enter your email" type="email"  name="email1" id="signup-email" required ="required">
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
                                
                                <button type="submit" class="btn btn-primary mb-4">SAVE</button>
                               
                            </form>
                        </div>
                    </div>
</body>
</html>
