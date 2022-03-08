<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>Image Upload 가져오기</h1>
<img alt="photo1" src="${pageContext.request.contextPath}/upload/homeLiving001-1.png">
<img alt="photo1" src="${pageContext.request.contextPath}/upload/${savedName}">
</body>
</html>