<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
    <link rel="stylesheet" href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
    <script type="text/javascript" src="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
    <style>
        .visual{
            position: relative;
            width: 100%;
            
            
        
        }
        .visual button{
            position : absolute;
            z-index: 10;
            top: 50%;
            transform: translateY(-50%);
            width : 71px;
            height : 71px;
            border: none;
            border-radius: 100%;
            background: rgba(0,0,0,.5);

            
        }
        .visual button:before{
            font-family: 'xeicon';
            color: #fff;
            font-size : 45px;
        }
        .visual button.slick-prev {
            left: 50px;
            font-size : 0;
            color : transparent;

        }
        .visual button.slick-prev::before{
            content:"\e93d";
            font-family: 'xeicon';
        }

        .visual button.slick-next{
            right: 50px;
            font-size : 0;
            color : transparent;
        }

        .visual button.slick-next::before{
            content:"\e940";
            font-family: 'xeicon';
        }

        .visual div p {
            position : absolute;
     	  	 top: 20%;
           	left: 30%;
            font-size: 60px;
            font-weight: bolder;
            color : black;
            text-shadow: 1px 2px 2px #ffffff;
       

        }
       
         .visual div p label {
           
            font-weight: bolder;
			font-size : 30px;
        }
        
        .slick-list{
        	width: 100%;
        }
        .visual div{
        	""
        }

    </style>
    <title>Document</title>
</head>
<body>

    <div class="visual">
			<div 
				style="background-image: url(/login/images/area/area22-4.png); display: block; height: 500px; width: 100%; background-repeat : no-repeat; background-size : cover;">
				<p>나만의 오피스 찾고 싶다면?<br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SO EASY!<br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label>Easily Buy a Share office</label>
				</p>
			</div>
			<div 
				style="background-image: url(/login/images/area/area22-5.png); display: block; height: 500px; width: 100%; background-repeat : no-repeat; background-size : cover;">
				<p>나만의 오피스 찾고 싶다면?<br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SO EASY!<br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label>Easily Buy a Share office</label>
				</p>
			</div>
			<div 
				style="background-image: url(/login/images/area/area22-1.png); display: block; height: 500px; width: 100%; background-repeat : no-repeat; background-size : cover;">
				<p>나만의 오피스 찾고 싶다면?<br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SO EASY!<br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label>Easily Buy a Share office</label>
				</p>
			</div>
		</div>
<script>
  
    $('.visual').slick({

  infinite: true,
  speed: 500,
  fade: true,
  cssEase: 'linear',
  autoplay: true,
  autoplaySpeed: 2000,
  

});



</script>
    
</body>
</html>