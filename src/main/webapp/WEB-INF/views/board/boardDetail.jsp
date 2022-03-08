<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script>
	console.log('${board}');
</script>
<meta charset="UTF-8">
<title>게시판 조회</title>
<%@ include file="../header.jsp"%>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
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
	

.container {
	text-align: center;
}

.but {
	float: right;
	padding: 30px;
}

.nickname {
	font-size: 10pt;
	text-align: center;
	vertical-align: bottom;
}

textarea {
	resize: vertical;
	width: 678px;
}

img {
	
	height: 50px;
}

article {
	width: 700px;
	margin: 0 auto;
}

article textarea {
	width: 700px;
	padding: 1rem 1rem;
}

.board-title {
	width: 700px;
	height: 2rem;
	background-color: #ccc;
}

.board-title h3 {
	display: block;
	float: left;
}

.board-write-info {
	float: right;
	list-style: none;
}

.board-write-info li {
	margin-left: 10px;
	display: inline-block;
}

.board-img {
	width: 700px;
	height: 400px;
	margin-bottom: 2rem;
	background-color: #ccc;
}

.board-btn {
	margin-top: 3.5rem;	
	width: 700px;	
	height: 3rem;
	
	
}


.board-btn button,
.board-btn input[type=button],
.board-btn input[type=submit] {
	display: block;
	float:right;
}
</style>

</head>
<body>

	<div class="container">
		<div class = "sub_banner">
    		<c:if test="${board.mini_cat == 100}">
    			<h1 class="sub-title">공지사항</h1>
    		</c:if>
    		<c:if test="${board.mini_cat == 200}">
    			<h1 class="sub-title">문의사항</h1>
    		</c:if>
    	</div>	
	
		<article>
		<div class="board-title">
			<h3>${board.b_title}</h3>
			<ul class="board-write-info">
				<li><a class="nickname">${board.id}</a></li>
				<li><a class="nickname">${board.b_date}</a></li>
			</ul>
		</div>
		<hr>
		<div class="board-img">
			<!-- <img src="${board.b_image}">  -->
			<!-- 이미지 출력 -->
		</div>
		
		<textarea rows="7" readonly>${board.b_content}</textarea>

		<!-- button -->
		<div class="board-btn">
	<button class="btn btn-outline-danger" onclick="history.back()">목록</button>
		<c:choose>
			<c:when test="${member != null}">
					<c:choose>
						<c:when test="${board.mini_cat == 100 && member.id == 'admin'}">
							
								<button class="btn btn-outline-primary"
									onclick="location.href = 'updateForm?b_num=${board.b_num}'">수정</button>
								<form action="delete" method="post"
									onsubmit="return confirm('삭제하시겠습니까?')">
									<input type="hidden" name="b_num" value="${board.b_num}">
									<input type="hidden" name="main_cat" value="${board.main_cat}">
									<input type="hidden" name="mini_cat" value="${board.mini_cat}">
									<input class="btn btn-outline-danger" type="submit" value="삭제">
								</form>
						</c:when>
						
	<%-- 
						<c:when test="${board.mini_cat == 300 && ${member.mini_cat == 200">
									<button type="button" class="btn btn-outline-success"
									onclick="location.href = 'replyForm?b_num=${board.b_num}'">답변</button>
						</c:when>
	--%>
						
						<c:when test="${board.id == member.id}"> 
								<button class="btn btn-outline-primary"
									onclick="location.href = 'updateForm?b_num=${board.b_num}'">수정</button>
							
								<form action="delete" method="post"
									onsubmit="return confirm('삭제하시겠습니까?')">
									<input type="hidden" name="b_num" value="${board.b_num}">
									<input type="hidden" name="main_cat" value="${board.main_cat}">
									<input type="hidden" name="mini_cat" value="${board.mini_cat}">
									<input class="btn btn-outline-danger" type="submit" value="삭제">
								</form>

						</c:when>
						
						<c:when test="${member.id == 'admin'}">
								<form action="delete" method="post"
									onsubmit="return confirm('삭제하시겠습니까?')">
									<input type="hidden" name="b_num" value="${board.b_num}">
									<input type="hidden" name="main_cat" value="${board.main_cat}">
									<input type="hidden" name="mini_cat" value="${board.mini_cat}">
									<input class="btn btn-outline-danger" type="submit" value="삭제">
								</form>
									<button type="button" class="btn btn-outline-success"
						onclick="location.href = 'replyForm?b_num=${board.b_num}'">답변</button>
						</c:when>
						
						
						<%--
						<c:when test="  "${board.mini_cat == 300 && member.mini_cat == 200}>    
									<button type="button" class="btn btn-outline-success"
						onclick="location.href = 'replyForm?b_num=${board.b_num}'">답변</button>
						</c:when>
						
						 --%>
						
					</c:choose>
					
					
					
					
					
					
					
					
					<%-- 답변................................... --%>
					<%--
					
					<button type="button" class="btn btn-outline-success"
						onclick="location.href = 'replyForm?b_num=${board.b_num}'">답변</button>
					 --%>


			</c:when>
		</c:choose>
		</div>
		</article>

	</div>


	<%@ include file="../footer.jsp"%>
</body>
</html>