<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<script src = "//cdnjs.cloudflare.com/ajax/libs/jqurey/3.2.1/jquery.min.js"></script>
		<meta charset="UTF-8">
		<title>게시판</title>
		<link rel="stylesheet" href="resources/css/readView.css">
	</head>
	<body>
		<div id="wrap">
			<div id="headers"><jsp:include page="/WEB-INF/views/header/header.jsp"></jsp:include></div>
			<div class="page-title">
				<div class="title">
					<h1>공지사항</h1>
					<div class="homeiconboard">
						<div id="icon_area">
						<div class = "homeicon1">
							<a href="Home"><img src="resources/imgs/homebutton.svg" alt="" /></a>
						</div>
						<div class = "homeicon2">
							<img src="resources/imgs/Icon material-navigate-next.svg" alt="" />
						</div>
						<div class = "homeicon3">공지사항</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="board_btnarea">
				<input type="button" id = "noticebtn" onclick="location.href='board_list'" value="공지사항" class="select_board_btn"/>
				<input type="button" id = "docbtn" onclick="location.href='library_list'" value="자료실"/>
				<div class="btnline"></div>
			</div>
			
			<div id="mobile_head">
				<div id="m_headtitle">공지사항</div>
			</div>
			
			<!-- 공지사항 메인 글 읽는 영역 -->
				<form name = "readForm" role = "form" method = "post" id="readForm">
					<input type = "hidden" id = "id" name = "id" value = "${read.id}"/>
				<div class="board_main">
					<div class="board_main_title">
						<h4>${read.title}</h4>
						<p><fmt:formatDate value = "${read.date}" pattern = "yyyy-MM-dd"/></p>
					</div>
					<div id="content">
						${read.content}
					</div>
					<!-- 파일 부분 -->
					<div class="file">
						<c:if test="${boardFile_list != null}">
							<c:forEach var="files" items="${boardFile_list}" varStatus="st">
								<a href="download?filename=${files.address}">${files.address}</a>
								<a href="download?filename=${files.address}"><img src="resources/imgs/download_icon.svg"></a>
							</c:forEach>
						</c:if>
					</div>
				</div>
				</form>
				
				<!-- 이전글, 다음글 부분 -->
				<div class="pre_next_wrap">
					<c:if test="${pre != null}">
						<div class="pre_next">
							<a href="readView?id=${pre.getId()}">
								<div class="pre_next1">${pre.getTitle()}</div>
								<div class="pre_next2">이전글 <input type="button" class="pre_next3"/></div>
							</a>
						</div>
					</c:if>
					<c:if test="${next != null}">
					<div class="pre_next">
						<a href="readView?id=${next.getId()}">
							<div class="pre_next1">${next.getTitle()}</div>
							<div class="pre_next2">다음글 <input type="button" class="pre_next4"/></div>
						</a>
					</div>
					</c:if>
				</div>
				
					<div class="list_button">
						<div id="btn_area">
							<c:if test="${authority == 11}">
								<a href="updateView?id=${read.id}">수정</a>
								<a href="delete?id=${read.id}">삭제</a>
							</c:if>
							<a href="board_list">목록</a>
						</div>
					</div>
					
					<div class="mlist_button">
						<div id="mbtn">
							<a href="board_list">목록</a>
						</div>
					</div>
					
					<div id="footer"><jsp:include page="/WEB-INF/views/footer/footer.jsp"></jsp:include></div>
		</div>
	</body>
</html>