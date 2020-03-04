<!DOCTYPE html>
<html lang="sv">
    <head>
        <title>Ambient Assisted Living</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="resources/css/reset.css">
        <link rel="stylesheet" href="resources/css/main.css">
        <link rel="apple-touch-icon" sizes="180x180" href="resources/favicon_io/apple-touch-icon.png">
        <link rel="icon" type="image/png" sizes="32x32" href="resources/favicon_io/favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="16x16" href="resources/favicon_io/favicon-16x16.png">
        <link rel="manifest" href="resources/favicon_io/site.webmanifest">
        <script type="text/javascript" src="resources/js/jquery-3.3.1.js"></script>

        <script>
            $(document).ready(function(){
				if(localStorage.userType == "FRIEND")
					$(".userOnly").hide();
				else
					$(".userOnly").show();
            });
        </script>
    </head>
    <body>
        <div class="header">
            <div>
                <a href="dashboard"><img class="house" src="resources/image/house_yellow.png">Dashboard</a>
            </div>
            <div class="menu-group">
                <a href="#"><img class="menu-img user" src="resources/image/user.png"></a>
                <a href="login"><img class="menu-img" src="resources/image/logout.png"></a>
            </div>
        </div>
        <div class="main">
            <div class="section">
                <a class="item grow" href="health">
                    <span>Health</span>
                    <img src="resources/image/health.png">
                </a>
            </div>
            <div class="section">
                <a class="item grow" href="photo">
                    <span>Photos</span>
                    <img src="resources/image/photo.png">
                </a>
            </div>
            <div class="section userOnly">
                <a class="item grow" href="security">
                    <span>Security</span>
                    <img src="resources/image/security.png">
                </a>
            </div>
            <div class="section userOnly">
                <a class="item grow" href="rule">
                    <span>Rules</span>
                    <img src="resources/image/rule.png">
                </a>
            </div>
            <div class="section userOnly">
                <a class="item grow" href="device">
                    <span>Devices</span>
                    <img src="resources/image/device.png">
                </a>
            </div>
        </div>
    </body>
</html>