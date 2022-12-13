<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, viewport-fit=cover">
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.js"></script>
	
	<!-- 클래식 에디터 -->
	<script src="https://cdn.ckeditor.com/ckeditor5/35.3.0/classic/ckeditor.js"></script>
	<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/translations/ko.js"></script>
	<title>게시글 작성</title>
	<link rel="stylesheet" href="resources/css/write_board.css">
	<script type="text/javascript">
   $(document).ready(function() {
	   $("#fileDragDesc").show(); 
       $("#fileListTable").hide();
       
       $("#input_file").bind('change', function() {
           selectFile(this.files);
       });
   });
   
   // 파일 리스트 번호
   var fileIndex = 0;
   // 등록할 전체 파일 사이즈
   var totalFileSize = 0;
   // 파일 리스트
   var fileList = new Array();
   // 파일 사이즈 리스트
   var fileSizeList = new Array();
   // 등록 가능한 파일 사이즈 MB
//    var uploadSize = 5;
   // 등록 가능한 총 파일 사이즈 MB
//    var maxUploadSize = 500;
   
   var files = new Array();
   
   $(function() {
       // 파일 드롭 다운
       fileDropDown();
   });
   
   // 파일 드롭 다운
   function fileDropDown() {
       var dropZone = $("#dropZone");
       //Drag기능 
       dropZone.on('dragenter', function(e) {
           e.stopPropagation();
           e.preventDefault();
           // 드롭다운 영역 css
           dropZone.css('background-color', '#E3F2FC');
       });
       dropZone.on('dragleave', function(e) {
           e.stopPropagation();
           e.preventDefault();
           // 드롭다운 영역 css
           dropZone.css('background-color', '#FFFFFF');
       });
       dropZone.on('dragover', function(e) {
           e.stopPropagation();
           e.preventDefault();
           // 드롭다운 영역 css
           dropZone.css('background-color', '#E3F2FC');
       });
       dropZone.on('drop', function(e) {
           e.preventDefault();
           // 드롭다운 영역 css
           dropZone.css('background-color', '#FFFFFF');
           var files = e.originalEvent.dataTransfer.files;
           if (files != null) {
               if (files.length < 1) {
                   /* alert("폴더 업로드 불가"); */
                   console.log("폴더 업로드 불가");
                   return;
               } else {
                   selectFile(files);
               }
           } else {
               alert("ERROR");
           }
       });
   }
   // 파일 선택시
   function selectFile(fileObject) {
//        var files = null;
       if (fileObject != null) {
           // 파일 Drag 이용하여 등록시
           files = fileObject;
       } else {
           // 직접 파일 등록시
           files = $('#multipaartFileList_' + fileIndex)[0].files;
       }
       // 다중파일 등록
       if (files != null) {
           
           if (files != null && files.length > 0) {
               $("#fileDragDesc").hide(); 
               $("#fileListTable").show();
           } else {
               $("#fileDragDesc").show(); 
               $("#fileListTable").hide();
           }
           
           for (var i = 0; i < files.length; i++) {
               // 파일 이름
               var fileName = files[i].name;
               var fileNameArr = fileName.split("\.");
               // 확장자
               var ext = fileNameArr[fileNameArr.length - 1];
               
               var special_pattern = /[\{\}\[\]|<>\"]/gi;

               if(special_pattern.test($("input[name='file']").val())){
                   alert('파일명에 특수문자를 제거해주세요.');
                   return false;
               }
               
               var fileSize = files[i].size; // 파일 사이즈(단위 :byte)
               console.log("fileSize="+fileSize);
               if (fileSize <= 0) {
                   console.log("0kb file return");
                   return;
               }
               
               var fileSizeKb = fileSize / 1024; // 파일 사이즈(단위 :kb)
               var fileSizeMb = fileSizeKb / 1024;    // 파일 사이즈(단위 :Mb)
               
               var fileSizeStr = "";
               if ((1024*1024) <= fileSize) {    // 파일 용량이 1메가 이상인 경우 
                   console.log("fileSizeMb="+fileSizeMb.toFixed(2));
                   fileSizeStr = fileSizeMb.toFixed(2) + " Mb";
               } else if ((1024) <= fileSize) {
                   console.log("fileSizeKb="+parseInt(fileSizeKb));
                   fileSizeStr = parseInt(fileSizeKb) + " kb";
               } else {
                   console.log("fileSize="+parseInt(fileSize));
                   fileSizeStr = parseInt(fileSize) + " byte";
               }
				
                   // 전체 파일 사이즈
                   totalFileSize += fileSizeMb;
                   // 파일 배열에 넣기
                   fileList[fileIndex] = files[i];
                   // 파일 사이즈 배열에 넣기
                   fileSizeList[fileIndex] = fileSizeMb;
                   // 업로드 파일 목록 생성
                   addFileList(fileIndex, fileName, fileSizeStr);
                   // 파일 번호 증가
                   fileIndex++;
           }
       } else {
           alert("ERROR");
       }
   }
   // 업로드 파일 목록 생성
   function addFileList(fIndex, fileName, fileSizeStr) {
	   var html = "";
       html += "<div id='fileTr_" + fIndex + "'>";
       html += "    <div id='dropZone'>";
       html += "		<div id='filename'>"+fileName + " (" + fileSizeStr +")</div>" 
               + "<img src='resources/imgs/close.svg' href='#' onclick='deleteFile(" + fIndex + "); return false;'"
       html += "    </div>"
       html += "</div>"
       
       $('#fileTableTbody').append(html);
   }
   // 업로드 파일 삭제
   function deleteFile(fIndex) {
       console.log("deleteFile.fIndex=" + fIndex);
       // 전체 파일 사이즈 수정
       totalFileSize -= fileSizeList[fIndex];
       // 파일 배열에서 삭제
       delete fileList[fIndex];
       // 파일 사이즈 배열 삭제
       delete fileSizeList[fIndex];
		
       // 업로드 파일 테이블 목록에서 삭제
       $("#fileTr_" + fIndex).remove();
       
        console.log("totalFileSize="+totalFileSize);
        
        if (totalFileSize > 0) {
            $("#fileDragDesc").hide(); 
            $("#fileListTable").show();
        } else {
            $("#fileDragDesc").show(); 
            $("#fileListTable").hide();
        }
    }
   
   function deleteAll() {
	   for (var i = 0; i < files.length; i++) {
	   // 전체 파일 사이즈 수정
       totalFileSize -= fileSizeList[i];
       // 파일 배열에서 삭제
       delete fileList[i];
       // 파일 사이즈 배열 삭제
       delete fileSizeList[i];
		
       // 업로드 파일 테이블 목록에서 삭제
       $("#fileTr_" + i).remove();
	   }
	   
	   $("#fileDragDesc").show(); 
       $("#fileListTable").hide();
	}
   
   // 파일 등록
   function uploadFile() {
       // 등록할 파일 리스트
       var uploadFileList = Object.keys(fileList);
       
       // 용량을 500MB를 넘을 경우 업로드 불가
//        if (totalFileSize > maxUploadSize) {
//            // 파일 사이즈 초과 경고창
//            alert("총 용량 초과\n총 업로드 가능 용량 : " + maxUploadSize + " MB");
//            return;
//        }
       if (confirm("등록 하시겠습니까?") == true) {
           // 등록할 파일 리스트를 formData로 데이터 입력
           var form = $('#uploadForm');
           var formData = new FormData(form[0]);
           for (var i = 0; i < fileList.length; i++) {
           	formData.append('board_file', fileList[i]);
           }
           $.ajax({
               url : "write_board",
               data : formData,
               type : 'POST',
               enctype : 'multipart/form-data',
               processData : false,
               contentType : false,
//                dataType : 'json',
               cache : false,
               success : function (result) {
                   window.location.href="board_list";
               }
           });
       } else {
       	return false;
       }
   }
</script>
</head>
	<body>
		<div id="wrap">
			<jsp:include page="/WEB-INF/views/header/header.jsp"></jsp:include>
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
        </div>
        <div class="board_btnarea">
				<input type="button" id = "noticebtn" onclick="location.href='board_list'" value="공지사항" />
				<input type="button" id = "docbtn" onclick="location.href='library_list'" value="자료실"/>
				<div class="btnline"></div>
			</div>
			
  		<!-- 게시글 등록하기 영역 -->
			<div class="board_form">
				<h2>게시글 등록하기</h2>
  				<form name = "insert" method = "POST" action="write_board" enctype="multipart/form-data" id="uploadForm">
  				<table border=1>
						<tr>
							<td class="td1"><span>제목</span></td>
							<td><input type="text" name="title" id="title" class="td2" placeholder="제목은 최대 200자로 제한됩니다."></td>
						</tr>
						<tr>
							<td class="td3"><span>작성자</span></td>
							<td><input type="text" name="writer" id="writer" class="td4"></td>
						</tr>
						<tr>
							<td class="td5"><span>첨부파일</span></td>
							<td class="td6">
								<div id="dropZone" class="drop_area">
								<div id="fileDragDesc" class="add_file">
									<div id="text">파일을 끌어다 놓으세요.<br>파일명은 최대 200자로 제한되며, 파일명에 특수문자([ ] { } ^ | " < >)는 제거해주세요.</div>
								</div>
								
								<div id="fileListTable" class="add_file">
									<div id="fileTableTbody">
										
									</div>
								</div>
							</div>
								<label for="input_file" class="add_file_btn_label">파일 추가</label>
								<input type="file" id="input_file" multiple="multiple" name="file" hidden />
								<span onclick="deleteAll();">전체삭제</span>
							</td>
						</tr>
						<tr>
							<td class="td7"><span>내용</span></td>
							<td><textarea name="content" id="content" class="td8"></textarea></td>
						</tr>
					</table>
    			</form>
    			<input type = "reset" value = "취소" class = "cnl_btn">
    			<input type = "button" value = "등록" class = "sbm_btn" id="submit_btn">
    			<script type="text/javascript">
								$(function () {
									$('#submit_btn').click(function () {
										var title = $('#title').val();
										var writer = $('#writer').val();
										var content = $('#content').val();
										
										if(!title) {
											alert('제목을 입력해주세요.');
											return false;
										} else if (!writer) {
											alert('작성자를 입력해주세요.');
											return false;
										} else if (!content) {
											alert('내용을 입력해주세요.');
											return false;
										} else {
											uploadFile();
										}
									});
								});
								
								$(function () {
									$('.cnl_btn').click(function () {
											location.href="board_list";
									});
								});
				</script>
    	<jsp:include page="/WEB-INF/views/footer/footer.jsp"></jsp:include>
    	</div>
	</body>
</html>