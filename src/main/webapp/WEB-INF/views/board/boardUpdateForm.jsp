<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script>
console.log('${board}');
</script>

<meta charset="UTF-8">
<title>게시판 수정</title>
<%@ include file="../header.jsp" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

<style>
	.sub_banner{
		margin-left: calc(-50vw + 50%);
		width:100vw;
		height:100px;
		background-color: #ccc;
		margin-bottom: 3.5rem;
		
	}
	
	.sub-title {
	text-align: center;
	line-height: 100px;
	}
	
	
	
	.container{
        text-align: center;
        width: 700px;
        
    }
	
   .update-info tr td{
   	width:65px;
   	height: 50px;
   
   }
    textarea{
        resize: both;
    }
  
</style>
</head>
<body>
<!--  
<c:if test="update?main_cat=300&mini_cat=100">
<h1 style="text-align: center">공지사항</h1>
</c:if>
<c:if test="board?main_cat=300&mini_cat=200">
<h1 style="text-align: center">문의사항</h1>
</c:if>
<hr>
-->

	
    	
	<div class="continer">
		<!--글작성폼에 공지사항에서 쓰는지 문의사항에서 쓰는지 구분   -->
    	<div class = "sub_banner">
    		<c:if test="${board.mini_cat == 100}">
    			<h1 class="sub-title">공지사항</h1>
    		</c:if>
    		<c:if test="${board.mini_cat == 200}">
    			<h1 class="sub-title">문의사항</h1>
    		</c:if>
    	</div>	
		<div align="center">
			<form action="update" method="post">
				<input type="hidden" name="b_num" value ="${board.b_num}">
				<input type="hidden" name="main_cat" value ="${board.main_cat}">
				<input type="hidden" name="mini_cat" value ="${board.mini_cat}">
				<table class = "update-info">
					<tr>
						<td>
							제목
						</td>
						<td>
							<input type="text" name="b_title" value="${board.b_title}">
						</td>
					</tr>
					<tr>
						<td>
							내용
						</td>
						<td>
							<textarea rows="5" name="b_content" cols="80">${board.b_content}</textarea>
						</td>
					</tr>
					<tr>
						<td>
							이미지
						</td>
						<td>
							<input type="file">
						</td>
						
					</tr>
				</table>
				<button type="button" class="btn btn-outline-secondary" onclick="boardList">목록</button>
				<button class="btn btn-outline-danger" onclick="history.back()">취소</button>
				<input type="submit" value="수정" class="btn btn-outline-success" >
			</form>
		</div>
	</div>
<%@ include file="../footer.jsp" %>
</body>
</html>