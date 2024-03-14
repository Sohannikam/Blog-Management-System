document.addEventListener("DOMContentLoaded", function () {
    console.log("Document ready");

    // Initial load of Blog Dashboard
    loadContent('AdminMainDashboard.jsp');

    // Highlight the "Blog Dashboard" menu item
    document.querySelector('.sidebar ul li:first-child').classList.add('active');

    // Click event listener for dashboard menu items
    document.querySelectorAll('.sidebar ul li').forEach(function (menuItem) {
        menuItem.addEventListener('click', function () {
            console.log("Sidebar item clicked");
            document.querySelector(".sidebar ul li.active").classList.remove('active');
            this.classList.add('active');

            // Load content based on the clicked menu item
            const menuId = this.querySelector('a').getAttribute('href').substring(1);
            loadContent(`${menuId}.jsp`);
        });
    });

    // Click event listener for "Profile" link
    document.querySelector('.navbar-nav .nav-link').addEventListener('click', function () {
        console.log("Profile link clicked");
        // Add 'active' class to the "Profile" link
        document.querySelector('.navbar-nav .nav-link.active').classList.remove('active');
        this.classList.add('active');

        // Load content for the profile
        loadContent('adminProfile.jsp');
    });

    // Open sidebar button
    document.querySelector('.open-btn').addEventListener('click', function () {
        console.log("Open button clicked");
        document.querySelector('.sidebar').classList.add('active');
    });

    // Close sidebar button
    document.querySelector('.close-btn').addEventListener('click', function () {
        console.log("Close button clicked");
        document.querySelector('.sidebar').classList.remove('active');
    });

    // Function to load content dynamically
    function loadContent(url) {
        console.log("Loading content from:", url); // Add this line
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4) {
                if (xhr.status === 200) {
                    document.getElementById('content-area').innerHTML = xhr.responseText;
                } else {
                    console.error("Error loading content. Status:", xhr.status);
                }
            }
        };
        xhr.open('GET', url, true);
        xhr.send();
    }
   

    
});


