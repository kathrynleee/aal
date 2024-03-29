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
        <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
        <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>
        <script type="text/javascript" src="resources/js/jquery-3.3.1.js"></script>
		<script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
		<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

        <script>
            $(document).ready(function(){
            	$('.photo-carousel').slick({
            		fade: true,
            		//speed: 1000,
            		autoplay: true,
            		autoplaySpeed: 1000,
            		mobileFirst: true,
            		cssEase: 'linear'
            	});
            	
            	if(localStorage.userType == "FRIEND") {
					$(".userOnly").hide();
					$(".friendOnly").show();
            	} else {
            		$(".userOnly").show();
					$(".friendOnly").hide();
            	}
            	
            	$("input[type='file']").hide();
            	$("form").submit(function (event) {
            	    $.ajax({
            	          url: "restapi/upload",
            	          type: 'POST',
            	          data: {
            	        	  file: new FormData($(this))
            	          },
            	          async: false,
            	          complete: function (response) {
          			    	console.log(response);
          			    	},
            	          success: function (data) {
            	        	  console.log(data);
            	              //success callback
            	          },
            	          cache: false,
            	          contentType: false,
            	          processData: false,
            	          error: function() {
          			        alert('Error occured');
          			      }
            		});
            	});
            	
            	
            	'use strict';

            	;( function ( document, window, index )
            	{
            		var inputs = document.querySelectorAll( '.inputfile' );
            		Array.prototype.forEach.call( inputs, function( input )
            		{
            			var label	 = input.nextElementSibling,
            				labelVal = label.innerHTML;

            			input.addEventListener( 'change', function( e )
            			{
            				var fileName = '';
            				if( this.files && this.files.length > 1 )
            					fileName = ( this.getAttribute( 'data-multiple-caption' ) || '' ).replace( '{count}', this.files.length );
            				else
            					fileName = e.target.value.split( '\\' ).pop();

            				if( fileName )
            					label.querySelector( 'span' ).innerHTML = fileName;
            				else
            					label.innerHTML = labelVal;
            			});
            		});
            	}( document, window, 0 ));
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
        <div class="main photo">
            <div class="sub">
                <div class="title userOnly">Photo Carousel</div>
                <div class="title friendOnly">Upload Photos</div>
                <div class="sub-section friendOnly">
                    <!-- <div class="sub-section-title"></div> -->
                    <div class="uploadForm">
	                    <form action="#" method="GET" role="form" enctype="multipart/form-data">
		                    <div class="box">
								<input type="file" name="file-2[]" id="file-2" class="inputfile inputfile-2" data-multiple-caption="{count} files selected" multiple="">
								<label for="file-2">
									<svg xmlns="http://www.w3.org/2000/svg" width="20" height="17" viewBox="0 0 20 17"><path d="M10 0l-5.2 4.9h3.3v5.1h3.8v-5.1h3.3l-5.2-4.9zm9.3 11.5l-3.2-2.1h-2l3.4 2.6h-3.5c-.1 0-.2.1-.2.1l-.8 2.3h-6l-.8-2.2c-.1-.1-.1-.2-.2-.2h-3.6l3.4-2.6h-2l-3.2 2.1c-.4.3-.7 1-.6 1.5l.6 3.1c.1.5.7.9 1.2.9h16.3c.6 0 1.1-.4 1.3-.9l.6-3.1c.1-.5-.2-1.2-.7-1.5z"></path></svg>
									<span>Choose Files</span>
								</label>
							</div>
						 	<!--  <input type="file" name="img" multiple>-->
							<button type="submit">Upload</button>
						</form>
                    </div>
                </div>
	            <div class="sub-section userOnly">
	            	<div class="photo-carousel">
					  	<div><img class="carousel-img" src="resources/photo/grindelwald.jpg"></div>
					    <div><img class="carousel-img" src="resources/photo/lofoten.jpg"></div>
						<div><img class="carousel-img" src="resources/photo/prague-sunset.jpg"></div>
						<div><img class="carousel-img" src="resources/photo/roppongi-christmas.jpg"></div>
					</div>
	            </div>
            </div>
        </div>
    </body>
</html>