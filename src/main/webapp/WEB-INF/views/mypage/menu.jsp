<!--마이페이지 사이드메뉴 나중에 추가 예정-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        a { color: black; }
        a:hover { color: black; text-decoration: none; }
		
		.side-menu{
			width: 20%;
			padding: 0;
			margin: 0;
		}
		
        .side-menu ul {
            margin: 0;
            padding: 0;
            display: inline;
            font-size: 15px;
        }
        .side-menu ul li {
            list-style-type: none;
            margin-bottom: 5px;
        }

        .side-menu ul li:first-child {
            font-size: 20px;
            font-weight: bold;
            margin-bottom: 30px;
        }
    </style>
</head>
<body>
    <div class="side-menu col-md-2">
        <!-- 소비자일 경우 -->
        <c:if test="${member.mini_cat == 100}">
	        <ul>
	            <!-- 현재 접속한 회원의 이름 -->
	            <li>${member.name}님</li>
	            <li><a href="<c:url value='dibsList'/>">찜목록</a></li>
	            <li><a href="<c:url value='payList'/>">펀딩내역</a></li>
	            <li><a href="<c:url value='sellerQna?main_cat=300&mini_cat=200'/>">Q&A문의내역</a></li>
	            <li><a href="<c:url value='qnaList?main_cat=300&mini_cat=300'/>">1:1문의내역</a></li>
	            <li><a href="<c:url value='memberUpdateForm'/>">회원수정</a></li>
	            <li><a href="<c:url value='pwChangeForm'/>">비밀번호변경</a></li>
	        </ul>
        </c:if>
        
        <!-- 판매자일 경우 -->
        <c:if test="${member.mini_cat == 200}">
	        <ul>
	            <!-- 현재 접속한 회원의 이름 -->
	            <li>${member.name}님</li>
	            <li><a href="<c:url value='dibsList'/>">찜목록</a></li>
	            <li><a href="<c:url value='payList'/>">펀딩내역</a></li>
	            <li><a href="<c:url value='sellerQna?main_cat=300&mini_cat=200'/>">Q&A문의내역</a></li>
	            <li><a href="<c:url value='qnaList?main_cat=300&mini_cat=300'/>">1:1문의내역</a></li>
	            <li><a href="<c:url value='memberUpdateForm'/>">회원수정</a></li>
	            <li><a href="<c:url value='pwChangeForm'/>">비밀번호변경</a></li>
	            <li><a href="<c:url value='#'/>">1:1문의답변</a></li>
	            <li><a href="<c:url value='soldList'/>">판매자상품관리</a></li>
	        </ul>
		</c:if>
        
        <!-- 관리자일 경우 -->
        <c:if test="${member.mini_cat == 300}">
	        <ul>
	            <!-- 현재 접속한 회원의 이름 -->
	            <li>${member.name}님</li>
	            <li><a href="<c:url value='allMemberList'/>">회원관리</a></li>
	            <li><a href="<c:url value='qnaList?main_cat=300&mini_cat=100'/>">공지사항답변</a></li>
	            <li><a href="<c:url value='allProductList'/>">관리자상품관리</a></li>
	        </ul>
        </c:if>
    </div>
</body>
</html>
</body>
</html>