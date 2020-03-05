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
        <script type="text/javascript" src="resources/js/mqttws31.js"></script>
       	<script type="text/javascript" src="resources/js/logic.js"></script>

        <script>
            $(document).ready(function(){
            	if(localStorage.userType == "FRIEND") {
					$(".userOnly").hide();
					$(".friendOnly").show();
            	} else {
            		$(".userOnly").show();
					$(".friendOnly").hide();
            	}
            	$("button[value='logic']").click(function() {
            		$("#messages").empty();
            		startConnect();
            	});
            });
        </script>
    </head>
    <body>
        <div class="header">
            <div>
                <a href="dashboard"><img class="house" src="resources/image/house_yellow.png">Dashboard</a>
            </div>
            <div class="menu-gp">
                <a href="#"><img class="menu-img burger" src="resources/image/burger.png"></a>
                <div class="overlay">
                    <div class="menu-items">
                        <a href="health"><img class="menu-img" src="resources/image/yellow/health.png"></a>
                        <a href="photo"><img class="menu-img" src="resources/image/yellow/photo.png"></a>
                        <a href="security" class="userOnly"><img class="menu-img" src="resources/image/yellow/security.png"></a>
                        <a href="rule" class="userOnly"><img class="menu-img" src="resources/image/yellow/rule.png"></a>
                        <a href="device" class="userOnly"><img class="menu-img" src="resources/image/yellow/device.png"></a>
                        <a href="#"><img class="menu-img" src="resources/image/user.png"></a>
                        <a href="login"><img class="menu-img" src="resources/image/logout.png"></a>
                    </div>
                </div>
            </div>
        </div>
        <div class="main rule">
            <div class="sub">
                <div class="title">Simulations</div>
                <div class="button-gp">
                	<button type="button" value="logic"><span>Composite Logic</span></button>
                </div>
                <div class="sub-section">
                	<div class=rule>
                		<div>IF Face Recognition detected [User = Martin, Kathryn, David, Edvin, Bill Gates]</div>
                		<div>THEN Unlock [Door1],</div>
                		<div>THEN Lock [Door1] after 10s.</div>
                	</div>
                </div>
                <div id="messages"></div>
            </div>
        </div>
    </body>
</html>