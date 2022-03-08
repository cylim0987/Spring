<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script>
console.log('${listBoard}');
</script>
<meta charset="UTF-8">
<title>boardList</title>
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
     body{text-align: center;}

     table {
     margin: auto;
     width: 80%;
     border-top: 1px solid gray;
     border-collapse: collapse;
     }

     th, td {
         border-bottom: 1px solid gray;
         padding: 10px;
     }
     button{
      float: right;
  }

     a:link{
         color: black;
         text-decoration: none;
     }
     .write-btn{
     	float:right;
     	display:inline-block;
     }
     .board-page{
     	margin-top:50px;
     	
     	text-align:center;
     }
 </style>
 
 
 <script> 
  function writeForm() {
	  const main_cat = ${board.main_cat};
	  const mini_cat = ${board.mini_cat};
	  const p_num = ${board.p_num};
	  if (main_cat == '300' && mini_cat == '300'  ) {
		  location.href='writeForm?main_cat='+main_cat+'&mini_cat='+mini_cat+'&p_num='+p_num;
	  } else {
		  location.href='writeForm?main_cat='+main_cat+'&mini_cat='+mini_cat;
	  }
   }
 </script>
 
 
</head>
<body>
<div class="container">
        <h1>p_num : ${board.p_num}</h1>
		<div class = "sub_banner">
    		<c:if test="${board.mini_cat == 100}">
    			<h1 class="sub-title">공지사항</h1>
    		</c:if>
    		<c:if test="${board.mini_cat == 200}">
    			<h1 class="sub-title">문의사항</h1>
    		</c:if>
    		<c:if test="${board.mini_cat == 300}">
    			<h1 class="sub-title">1:1 문의사항</h1>
    		</c:if>
    		
    	</div>	


<table>
	<tr><th>번호</th>
	<%--
	<c:if test = "${board.mini_cat == 300 && p_num==${p_num}">
	 --%>
	<c:if test = "${board.mini_cat == 300}">
	<th>상품이름</th>
	</c:if>
	<%--
	</c:if>
	 --%>

	
	<th>제목</th><th>글쓴이</th><th>작성일</th><th>조회수</th></tr>
<c:forEach var="board" items="${listBoard}" varStatus="status">
	<tr id="board${status.index}">
		<td>${board.b_num}</td>
		
		
		<c:if test = "${board.mini_cat == 300}">
		<td>${product.p_name}</td>
		</c:if>
		
		<td>


		<c:forEach begin="1" end = "${board.b_level}">
		-
		</c:forEach>
		
		
		<a href="boardDetail?b_num=${board.b_num}">${board.b_title}</a>
		</td>
			<td>${board.id}</td>
		<td>${board.b_date}</td>
		<td>${board.b_hit}</td>
	</tr>
	
</c:forEach>
 		
</table><br>

	<div class = "write-btn">
		<c:choose>
        	 <c:when test="${board.mini_cat == 100 && member.mini_cat == 300}">
            		<button class="btn btn-outline-primary" onclick="writeForm()">글쓰기</button><br>
         	</c:when>
         	<c:when test="${board.mini_cat == 200 && (member.mini_cat == 100 || member.mini_cat == 200)}">
	           		<button class="btn btn-outline-primary" onclick="writeForm()">글쓰기</button><br>
	        </c:when>
	        <c:when test="${board.mini_cat == 300 && (member.mini_cat == 100 || member.mini_cat == 200)}">
	             	<button class="btn btn-outline-primary" onclick="writeForm()">글쓰기</button><br>
         	</c:when>
		</c:choose>
    </div>        
            	
            

		
		
        <div class = "board-page">
        <c:if test="${pg.startPage > pg.pageBlock}">
            <a href="boardList?main_cat=${board.main_cat}&mini_cat=${board.mini_cat}&currentPage=${pg.startPage - pg.pageBlock}">[이전]</a>
        </c:if>
        <c:forEach var="i" begin="${pg.startPage}" end="${pg.endPage}">
            <a href="boardList?main_cat=${board.main_cat}&mini_cat=${board.mini_cat}&currentPage=${i}">[${i}]</a>
        </c:forEach>
        <c:if test="${pg.endPage < pg.totalPage}">
            <a href="boardList?main_cat=${board.main_cat}&mini_cat=${board.mini_cat}&currentPage=${pg.startPage + pg.pageBlock}">[다음]</a>
        </c:if>
        </div>
        
</div>

<%@ include file="../footer.jsp" %>
</body>
</html>