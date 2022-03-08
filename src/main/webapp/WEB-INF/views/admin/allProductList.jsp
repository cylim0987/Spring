<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
    	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
    	crossorigin="anonymous">
</script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>전체상품관리(관리자)</title>
<%@include file = "../header.jsp" %>
</head>
<style>
	.pg_btn{
    	text-align: center;
    	margin-bottom: 100px;
    }
    .table{
    	text-align: center;
    }
    .allProduct_table1{
    	width: 8%;
    }
    .allProduct_table2{
    	width: 21%;
    }
    .allProduct_table3{
    	width: 10%;
    }
    .allProduct_table4{
    	width: 11%;
    }
    .allProduct_table5{
    	width: 20%;
    }
    .allProduct_table6{
    	width: 10%;
    }
    .allProduct_table7{
    	width: 8%;
    }
    .allProduct_table8{
    	width: 6%;
    }
    .allProduct_table9{
    	width: 6%;
    }
    .allProduct_table_td1{
       	display: inline-block; 
    	width: 300px; 
    	height: 100%;
    	white-space: nowrap; 
    	overflow: hidden;
    }
</style>
<%
	String context = request.getContextPath();
    System.out.println("context->"+context);
%>
<script type="text/javascript">
	function getAllProductDelete(Vindex) {
		if(confirm("정말 삭제 하시겠습니까?") == true){ // 확인
			var selP_num = $("#p_num" + Vindex).val();
			
			$.ajax({
				url:"<%=context%>/allProductDelete",
				data:{p_num : selP_num},
				dataType:'text',
				success:function(data){
					$("#product" + Vindex).remove();
					
				}
			});
		}else{ //취소
			return false;
		}
	}
	
</script>
<body>
<div class="container">
    <div class="p-3 mb-2">
        <div class="p-3 mb-2 bg-secondary text-white">
            <h1 style="text-align: center;"> 관리자 상품관리</h1>
        </div>
    </div>
    <c:set var="num" value="${pg.total-pg.start+1}"></c:set>
        <div id="manaber_table">
        	<%@include file = "../mypage/menu.jsp" %>
            <div style="width: 100%">
                <form action="action" method="post">
                    <table class="table table-bordered w-auto">
                        <tr class="tr_title">
                            <th class="allProduct_table1">상품번호</th>
                            <th class="allProduct_table2">상품이름</th>
                            <th class="allProduct_table3">판매자</th>
                            <th class="allProduct_table4">카테고리</th>
              	            <th class="allProduct_table5">펀딩기간</th>
              	            <th class="allProduct_table6">상품가격</th>
              	            <th class="allProduct_table7">달성율</th>
              	            <th class="allProduct_table8">수정</th>
              	            <th class="allProduct_table9">삭제</th>
                        </tr>
                        <!-- c:forEach 시작 -->
                        <c:forEach var="product" items="${allproductListAll}" varStatus="status">
                            <tr id="product${status.index}">
                                <td>
                                	<input type="hidden" id="p_num${status.index}" value="${product.p_num}">
                                	${product.p_num}
                               	</td>
                                <td class="allProduct_table_td1">${product.p_name}</td>
                                <td>${product.p_store}</td>
                                <td>${product.mini_content}</td>
                                <td>${product.p_start} ~ ${product.p_end}</td>
                                <td>${product.p_price}</td>
                                <td>${product.attainment}%</td>
                                <c:if test="${member.mini_cat == 300}">
                                <td><button type="button" class="btn btn-outline-info" onclick="location.href='allProductUpdateForm?p_num=${product.p_num}';">수정</button></td>
                                <td><button type="button" class="btn btn-outline-danger" onclick="getAllProductDelete(${status.index})">삭제</button></td>
                                </c:if> 
                            </tr>
                            <c:set var="num" value="${num - 1}"></c:set>
                        </c:forEach>
                        <!-- c:forEach 끝 -->
                    </table>
                </form>
            </div>
        </div>
        
	<div class="pg_btn">
	    <c:if test="${pg.startPage > pg.pageBlock}">
	        <a href="allProductList?currentPage=${pg.startPage - pg.pageBlock}">[이전]</a>
	    </c:if>
	    <c:forEach var="i" begin="${pg.startPage}" end="${pg.endPage}">
	        <a href="allProductList?currentPage=${i}">[${i}]</a>
	    </c:forEach>
	    <c:if test="${pg.endPage < pg.totalPage}">
	        <a href="allProductList?currentPage=${pg.startPage + pg.pageBlock}">[다음]</a>
	    </c:if>
	</div>
</div>

<%@ include file = "../footer.jsp" %>
</body>
</html>