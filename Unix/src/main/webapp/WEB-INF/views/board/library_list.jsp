<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
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
							<a href="Home"><img src="resources/imgs/homebutton.svg" alt="" /></a>
						</div>
						<div class = "homeicon2">
							<img src="resources/imgs/Icon material-navigate-next.svg" alt="" />
						</div>
						<div class = "homeicon3">자료실</div>
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
				<div id="m_headtitle">자료실</div>
			</div>
			
	<div class = "search_area">
	    <div class = "search">
	    <form method="post" id="searchform">
	      <input type="text" class = "listsearch" placeholder="검색어를 입력하세요." name = "title" value="${title}"/>
	    	<button class ="searchbtn" type = "submit"><img src = "resources/imgs/searchbtn.svg"></button>
	    </form>
	    </div>
 	</div>
 	
 	<c:if test="${total != 0}">
    <div class = "doclist">
      <table id="list_">
      			<tr>
          			<th>번호</th><th>제목</th><th>작성자</th><th>날짜</th>
        		</tr>
      <c:forEach var="li" items="${library_list}" varStatus="st">
				<tr>
					<td>${li.id}</td>
					<td><a href="readLibrary?id=${li.id}">${li.title}</a></td>
					<td>${li.writer}</td>
					<td><fmt:formatDate value = "${li.date}" pattern = "yyyy-MM-dd"/></td>
				</tr>
			</c:forEach>
      </table>
      
      <c:if test="${authority == 11}">
	      <div class = "docinsertbtn">
	      	<div id="insert"><a href="write_library">+ 등록하기</a></div>
		  </div>
	  </c:if>
    </div>
    
    <div class = "pagewrap">
      <div class = "pagearea">
      		<c:if test="${paging.total > 4}">
			<a href="library_list?nowPage=1&cntPerPage=${paging.cntPerPage}&title=${title}"
				class="paging_back2"><img src="resources/imgs/page_back2.svg"></a>
			</c:if>
      		<c:if test="${paging.total > 1 && paging.nowPage != 1}">
			<a
				href="library_list?nowPage=${paging.nowPage - 1}&cntPerPage=${paging.cntPerPage}&title=${title}"
				class="paging_back"><img src="resources/imgs/page_back.svg"></a>
			</c:if>
			<c:if test="${paging.nowPage == 1 && paging.total != 0}">
				<img src="resources/imgs/page_back_disabled.svg" id="page_back_disabled">
			</c:if>
			
		<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage}">
					<p>${p}</p>
				</c:when>
				<c:when test="${p != paging.nowPage}">
					<a
						href="library_list?nowPage=${p}&cntPerPage=${paging.cntPerPage}&title=${title}"
						class="paging_1">${p}</a>
				</c:when>
			</c:choose>
		</c:forEach>
		
		<c:if test="${paging.total != paging.lastPage && paging.nowPage != paging.lastPage}">
			<a href="library_list?nowPage=${paging.nowPage+1}&cntPerPage=${paging.cntPerPage}&title=${title}"
				class="paging_next"><img src="resources/imgs/page_next.svg"></a>
		</c:if>
		<c:if test="${paging.nowPage == paging.lastPage && paging.total != 0}">
			<img src="resources/imgs/page_next_disabled.svg" id="page_next_disabled">
		</c:if>
		<c:if test="${paging.total > 4}">
			<a href="library_list?nowPage=${paging.lastPage}&cntPerPage=${paging.cntPerPage}&title=${title}"
				class="paging_next2"><img src="resources/imgs/page_next2.svg"></a>
		</c:if>
      </div>
     </div>
     </c:if>
     
     <c:if test="${total == 0}">
     	<div id="searchResult">
     		<div id="non_search">게시물이 없습니다.</div>
     	</div>
     </c:if>
    
    <!-- 모바일 -->
    <div id="mobile_content">
    <div id="mobile">
        <c:forEach var="nl" items="${library_list}" varStatus="st">
        	<table id="mobile_list">
				<tr id="mlist">
					<td id="mtitle"><a href="readLibrary?id=${nl.id}">${nl.title}</a></td>
					<td id="icon" rowspan="2"><img src="resources/imgs/mobile_list_icon.svg"></td>
				</tr>
				<tr id="mdate_area">
					<td id="mdate"><fmt:formatDate value = "${nl.date}" pattern = "yyyy-MM-dd"/></td>
				</tr>
			</table>
		</c:forEach>
    </div>
    </div>
    
    <div class = "m_pagewrap">
      <div class = "m_pagearea">
      		<c:if test="${paging.total != 1 && paging.nowPage != 1}">
			<a
				href="library_list?nowPage=${paging.nowPage - 1}&cntPerPage=${paging.cntPerPage}&title=${title}"
				class="paging_back"><img src="resources/imgs/page_back.svg"></a>
			</c:if>
			<c:if test="${paging.nowPage == 1 && paging.total != 0}">
				<img src="resources/imgs/page_back_disabled.svg" id="page_back_disabled">
			</c:if>
			
		<div id="m_paging">
			${paging.nowPage}/${paging.lastPage}
		</div>
		
		<c:if test="${paging.total != paging.lastPage && paging.nowPage != paging.lastPage}">
			<a href="library_list?nowPage=${paging.nowPage+1}&cntPerPage=${paging.cntPerPage}&title=${title}"
				class="paging_next"><img src="resources/imgs/mobile_page_next.svg"></a>
		</c:if>
		<c:if test="${paging.nowPage == paging.lastPage && paging.total != 0}">
			<img src="resources/imgs/page_next_disabled.svg" id="page_next_disabled">
		</c:if>
      </div>
     </div>
       
       <div id="footer"><jsp:include page="/WEB-INF/views/footer/footer.jsp"></jsp:include></div>
	</body>
</html>