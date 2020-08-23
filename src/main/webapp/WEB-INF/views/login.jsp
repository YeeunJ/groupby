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
        .cont {
            float:left;
        }
        .label {
            display: inline-block;
            margin-bottom: 5px;
            width: 40%;
        }
        input {
            margin-bottom: 5px;
        }
        div {
            margin-bottom: 5px;
        }
        .wrap {
            overflow:hidden;
        }
        .red {
            color: #e30f00;
            font-weight: bold;
        }
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
            background-image:url('/images/ballooning.jpg');
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
            width:60%;
            background-color: rgb(255, 255, 255);
            height:45px;  
            margin: 3px;
            vertical-align: auto;
            border:1px solid black;
            display: inline-block;
        }
        div#word {
            display: inline-block;
            position: relative;
            float: right;
            margin-right : 50px;
        }
        #modal {
            top:10%;
            display: none;
            position:fixed;
            width:100%;
            height:100%;
            z-index:1;
            text-align: center;
        }
        #modal h2 {
            float:left;
            margin:0;   
        }
        #modal .modal_content {
            width:400px;
            margin:100px auto;
            padding:20px 10px;
            background:#fff;
            border:2px solid #666;
        }
        #modal .modal_layer {
            position:relative;
            top:50%;
            left:0;
            width:100%;
            height:100%;
            background:rgba(0, 0, 0, 0.5);
            z-index:-1;
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
                <img src="/images/naverlogo.png" style="width:40px; vertical-align:middle;">네이버 아이디로 로그인
                <!-- <input type="button" class="api" name="naver" value=""> -->
            </div >
            <div class="api" onclick="">
                <img src="/images/googlelogo.png" style="width:40px; vertical-align:middle; margin-top: 6px; margin-right: 6px;">구글 아이디로 로그인
            </div>
            <hr>
            <div>
                <input type="button" value="아이디 찾기" class="underbuttons">
                <input type="button" value="비밀번호 찾기" class="underbuttons">
                <button type="button" id="modal_opne_btn" class="underbuttons">회원가입</button>
                <div id="modal">
   
                    <div class="modal_content" style="text-align: left;">
                        <h2>회원가입</h2>
                        <br>
                        <p>*는 필수 입력 사항입니다.</p>


                        <fieldset style="width:380px; overflow:hidden">
                            <form name="form1" action="form_ok.php" method="post" onsubmit="">
                              <div>
                                <span class="label"><span class="red">* </span>아이디 </span>
                                <input type="text" name="id" placeholder="아이디 필수(입력)">
                                <button style="background-color: rgb(30, 95, 216); color: white;display:inline-block;float:right;height:10%;" value="중복확인"></button>
                              </div>
                              <div>
                                <span class="label"><span class="red">* </span>비밀번호 </span>
                                <input type="text" name="pw" placeholder="비밀번호를 입력하세요">
                              </div>
                              <div>
                                <span class="label"><span class="red">* </span>비밀번호 확인 </span>
                                <input type="text" name="pw_confirm" placeholder="비밀번호를 입력하세요">
                              </div>
                              <div>
                                <span class="label"><span class="red">* </span>이름 </span>
                                <input type="text" name="name" placeholder="이름을 입력하세요">
                              </div>
                              <div>
                                <span class="label"><span class="red">* </span>이메일 </span>
                                <input type="text" name="em" placeholder="이메일을 입력하세요">
                              </div>
                              <div>
                                <span class="label"><span class="red">* </span>자기소개 </span>
                                <input type="text" name="introduce" placeholder="자기소개란입니다.">
                              </div>
                              <div>
                                  나이...
                              </div>
                              <button type="button" id="modal_close_btn" style="display:inline-block;float:right;">닫기</button>
                              <button type="button" style="display:inline-block;float:right;background-color: blue;color: white;">가입하기</button>
                            </form>
                        </fieldset>




<!--
                        <form method="POST" action="">
                            <label>아이디<span class="star">*</span></label>
                            <input type="text" required>
                            <button style="margin-right:30px; background-color: rgb(30, 95, 216); color: white;display:inline-block">중복확인</button>
                            
                            <label>비밀번호<span class="star">*</span></label>
                            <input type="text" required>
                            
                            <label>비밀번호 확인<span class="star">*</span></label>
                            <input type="text" required>
                            <fieldset>
                                <legend>회원가입</legend>
                                <label>아이디<span class="star">*</span><input type="text" required></label>
                                <br>
                                <label>비밀번호<span class="star">*</span><input type="text" required></label>
                            </fieldset>
                            <button type="button" id="modal_close_btn">닫기</button>
                        </form>    
-->

                       
                       
                    </div>
                   
                    <div class="modal_layer"></div>
                </div>
            </div>
        </div>
        <div id="word">
            <h1 style="font-size: xx-large;"></h1>
            <pre style="font-size: 25px;font:bold">
타인과 함께, 
타인을 통해서 협력할 때에야 
비로소 위대한 것이 탄생한다.
     <b>-Saint-Exupéry-</b>
            </pre>
        </div>
    </div>
  </body>
</html>
