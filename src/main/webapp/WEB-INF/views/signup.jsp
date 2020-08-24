<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=devide-width, initial-scale=1.0">
        <title>CSS</title>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!-- 합쳐지고 최소화된 최신 CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
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
            .red {
                color: #e30f00;
                font-weight: bold;
            }
            html,body{
                height:100%;
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
                min-width: 400px;
                min-height: 600px;
                position: relative;
                width:30%;
                height:60%;
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
                background-repeat: no-repeat;
                background-size: cover !important;
                background-position: center;;
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
            p#signup{
                padding-top:20px;
                margin-bottom: 30px;
                font-size: xx-large;
            }
            input[type=text]{
                width:70%;
                height: 25px;
                border-radius: 1%;
            }
            
            .form-group {
                margin-bottom: 20px !important;
            }
        </style>
      </head>
      <body>
        <div id="back">
            <p id="subject">투 게 더</p>
            <div id="logins">
                <p id="signup">회원가입</p>
                <form class="form-horizontal" style="width: 100%;">
                    <div class="form-group form-group-sm" style="width: 100%;">
                      <label class="col-sm-4 control-label" for="formGroupInputSmall">아이디<span class="red">* </span></label>
                      <div class="col-sm-8">
                        <input class="form-control" type="text" id="formGroupInputSmall" placeholder="아이디를 입력하세요." style="display: inline-block;float: left;">
                        <button type="button" class="btn btn-primary btn-sm" style="display: inline-block;float: right;">중복확인</button>
                      </div>
                    </div>
    
                    <div class="form-group form-group-sm" style="width: 100%;">
                        <label class="col-sm-4 control-label" for="formGroupInputSmall">비밀번호<span class="red">* </span></label>
                        <div class="col-sm-8">
                          <input class="form-control" type="text" id="formGroupInputSmall" placeholder="비밀번호를 입력하세요.">
                        </div>
                      </div>
    
                      <div class="form-group form-group-sm" style="width: 100%;">
                        <label class="col-sm-4 control-label" for="formGroupInputSmall">비밀번호 확인<span class="red">* </span></label>
                        <div class="col-sm-8">
                          <input class="form-control" type="text" id="formGroupInputSmall" placeholder="비밀번호를 입력하세요.">
                        </div>
                      </div>
    
                      <div class="form-group form-group-sm" style="width: 100%;">
                        <label class="col-sm-4 control-label" for="formGroupInputSmall">이름<span class="red">* </span></label>
                        <div class="col-sm-8">
                          <input class="form-control" type="text" id="formGroupInputSmall" placeholder="이름 입력하세요.">
                        </div>
                      </div>
    
                      <div class="form-group form-group-sm" style="width: 100%;">
                        <label class="col-sm-4 control-label" for="formGroupInputSmall">이메일<span class="red">* </span></label>
                        <div class="col-sm-8">
                          <input class="form-control" type="text" id="formGroupInputSmall" placeholder="이메일을 입력하세요.">
                        </div>
                      </div>
    
                      <div class="form-group form-group-sm" style="width: 100%;">
                        <label class="col-sm-4 control-label" for="formGroupInputSmall">자기소개<span class="red">* </span></label>
                        <div class="col-sm-8">
                          <input class="form-control" type="text" id="formGroupInputSmall" placeholder="자기소개를 입력하세요.">
                        </div>
                      </div>
    
                      <div class="form-group form-group-sm" style="width: 100%;">
                        <label class="col-sm-4 control-label" for="formGroupInputSmall">나이<span class="red">* </span></label>
                        <div class="col-sm-8">
                            <input type="number" class="form-control" placeholder="20" min="5" max="100" style="width: 20%;">
                        </div>
                      </div>
                      
                      <button type="button" class="btn btn-primary btn-sm" style="display: inline-block;">가입하기</button>
                      <button type="button" class="btn btn-default">닫기</button>
                </form>
            </div>
        </div>
      
    
    
    </body>
</html>