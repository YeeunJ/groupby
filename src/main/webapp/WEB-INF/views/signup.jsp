<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=devide-width, initial-scale=1.0">
    <title>Sign up</title>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <style>
        .cont {
            float:left;
        }
        .label {
            display: block;
            margin-bottom: 5px;
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
        html,body{
            height:100%;
            overflow: hidden;
        }
        p#subject{
            color:rgb(218, 218, 48);
            font-size: 20px;
            padding-left:60px;
            margin-top: -3px;
            font-weight: 700;
            font-size: 30px;
        }
        div#logins{
            background-color: rgba( 255, 255, 255,0.8);
            min-width: 250px;
            min-height: 650px;
            position: relative;
            width:30%;
            height:70%;
            top:0px;
            left:35%;
            text-align: center;
            align-content: center;
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
            background-repeat: repeat;
        }
        p#signup{
            padding-top:20px;
            font-size: xx-large;
        }
        input[type=text]{
            width:80%;
            height: 25px;
            border-radius: 1%;
        }
        
    </style>
  </head>
  <body>
    <div id="back">
        <p id="subject">투 게 더</p>
        <div id="logins">
            <p id="signup">회원가입</p>

            <fieldset style="width:90%;float:left;text-align: left;margin-left: 10px; border:none;">
                <form name="form1" action="form_ok.php" method="post" onsubmit="">
                  <div>
                    <span class="label">아이디<span class="red">* </span> </span>
                    <input type="text" name="id" placeholder="아이디 필수(입력)" style="
    display: inline-block;
    width: 70%;
">
                    <button style="background-color: rgb(30, 95, 216);color: white;width: 20%;display:inline-block;">중복확인</button>
                  </div>
                  <div>
                    <span class="label">비밀번호<span class="red">* </span> </span>
                    <input type="text" name="pw" placeholder="비밀번호를 입력하세요">
                  </div>
                  <div>
                    <span class="label">비밀번호 확인<span class="red">* </span> </span>
                    <input type="text" name="pw_confirm" placeholder="비밀번호를 입력하세요">
                  </div>
                  <div>
                    <span class="label">이름<span class="red">* </span> </span>
                    <input type="text" name="name" placeholder="이름을 입력하세요">
                  </div>
                  <div>
                    <span class="label">이메일<span class="red">* </span> </span>
                    <input type="text" name="em" placeholder="이메일을 입력하세요">
                  </div>
                  <div>
                    <span class="label">자기소개<span class="red">* </span> </span>
                    <input type="text" name="introduce" placeholder="자기소개란입니다.">
                  </div>
                  <div>
                      <span class="label">나이<span class="red">* </span> </span>
                      <input type="number" value="20" min="6" max="100">
                  </div>
                  <button type="button" id="modal_close_btn" style="display:inline-block;float:right;">닫기</button>
                  <button type="button" style="display:inline-block;float:right;background-color: blue;color: white;">가입하기</button>
                </form>
            </fieldset>
        </div>
    </div>
  

</body>
</html>