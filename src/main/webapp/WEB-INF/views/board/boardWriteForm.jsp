<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 작성</title>
<%@ include file="../header.jsp" %>
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
	
	
	.tdboardtitle{
	width:80px;
	}
	
    .container{
        text-align: center;
        width: 700px;
    }
        
    img{
        height: 50px;
    }
       
    table{
        margin:auto;
        width: 40px; 
    }

    textarea{
        resize: both;
        width : 500px;
        height : 200px;
    }
	
	
   

   
   
</style>
</head>


<body>
	
	
    <div class="container">
    	<!--글작성폼에 공지사항에서 쓰는지 문의사항에서 쓰는지 구분   -->
    	<div class = "sub_banner">
    		<c:if test="${board.mini_cat == 100}">
    			<h1 class="sub-title">공지사항</h1>
    		</c:if>
    		<c:if test="${board.mini_cat == 200}">
    			<h1 class="sub-title">문의사항</h1>
    		</c:if>
    		<c:if test="${board.mini_cat == 300}">
    			<h1 class="sub-title">1:1문의사항</h1>
    		</c:if>
    	</div>
    	
    	
		<div class="container_sub">
		 <form action="write" method ="post">
		
		
		
			<input type="hidden" name="main_cat" value="${board.main_cat}">
			<input type="hidden" name="mini_cat" value="${board.mini_cat}">
		 	<input type="hidden" name="p_num" value="${board.p_num}">
		 	
		
		
			<input type="hidden" name="b_category" value="">
			<!-- 카테고리 셀렉트 -->
         
            <table class="tableboardwriteform">
            <%--
			        <c:if test = "${board.mini_cat == 300&p_num=${p_num}">
					<tr><td class="tdboardtitle">상품번호</td><td><a><${product.p_num}</td></tr>
					<tr><td class="tdboardtitle">상품이름</td><td><a><${product.p_name}</td></tr>
					</c:if>
             --%>
			            
            
                <tr><td class="tdboardtitle">제목</td><td><a><input name="b_title" class="form-control" type="text" style="margin-bottom: 10px; width: 500px;"></a></td></tr>
                <tr><td class="tdboardtitle">내용</td><td><a><textarea class="form-control" name="b_content" rows="10" cols="20"  style="margin-bottom: 10px;"></textarea></a></td></tr>
                <tr><td class="tdboardtitle">이미지</td><td><a><input type="file" class="btn btn-secondary" name="b_image"></a></td></tr>
				<tr><th><td>
				<div style="float: right">
				
				<button type="button" class="btn btn-outline-secondary" onclick="history.back()">목록</button>
				<input type="submit" value="등록" class="btn btn-outline-success">
				</div></td></tr>
            </table>
          </form> 
		</div>
	</div>
	
<%@ include file="../footer.jsp" %>
</body>
</html>
				