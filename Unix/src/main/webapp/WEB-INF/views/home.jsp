 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>산재야</title>
<link rel="stylesheet" href="resources/css/home.css">
<%@ include file ="/WEB-INF/views/common.jsp" %>
</head>
<script>
	$(function() {
		$('.category_1').click(function () {
			var pageNum = 1;
			sessionStorage.setItem("pageNum", pageNum);
			location.href = "Checklist_s1";
			
			});
		$('.category_2').click(function () {
			var pageNum = 1;
			sessionStorage.setItem("pageNum", pageNum);
			location.href = "Checklist_s2";
			
			});
		$('.category_3').click(function () {
			var pageNum = 1;
			sessionStorage.setItem("pageNum", pageNum);
			location.href = "Checklist_s3";
			
			});
		
		
		
	})
	
	$("button").click(function() {
    $('html,body').animate({
        scrollTop: $(".category").offset().top},
        'slow');
});
	const btnArr = document.getElementsByTagName('button');
		 btnArr.addEventListener('click',function(e){
			    e.preventDefault();
			    document.querySelector('.category').scrollIntoView(true);
			  });
	
	</script>
<body>
	<jsp:include page="/WEB-INF/views/header/header.jsp"></jsp:include>
	<header>
		<img src="resources/imgs/main_background.png">
		<div class="main_BackgrounArea">
			<div class="Background_textArea">
				<div class="textArea_p1">
					Your Best Partner&nbsp;&nbsp;
					<div></div>
				</div>
				<div class="textArea_p2">산재로 인정이 될까요?</div>
				<div class="textArea_p3">
					다년간의 실무경험과 전문성을 보유한 공인노무사가<br> 속해 있는 인사노무 전문 그룹으로서<br>
					귀사와 귀하의 노동법률 문제 해결에 최선의 방안을 제시하겠습니다.
				</div>
				<a id="categoryscroll" href="#category"><button type="button">진단 시작하기</button></a>
			</div>
		</div>
	</header>
	<section class="section_1">
		<div class="wrap_container">
			<h2 id="category">나의 산재승인 가능성은?</h2>
			<h4>몇 번의 클릭으로 산재 승인 가능성을 알아보세요.</h4>
		</div>
		<div class="wrap_container">
                <div class="category">
                    <div class="category_1">
                        <p class="cate_img1"></p>
                        <p class="cate_p1">뇌심혈관질환/과로</p>
                    </div>
                    <div class="category_2">
                        <p class="cate_img2"></p>
                        <p class="cate_p2">직업성 암</p>
                    </div>
                    <div class="category_3">
                        <p class="cate_img3" onclick="location.href='Checklist_s3'"></p>
                        <p class="cate_p3">근골결계 질환</p>
                    </div>
                </div>
            </div>
	</section>
	<section class="section_2">
		<div class="wrap_container">
			<h2>더욱 편리하게</h2>
			<h4>산재 승인 여부를 통화없이 간편하게 확인하세요.</h4>
			<img src="resources/imgs/manual_img.svg">
			<div class="button_area">
				<a id="categoryscroll" href="#category"><button type="button">진단 시작하기</button></a>
			</div>
		</div>
	</section>
	<section class="section_3">
		<div class="wrap_container">
			<h2>궁금한 점이 있으신가요?</h2>
			<h4>산재 자가진단 서비스 관련 정보를 지금 확인하세요.</h4>
			<div class="tab_menu">
				<ul class="list">
					<li class="list_wrap"><a href="#tab_1" class="menu_btn">공지사항
							&nbsp;|&nbsp;&nbsp;</a>
						<div id="tab_1" class="list_123">
							<div class="list_re">
								<div>
									<a href="#" id="list_title">유닉스 노무법인 공지사항</a> <span
										id="list_date">2022.06.24</span> <a href="#" id="plusBtn">+</a>
								</div>
								<div>
									<a href="#" id="list_title">유닉스 노무법인 공지사항</a> <span
										id="list_date">2022.06.24</span> <a href="#" id="plusBtn">+</a>
								</div>
								<div>
									<a href="#" id="list_title">유닉스 노무법인 공지사항</a> <span
										id="list_date">2022.06.24</span> <a href="#" id="plusBtn">+</a>
								</div>
								<div>
									<a href="#" id="list_title">유닉스 노무법인 공지사항</a> <span
										id="list_date">2022.06.24</span> <a href="#" id="plusBtn">+</a>
								</div>
								<div>
									<a href="#" id="list_title">유닉스 노무법인 공지사항</a> <span
										id="list_date">2022.06.24</span> <a href="#" id="plusBtn">+</a>
								</div>
							</div>
						</div></li>
					<li><a href="#tab_2" class="menu_btn">관련판례 및 사례
							&nbsp;|&nbsp;&nbsp;</a>
						<div id="tab_2" class="list_123">
							<div class="list_re">
								<div>
									<a id="list_title">유닉스 노무법인 관련판례 및 사례</a> <span id="list_date">2022.06.24</span>
									<a href="#" id="plusBtn">+</a>
								</div>
								<div>
									<a id="list_title">유닉스 노무법인 관련판례 및 사례</a> <span id="list_date">2022.06.24</span>
									<a href="#" id="plusBtn">+</a>
								</div>
								<div>
									<a id="list_title">유닉스 노무법인 관련판례 및 사례</a> <span id="list_date">2022.06.24</span>
									<a href="#" id="plusBtn">+</a>
								</div>
								<div>
									<a id="list_title">유닉스 노무법인 관련판례 및 사례</a> <span id="list_date">2022.06.24</span>
									<a href="#" id="plusBtn">+</a>
								</div>
								<div>
									<a id="list_title">유닉스 노무법인 관련판례 및 사례</a> <span id="list_date">2022.06.24</span>
									<a href="#" id="plusBtn">+</a>
								</div>
							</div>
						</div></li>
					<li><a href="#tab_3" class="menu_btn">자료실&nbsp;&nbsp;</a>
						<div id="tab_3" class="list_123">
							<div class="list_re">
								<div>
									<a id="list_title">유닉스 노무법인 자료실</a> <span id="list_date">2022.06.24</span>
									<a href="#" id="plusBtn">+</a>
								</div>
								<div>
									<a id="list_title">유닉스 노무법인 자료실</a> <span id="list_date">2022.06.24</span>
									<a href="#" id="plusBtn">+</a>
								</div>
								<div>
									<a id="list_title">유닉스 노무법인 자료실</a> <span id="list_date">2022.06.24</span>
									<a href="#" id="plusBtn">+</a>
								</div>
								<div>
									<a id="list_title">유닉스 노무법인 자료실</a> <span id="list_date">2022.06.24</span>
									<a href="#" id="plusBtn">+</a>
								</div>
								<div>
									<a id="list_title">유닉스 노무법인 자료실</a> <span id="list_date">2022.06.24</span>
									<a href="#" id="plusBtn">+</a>
								</div>
							</div>
						</div></li>
					<li>
						<div class="morebtn">
							<a>더보기 ></a>
						</div>
					</li>
				</ul>
			</div>
		</div>

	</section>
	<section class="section_4">
		<div class="footer_img">
			<img src="resources/imgs/footer_img.png">
			<div class="footer_contents">
				<p class="footer_line1">지금 바로 회원이 되어 보세요.</p>
				<p class="foter_line2">
					간단한 가입 절차를 거치고<br> 회원만 누릴 수 있는 서비스를 경험해 보세요.
				</p>
				<div class="footer_hr"></div>
				<button class="signupBtn" type="button" onclick="">회원가입하기</button>
			</div>
		</div>
	</section>

	<jsp:include page="/WEB-INF/views/footer/footer.jsp"></jsp:include>
	<script>
        const tabList = document.querySelectorAll('.tab_menu .list li');

        for (var i = 0; i < tabList.length; i++) {
            tabList[i]
                .querySelector('.menu_btn')
                .addEventListener('click', function (e) {
                    e.preventDefault();
                    for (var j = 0; j < tabList.length; j++) {
                        tabList[j]
                            .classList
                            .remove('list_wrap');
                    }
                    this
                        .parentNode
                        .classList
                        .add('list_wrap');
                });
        }
    </script>
</body>
</html>
