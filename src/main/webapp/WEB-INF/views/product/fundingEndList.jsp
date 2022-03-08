<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "../header.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/httpRequest.js"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
<style>
    .pagination {
        justify-content: center;
    }
</style>
<script>
function getSearchList(){
	alert($("form[name=search-form]").serialize());
	$.ajax({
		type: 'GET',
		url: "/getSearchList",
		data : $("form[name=search-form]").serialize(),
		dataType:'json',
		success : function(result){
			alert(result.p_name);
			$('.col').empty();
			/* if(result.length>=1){
			result.forEach(function(item){
				alert("상품이름"+item.p_name);
				str='<div class="card h-100">';
                str+='<img src="http://placehold.it/100x100" class="card-img-top" alt="...">';
                str+='<div class="card-body">';
                str+="<h5 class='card-title'>"+item.p_name+"</h5>";
                str+="<p class='card-text'>카테고리 | "+item.p_store+"</p>";
                str+='<div class="progress"><div class="progress-bar w-50" role="progressbar" aria-valuenow="50" aria-valuemin="0"aria-valuemax="100"></div></div><div class="row">';
                str+="<div class='col-2'>50%</div>";
                str+="<div class='col-6'>"+item.p_price+"원</div>";
                str+="<div class='col-4'>12일 남음</div>";
                str+="</div></div></div>";
                $('.col').append(str);
			}
		}  */
		}	
	});
}
</script>
<title>fundingList</title>
</head>

<body>
    <div class="container">
        <table>
            <tr>
             <c:if test="${not empty catList}">
      		 <c:forEach items="${catList}"  var="cat">
                <td><a href="fundingEndList?currentPage=1&main_cat=${cat.main_cat}&mini_cat=${cat.mini_cat}&p_condition=3"><img src="http://placehold.it/100x100" class="img-thumbnail" alt="..."></a></td>
               </c:forEach>
              </c:if>
              </tr>
              <tr>
               <c:if test="${not empty catList}">
      		 <c:forEach items="${catList}"  var="cat">
                <th style="text-align: center; vertical-align: middle;">${cat.c_content }</th>
              </c:forEach>
              </c:if>
              </tr>
         
          </table>
      
   
<div class="row">
            <div class="col-8">
            <h2>펀딩종료</h2>
            	<%-- <fmt:formatNumber value="${productList.p_condtion}" type="number" var="numberType"/> --%>
            	<%-- <c:if test="${numberType eq 2}">
            		펀딩중
            	</c:if>
            	<c:if test="${numberType eq 3}">
            		펀딩종료
            	</c:if> --%>
           	</div>

            <div class="col-2">
                <form class="d-flex" name=search-form>
                    <input class="form-control me-2" type="text" name="keyword" placeholder="검색" aria-label="Search">
                    <button class="btn btn-outline-success" type="submit" onclick=getSearchList()><i class="bi bi-search"></i></button>
                </form>
            </div>
            <div class="col-1">
                <div class="dropdown">
                    <button class="btn btn-secondary dropdown-toggle " type="button" id="dropdownMenuButton1"
                        data-bs-toggle="dropdown" aria-expanded="false">
                        펀딩중
                    </button>
                    <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                        <li><a class="dropdown-item" href="fundingList?p_condition=3">펀딩종료</a></li>

                    </ul>
                </div>
            </div>
            <div class="col-1">
                <div class="dropdown">
                    <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1"
                        data-bs-toggle="dropdown" aria-expanded="false">
                        인기순
                    </button>
                    <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                        <li><a class="dropdown-item" href="#">조회순</a></li>

                    </ul>
                </div>
            </div>
        </div>
        <hr>

        <div class="row row-cols-1 row-cols-md-3 g-4">
        
        	<!--  -->            
			<c:forEach var="product" items="${productList}">
            <div class="col">
                <div class="card h-100">
                    <img src="http://placehold.it/100x100" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title">${product.p_name }</h5>
                        <p class="card-text">${product.mini_content} | ${product.p_store }</p>
                        <div class="progress">
                            <div class="progress-bar" style="width: ${product.attainment}%" role="progressbar" aria-valuenow="${product.attainment}"
                            aria-valuemin="0" aria-valuemax="100"></div>
                        </div>

                        <div class="row">
                            <div class="col-3">
                                ${product.attainment}%
                            </div>
                            <div class="col">
                                ${product.p_price }
                            </div>
                            <div class="col-4">
                                ${product.leftdate}일 남음
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </c:forEach>
            <!--  -->

        </div>



        <div class="text-center">
        <c:if test="${pg.startPage >pg.pageBlock }">
			<a href="fundingList?currentPage=${pg.startPage-pg.pageBlock }">[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${pg.startPage }" end="${pg.endPage }">
			<a href="fundingList?currentPage=${i}">[${i }]</a>
		</c:forEach>>
		<c:if test="${pg.startPage < pg.pageBlock }">
			<a href="fundingList?currentPage=${pg.startPage+pg.pageBlock }">[다음]</a>
		</c:if>
            <!-- <nav aria-label="Page navigation example">
                <ul class="pagination">
                    <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item"><a class="page-link" href="#">Next</a></li>
                </ul>
            </nav> -->
        </div>


    </div>




    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>



        <%@include file = "../footer.jsp"%>
</body>

</html>        