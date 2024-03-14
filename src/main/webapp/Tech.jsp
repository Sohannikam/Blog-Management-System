<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <title>Technology News</title>

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
        /* Adjust styling as needed */
        body {
            font-family: 'Poppins', sans-serif;
            font-family: 'Roboto', sans-serif;
        }

        .navbar-brand {
            cursor: default;
        }

        .card {
            margin-bottom: 20px;
        }

        .cool-link {
            display: inline-block;
            color: #000;
            text-decoration: none;
        }

        .cool-link::after {
            content: '';
            display: block;
            width: 0;
            height: 2px;
            background: #e00606;
            transition: width .3s;
        }

        .cool-link:hover::after {
            width: 100%;
            transition: width .3s;
        }
    </style>
</head>

<body>

    <!-- navbar starts here  -->

    <nav class="navbar navbar-expand-lg navbar-light bg-secondary">
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
                        <a class="nav-link  fw-bolder" aria-current="page" href="./Home.jsp">Home</a>
                    </li>
                    <li class="nav-item dropdown ">
                        <a class="nav-link active dropdown-toggle fw-bolder" href="#" id="navbarDropdown" role="button"
                            data-bs-toggle="dropdown" aria-expanded="false">
                            Category
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item active" href="./Tech.jsp">Technology</a></li>
                            <li><a class="dropdown-item" href="#">Sports</a></li>
                            <li><a class="dropdown-item" href="#">Travel</a></li>
                            <li><a class="dropdown-item" href="#">Film</a></li>

                        </ul>
                    </li>

                </ul>

                <div class="dropdown">
                    <button class="btn  dropdown-toggle" type="button" id="dropdownMenuButton1"
                        data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="fa-solid fa-user"></i>
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


    <!-- navbar ends here  -->



    <!-- technology blog section starts here  -->

    <div class="container mt-5">
        <div class="row">
            <div class="col-md-10 offset-md-1">
                <div class="sticky-top">
                    <h2 class="mb-4 fw-bold cool-link">Technology Blogs</h2>
                </div>
                <div id="newsContainer" class="row">
                    <!-- News articles will be dynamically added here -->
                </div>
            </div>
        </div>
    </div>

    <!-- technology blog section starts here  -->



    <!-- Rapid API integration  -->

    <script>
        const url = 'https://technology-news3.p.rapidapi.com/news';
        const options = {
            method: 'GET',
            headers: {
                'X-RapidAPI-Key': 'd5456a4da0msh84b361f345d4441p170f2bjsn9e25d9d03dd5',
                'X-RapidAPI-Host': 'technology-news3.p.rapidapi.com'
            }
        };

        async function fetchNews() {
            try {
                const response = await fetch(url, options);
                const data = await response.json();

                // Reference to the news container
                const newsContainer = document.getElementById('newsContainer');

                // Iterate through each news article and create HTML elements
                data.forEach(article => {
                    const card = document.createElement('div');
                    card.classList.add('col-md-6', 'col-lg-4'); // Responsive columns

                    card.innerHTML = `
                    <div class="card">
                        <img src="https://via.placeholder.com/150" class="card-img-top" alt="Article Image">
                        <div class="card-body">
                            <h5 class="card-title">${article.title}</h5>
                            <p class="card-text">Source: ${article.source}</p>
                            <a href="${article.url}" class="btn btn-primary" target="_blank">Read More</a>
                        </div>
                    </div>
                `;

                    // Append the card to the news container
                    newsContainer.appendChild(card);
                });
            } catch (error) {
                console.error(error);
            }
        }

        // Call the fetchNews function to load data on page load
        fetchNews();

        
    </script>

    <!-- rapid api script ends here  -->







    <!-- Bootstrap JS and Popper.js (required for Bootstrap) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>

</body>

</html>