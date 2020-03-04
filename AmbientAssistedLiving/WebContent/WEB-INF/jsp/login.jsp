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
        	$("button[value='save']").click(function() {
        		$.ajax({
    				url : "restapi/login",
    				dataType: "json",
    				data : {
    					username: $("input[name='username']").val(),
                        password: $("input[name='password']").val()
    	    	    },
    				type : "POST",
    			    complete: function (response) {
    			    	console.log(response);
    			    	var type = "USER";
    			    	if($("input[name='username']").val() == "nick")
    			    		type = "FRIEND";
    			    	localStorage.userType = type;
    			    	window.location.href = "dashboard";
    			    },
    			    success: function(data) {
    			    	console.log(data);
    			    		
    			    },
    			    error: function() {
    			        alert('Error occured');
    			    }
    			});
        	});
    	});
    </script>
</head>
<body>
    <div class="header">
        <a href="#"><img class="house" src="resources/image/house_yellow.png">Ambient Assisted Living Dashboard</a>
    </div>
    <div class="login">
<!--        <div class="title">Login</div>-->
        <form>
            <div>
                <label for="username">Username</label>
                <input type="text" name="username" placeholder="Username">
            </div>
            <div>
                <label for="password">Password</label>
                <input type="password" name="password" placeholder="Password">
            </div>
            <button type="submit" value="save"><span>Login</span></button>
        </form>
        <div class="newUser"><a>Create account</a></div>
    </div>
</body>
</html>