# 🩺 산재야

![2022_06_15_산재서비스_down](https://github.com/Shye-Seo/sanjaeya/assets/93040911/268931e5-913e-4016-9764-c9b3ba9936fd)

* 개발기간 : 2022.06.30 ~ 2022.12.28 (30주)
* 참여인원 : 개발자 4명, 디자이너 1명

<br>

## 🔍 프로젝트 소개
- **체크리스트**를 통해 사용자의 산재판단 여부를 **자가진단**할 수 있는 반응형 웹 서비스입니다.
- 파편화된 산업재해에 대한 DB 구축을 통해 직업성 질병 판단 서비스를 제공합니다.
- 산재 가능성을 확인하고 전문가에게 상담을 신청할 수 있습니다.
- 반응형 웹으로 제작하여 다양한 디바이스에 대응이 가능합니다.

<br>

## 🛠 기술 스택
### Environment
<picture><img src="https://img.shields.io/badge/Eclipse IDE-2C2255?style=for-the-badge&logo=Eclipse IDE&logoColor=white"></picture> <picture><img src="https://img.shields.io/badge/mysql-4479A1?style=for-the-badge&logo=mysql&logoColor=white"></picture> <picture><img src="https://img.shields.io/badge/apache tomcat-F8DC75?style=for-the-badge&logo=apachetomcat&logoColor=white"></picture> <picture><img src="https://img.shields.io/badge/amazonaws-232F3E?style=for-the-badge&logo=amazonaws&logoColor=white"></picture> <picture><img src="https://img.shields.io/badge/git-F05032?style=for-the-badge&logo=git&logoColor=white"></picture> <picture><img src="https://img.shields.io/badge/github-181717?style=for-the-badge&logo=github&logoColor=white"></picture>


### Development
<picture><img src="https://img.shields.io/badge/Spring-6DB33F?style=for-the-badge&logo=Spring&logoColor=white"></picture> <picture><img src="https://img.shields.io/badge/java-007396?style=for-the-badge&logo=openjdk&logoColor=white"></picture> <picture><img src="https://img.shields.io/badge/javascript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=white"></picture> <picture><img src="https://img.shields.io/badge/jquery-0769AD?style=for-the-badge&logo=jquery&logoColor=white"></picture> <picture><img src="https://img.shields.io/badge/html5-E34F26?style=for-the-badge&logo=html5&logoColor=white"></picture> <picture><img src="https://img.shields.io/badge/css-1572B6?style=for-the-badge&logo=css3&logoColor=white"></picture>

<br>

## 🤝🏻 역할 분담
* 최유경 : 홈, 자가진단 체크리스트, 로그인/회원가입, 아이디/비밀번호 찾기
* 이진성 : 마이페이지, 메모장
* 서승혜 : 자료실 및 공지사항, 파일 업로드 & 다운로드, 검색
* 정현정 : 버튼 및 애니메이션 효과, 에러페이지

<br>

## 💡 프로젝트 구조

```
📦Unix
 ┣ 📂Unix
 ┃ ┣ 📂src
 ┃ ┃ ┣ 📂main
 ┃ ┃ ┃ ┣ 📂java
 ┃ ┃ ┃ ┃ ┗ 📂com
 ┃ ┃ ┃ ┃ ┃ ┗ 📂service
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📂unix
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂aws : S3에 파일 업로드 & 다운로드
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂boardController : 자료실 및 공지사항
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂boardDao
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂boardService
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂boardVo
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂checklistController : 자가진단 체크리스트
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂checklistDao
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂checklistService
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂checklistVo
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂memberDao
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂memberService : 로그인/회원가입, 아이디/비밀번호 찾기
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂memberVo
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂mypageController : 마이페이지
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂mypageDao
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂mypageService
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂mypageVo
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜HomeController.java
 ┃ ┃ ┃ ┣ 📂resources
 ┃ ┃ ┃ ┃ ┣ 📂mappers
 ┃ ┃ ┃ ┗ 📂webapp
 ┃ ┃ ┃ ┃ ┣ 📂META-INF
 ┃ ┃ ┃ ┃ ┣ 📂resources
 ┃ ┃ ┃ ┃ ┃ ┣ 📂css
 ┃ ┃ ┃ ┃ ┃ ┣ 📂imgs
 ┃ ┃ ┃ ┃ ┃ ┗ 📂js
 ┃ ┃ ┃ ┃ ┣ 📂WEB-INF
 ┃ ┃ ┃ ┃ ┃ ┣ 📂views : 홈, 체크리스트, 마이페이지, 로그인/회원가입
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂board : 자료실 및 공지사항
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂footer
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂header
 ┃ ┃ ┃ ┃ ┃ ┗ 📜web.xml
 ┃ ┃ ┃ ┃ ┣ 📜error.jsp
 ┃ ┃ ┃ ┃ ┗ 📜index.jsp

```
