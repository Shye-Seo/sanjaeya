<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no,  maximum-scale=1.0, minimum-scale=1.0" />
	<title> 게시판</title>
	<link rel="stylesheet" href="resources/css/boardlist.css">
	<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.6/dist/web/static/pretendard.css" />
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	</head>
<body>
	<div id="headers"><jsp:include page="/WEB-INF/views/header/header.jsp"></jsp:include></div>
	<div id = "title_wrap">
		<div class ="page-title">
			<div class = "title">
				<h1>공지사항</h1>
					<div class = "homeiconboard">
						<div id="icon_area">
						<div class = "homeicon1">
							<img src="resources/imgs/homebutton.svg" alt="" />
						</div>
						<div class = "homeicon2">
							<img src="resources/imgs/Icon material-navigate-next.svg" alt="" />
						</div>
						<div class = "homeicon3">공지사항</div>
						</div>
				    </div>
			</div>
		</div>
	</div>
	
		<div class = "board_btnarea">
			<input type="button" id = "noticebtn" onclick="location.href='board_list'" value="공지사항" />
			<input type="button" id = "docbtn" onclick="location.href='library_list'" value="자료실"/>
            <div class ="btnline"></div>
		</div>
		
		<div id="mobile_head">
				<div id="m_headtitle">공지사항</div>
			</div>
			
	<div class = "search_area">
	    <div class = "search">
	    	<form method="get">
	      		<input type="text" class = "listsearch" placeholder="검색어를 입력하세요." name = "title" value="${title}"/>
	    	<button class ="searchbtn" type = "submit"><img src = "resources/imgs/serachbtn.svg"></button>
	    	</form>
	    </div>
 	</div>
    <div class = "boardlist">
      <table id="list_">
      			<tr>
          			<th>번호</th><th>제목</th><th>작성자</th><th>날짜</th>
        		</tr>
        <c:forEach var="nl" items="${board_list}" varStatus="st">
				<tr>
					<td>${nl.id}</td>
					<td><a href="readView?id=${nl.id}">${nl.title}</a></td>
					<td>${nl.writer}</td>
					<td><fmt:formatDate value = "${nl.date}" pattern = "yyyy-MM-dd"/></td>
				</tr>
			</c:forEach>
      </table>
      <div class = "notinsertbtn">
     <div id="insert"><a href="write_board">+ 등록하기</a></div>
	  </div>
    </div>
    
    <!-- 모바일 -->
    <div id="mobile">
        <c:forEach var="nl" items="${board_list}" varStatus="st">
        	<table id="mobile_list">
				<tr id="mlist">
					<td id="mtitle"><a href="readView?id=${nl.id}">${nl.title}</a></td>
					<td id="icon" rowspan="2"><img src="resources/imgs/mobile_list_icon.svg"></td>
				</tr>
				<tr id="mdate_area">
					<td id="mdate"><fmt:formatDate value = "${nl.date}" pattern = "yyyy-MM-dd"/></td>
				</tr>
			</table>
			</c:forEach>
    </div>
    
    <div class = "pagewrap">
      <div class = "pagearea">
      		<c:if test="${paging.startPage != 1 }">
			<a
				href="notice_list?nowPage=${paging.startPage - 1}&cntPerPage=${paging.cntPerPage}&title=${title}"
				class="paging_0">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage}">
					<p>${p}</p>
				</c:when>
				<c:when test="${p != paging.nowPage}">
					<a
						href="notice_list?nowPage=${p}&cntPerPage=${paging.cntPerPage}&title=${title}"
						class="paging_1">${p}</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="notice_list?nowPage=${paging.endPage+1}&cntPerPage=${paging.cntPerPage}&title=${title}"
				class="paging_2">&gt;</a>
		</c:if>
      </div>
      </div>
       <jsp:include page="/WEB-INF/views/footer/footer.jsp"></jsp:include>
	</body>
</html>