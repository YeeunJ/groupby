<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=devide-width, initial-scale=1.0">
    <title>CSS</title>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <style>
        p#subject{
            color:rgb(218, 218, 49);
            font-size: 20px;
            padding-left:60px;
            margin-top: -3px;
            font-weight: 700;
            font-size: 30px;
        }
        div#logins{
            background-color: rgba( 255, 255, 255,0.8);
            min-width: 250px;
            min-height: 400px;
            position: relative;
            width:25%;
            height:70vh;
            top:50px;
            left:40px;
            text-align: center;
            align-content: center;
        }
        p#loginpage {
            font-size: 50px;
            font-weight: bold;
            text-align: center;
            background-color: rgba( 255, 255, 255,0.8);
        }
        div#back {
            position: static;;
            z-index:1;
        }
        div#back:after {
            background-image:url('./../img/ballooning.jpg');
            top:0;
            left:0;
            position:absolute;
            background-size:100%;
            opacity:0.6!important;
            filter:alpha(opacity=60);
            z-index:-1;
            content:"";
            width:100%;
            height:100%;
        }
        input[type=checkbox] + label{
            display: inline-block;  
            cursor: pointer;  
            position: relative;  
            padding-left: 25px;  
            margin-right: 15px;  
            font-size: 13px;
        }
        hr#hori{
            width:0px;
            height:20px;
            border-left: 1px solid black;
        }
        .vr {
            height: 30px;
            width: 1px;
            border-left: 1px solid gray;
            /*display: inline-block;*/    
            /*margin: 0 auto;*/
        }
        p#word{
            font-weight: 700; font-size: 3vw; text-align: center; padding-top: 20px;
        }
        span.material-icons{
            background-color: rgb(207, 199, 199); min-height:22px; height:30px; width:30px; font-size: 30px; text-align: center;
        }
        input.login{
            padding:0;height:18px; width:70%; font-size: 15px; padding-top: 10px; margin:3px;
        }
        input.underbuttons{
            height:30px;
        }
        .api{
            width:60%;background-color: rgb(255, 255, 255);height:45px;  margin: 3px;vertical-align: auto;border:1px solid black;
        }
        div#word {
            display: inline-block;
            position: relative;
            float: right;
        }
    </style>
  </head>
  <body>
    <div id="back">
        <p id="subject">투 게 더</p>
        <div id="logins" style="float:left">
            <form method="post" id="login" action="">
                <p id="word">로그인</p>
                <div id="usernpass">
                    <span class="material-icons">
                        person
                    </span>
                  <input type="email" class="login" id="loginId" name="loginId" placeholder="Username">
                </div>
                <div>
                    <span class="material-icons">
                        vpn_key
                    </span>  
                    <input type="password" class="login" id="loginPw" name="password" placeholder="******">
                </div>
                <div style="margin: 5px;">
                    <label style="float: left; margin-left: 20px;"><input type="checkbox">아이디저장</label>
                    <input type="submit" value="로그인" style="float: right; margin-right:30px; background-color: rgb(30, 95, 216); color: white;">
                </div>
            </form>
            <br>
            <br>
            <div class="api" onclick="">
                <img src="./../img/naverlogo.png" style="width:40px; vertical-align:middle;">네이버 아이디로 로그인
                <!-- <input type="button" class="api" name="naver" value=""> -->
            </div >
            <div class="api" onclick="">
                <img src="./../img/googlelogo.png" style="width:40px; vertical-align:middle; margin-top: 6px; margin-right: 6px;">구글 아이디로 로그인
            </div>
            <hr>
            <div>
                <input type="button" value="아이디 찾기" class="underbuttons">
                <input type="button" value="비밀번호 찾기" class="underbuttons">
                <input type="button" value="회원가입" class="underbuttons">
            </div>
        </div>
        <div id="word">
            <h1 style="font-size: xx-large;">체크하세요!</h1>
            <pre style="font-size: x-large;">
당신이 해야할 일을 끝냈다면 체크하세요.
체크된 항목은 아래로 정렬됩니다.
체크할 항목이 늘어나면 진행률이 상승됩니다. 
해야할 일을 클릭하여 설명을 읽으세요.
            </pre>
        </div>
    </div>
  </body>
</html>
