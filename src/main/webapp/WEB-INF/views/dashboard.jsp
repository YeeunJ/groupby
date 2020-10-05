<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>TOGETHER</title>
        <link rel="icon" type="image/x-icon" href="assets/img/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v5.13.0/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Saira+Extra+Condensed:500,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Muli:400,400i,800,800i" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="/css/styles.css" rel="stylesheet" />
        <link href="/css/dashboard.css" rel="stylesheet" />
        
        <!-- 모달창 링크 -->
	    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
	    <script src="https://kit.fontawesome.com/ef6d04f75a.js" crossorigin="anonymous"></script>
	    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
	    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>	    
	    <script type="text/javascript" src="/js/allBoard.js"></script>
	    <script type="text/javascript" src="/js/createBoard.js?d"></script>
	    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
	    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
	    <link rel="stylesheet" href="/css/createBoard.css?jj">
	    <link rel="stylesheet" href="/css/allBoard.css?d">
	    <!-- 여기까지 -->
	    
    </head>
    <body id="page-top">
    	<%@ include file="/WEB-INF/views/createBoard.jsp" %>
		<%@ include file="/WEB-INF/views/allBoard.jsp" %>
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top" id="sideNav">
            <a class="navbar-brand js-scroll-trigger" href="#page-top">
                <span class="d-block d-lg-none">TOGETHER</span>
                <span class="d-none d-lg-block"><img class="img-fluid img-profile rounded-circle mx-auto mb-2" src="/images/back.jpg" alt="" /></span>
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav">
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#about">About</a></li>
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#education">myBoard</a></li>
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#experience">allBoard</a></li>
                </ul>
            </div>
        </nav>
        <!-- Page Content-->
        <div class="container-fluid p-0">
            <!-- About-->
            <section class="resume-section" id="about">
                <div class="resume-section-content">
                    <h1 class="mb-0">
                        Harry
                        <span class="text-primary">Edward</span>
                    </h1>
                    <div class="subheading mb-5">
                        <a href="mailto:name@email.com">name@email.com</a> / 30
                    </div>
                    <p class="lead mb-5">I am ....... 자기소개자기소개자기소개!!!</p>
                    <p><a href="#group_join" rel="modal:open">모달창 테스트1</a></p>
                    <p><a href="#group_make" rel="modal:open">모달창 테스트2</a></p>
                    <div class="social-icons">
                        <a class="social-icon" href="#"><i class="fas fa-user-edit"></i></a>
                        <a class="social-icon" href="#"><i class="fas fa-bell"></i></a>
                    </div>
                </div>
            </section>
            <hr class="m-0" />
            <!-- Education-->
            <section class="resume-section" id="education">
                <div class="resume-section-content">
                    <h2 class="mb-5">내 게시판</h2>
                    <div class="d-flex flex-column flex-md-row justify-content-between mb-5">
                        <div class="flex-grow-1">
                            <h3 class="mb-0">ALGORITHM CAMP <i class="fas fa-book-open" style="color: #bd5d38;font-size: 28px;"></i> <i class="fas fa-user-cog" style="color: #bd5d38;font-size: 28px;"></i></h3>
                            <div class="subheading mb-3">나의 진도율: <progress value="10" max="20" style= "width: 10%; margin-top: 7px">(10/20)</progress></div>
                            <div>오늘 새로운 문제 나왔습니다!! 확인해보세요!!</div>
                            <p>2020/08/20 13:29:37</p>
                        </div>
                        <div class="flex-shrink-0"><span class="text-primary">May 2020 - August 2020</span></div>
                    </div>
                    <div class="d-flex flex-column flex-md-row justify-content-between">
                        <div class="flex-grow-1">
                            <h3 class="mb-0">James Buchanan High School</h3>
                            <div class="subheading mb-3">Technology Magnet Program</div>
                            <p>GPA: 3.56</p>
                        </div>
                        <div class="flex-shrink-0"><span class="text-primary">August 2002 - May 2006</span></div>
                    </div>
                </div>
            </section>
            <hr class="m-0" />
            
            <!-- Experience-->
            <section class="resume-section" id="experience">
                <div class="resume-section-content">
                    <h2 class="mb-5">전체 게시판</h2>
                    <div class="d-flex flex-column flex-md-row justify-content-between mb-5">
                        <div class="flex-grow-1">
                            <h3 class="mb-0">ALGORITHM CAMP <i class="fas fa-book-open" style="color: #bd5d38;"></i></h3>
                            <div class="subheading mb-3">회원 수: 5 / 미션 수: 20</div>
                            <p>하루에 알고리즘 5문제씩 같이 푸려고 만든 모임입니다!! 같이 성실하게 알고리즘 문제를 같이 풀면서 나눌 생각 있으신 분 누구나 환영해요~</p>
                        </div>
                        <div class="flex-shrink-0"><span class="text-primary">May 2020 - August 2020</span></div>
                    </div>
                    <div class="d-flex flex-column flex-md-row justify-content-between mb-5">
                        <div class="flex-grow-1">
                            <h3 class="mb-0">Web Developer</h3>
                            <div class="subheading mb-3">Intelitec Solutions</div>
                            <p>Capitalize on low hanging fruit to identify a ballpark value added activity to beta test. Override the digital divide with additional clickthroughs from DevOps. Nanotechnology immersion along the information highway will close the loop on focusing solely on the bottom line.</p>
                        </div>
                        <div class="flex-shrink-0"><span class="text-primary">December 2011 - March 2013</span></div>
                    </div>
                    <div class="d-flex flex-column flex-md-row justify-content-between mb-5">
                        <div class="flex-grow-1">
                            <h3 class="mb-0">Junior Web Designer</h3>
                            <div class="subheading mb-3">Shout! Media Productions</div>
                            <p>Podcasting operational change management inside of workflows to establish a framework. Taking seamless key performance indicators offline to maximise the long tail. Keeping your eye on the ball while performing a deep dive on the start-up mentality to derive convergence on cross-platform integration.</p>
                        </div>
                        <div class="flex-shrink-0"><span class="text-primary">July 2010 - December 2011</span></div>
                    </div>
                    <div class="d-flex flex-column flex-md-row justify-content-between">
                        <div class="flex-grow-1">
                            <h3 class="mb-0">Web Design Intern</h3>
                            <div class="subheading mb-3">Shout! Media Productions</div>
                            <p>Collaboratively administrate empowered markets via plug-and-play networks. Dynamically procrastinate B2C users after installed base benefits. Dramatically visualize customer directed convergence without revolutionary ROI.</p>
                        </div>
                        <div class="flex-shrink-0"><span class="text-primary">September 2008 - June 2010</span></div>
                    </div>
                </div>
            </section>
        </div>
        <!-- Bootstrap core JS-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"></script>
        <!-- Third party plugin JS-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
        <!-- Core theme JS-->
        <script src="/js/scripts.js"></script>
    </body>
</html>