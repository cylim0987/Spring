
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<style>
.pagination {
	justify-content: center;
}
</style>



<title>beforeFundList</title>
</head>
<body>

	<div class="container">
		<table>
			<tr>
				<td><a href=""><img src="http://placehold.it/100x100"
						class="img-thumbnail" alt="..."></a></td>
				<td><a href=""><img src="http://placehold.it/100x100"
						class="img-thumbnail" alt="..."></a></td>
				<td><a href=""><img src="http://placehold.it/100x100"
						class="img-thumbnail" alt="..."></a></td>
				<td><a href=""><img src="http://placehold.it/100x100"
						class="img-thumbnail" alt="..."></a></td>
				<td><a href=""><img src="http://placehold.it/100x100"
						class="img-thumbnail" alt="..."></a></td>
				<td><a href=""><img src="http://placehold.it/100x100"
						class="img-thumbnail" alt="..."></a></td>
				<td><a href=""><img src="http://placehold.it/100x100"
						class="img-thumbnail" alt="..."></a></td>
				<td><a href=""><img src="http://placehold.it/100x100"
						class="img-thumbnail" alt="..."></a></td>
				<td><a href=""><img src="http://placehold.it/100x100"
						class="img-thumbnail" alt="..."></a></td>
				<td><a href=""><img src="http://placehold.it/100x100"
						class="img-thumbnail" alt="..."></a></td>
			</tr>
			<tr>
				<th style="text-align: center; vertical-align: middle;">푸드</th>
				<th style="text-align: center; vertical-align: middle;">패션잡화</th>
				<th style="text-align: center; vertical-align: middle;">테크가전</th>
				<th style="text-align: center; vertical-align: middle;">뷰티</th>
				<th style="text-align: center; vertical-align: middle;">홈리빙</th>
				<th style="text-align: center; vertical-align: middle;">베이비키즈</th>
				<th style="text-align: center; vertical-align: middle;">여행스포츠</th>
				<th style="text-align: center; vertical-align: middle;">반려동물</th>
				<th style="text-align: center; vertical-align: middle;">게임취미</th>
				<th style="text-align: center; vertical-align: middle;">캐릭터굿즈</th>
			</tr>

		</table>

		<div class="row">
			<div class="col">펀딩예정</div>
		</div>
		<hr>

		<div class="row row-cols-1 row-cols-md-3 g-4">
		
			<!-- 펀딩 예정 상품 목록 반복 시작 -->
			<c:forEach var="product" items="${productList}">
			<div class="col" onclick="location.href='fundingDetail?p_num=${product.p_num}&p_condition=${product.p_condition}'" style="cursor: pointer">
				<div class="card h-100">
					<img src="${pageContext.request.contextPath}/upload/${product.p_image1}" class="card-img-top"
						alt="...">
					<div class="card-body">
						<h5 class="card-title">${product.p_name}</h5>
						<p class="card-text">${product.p_start} | ${product.p_time} 오픈예정</p>
					</div>
				</div>
			</div>
			</c:forEach>
			<!-- 펀딩 예정 상품 목록 반복 끝 -->

			<div class="col">
				<c:if test="${pg.startPage >pg.pageBlock }">
					<a href="beforeFundList?currentPage=${pg.startPage-pg.pageBlock }">[이전]</a>
				</c:if>
				<c:forEach var="i" begin="${pg.startPage }" end="${pg.endPage }">
					<a href="beforeFundList?currentPage=${i}">[${i }]</a>
				</c:forEach>>
				<c:if test="${pg.startPage < pg.pageBlock }">
					<a href="beforeFundList?currentPage=${pg.startPage+pg.pageBlock }">[다음]</a>
				</c:if>
			</div>


		</div>
		
		



		
			<%-- <nav aria-label="Page navigation example">
				<div class="text-center">
				<c:if test="${pg.startPage >pg.pageBlock }">
					<a href="beforeFundList?currentPage=${pg.startPage-pg.pageBlock }">[이전]</a>
				</c:if>
				<c:forEach var="i" begin="${pg.startPage }" end="${pg.endPage }">
					<a href="beforeFundList?currentPage=${i}">[${i }]</a>
				</c:forEach>>
				<c:if test="${pg.startPage < pg.pageBlock }">
					<a href="beforeFundList?currentPage=${pg.startPage+pg.pageBlock }">[다음]</a>
				</c:if>
				</div>
			</nav>  --%>












	</div>





	<!-- JavaScript Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>


</body>
<%@ include file="../footer.jsp"%>
</html>