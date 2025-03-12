<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 홈</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/mypagee/css/mypage.css">
</head>
<style>
body {
	margin: 0;
	padding: 0;
}

.main-content {
	margin: 70px auto;
}

.wishlist-container {
	width: 105%;
	max-width: 1200px;
	/* margin: 70px auto; */
	background-color: #ffffff;
	padding: 30px;
	border-radius: 8px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
}

/* h2 {
        text-align: center;
        font-size: 2rem;
        color: #333;
        margin-bottom: 20px;
    } */

/* 리스트 스타일 */
.wishlist-list {
	list-style: none;
	padding: 0;
}

.wishlist-item {
	display: flex;
	align-items: center;
	border-bottom: 1px solid #ddd;
	padding: 15px 0;
	transition: background-color 0.3s ease;
}

.wishlist-item:hover {
	background-color: #f0f0f0;
}

.product-image {
	width: 150px;
	height: 150px;
	object-fit: cover;
	border-radius: 8px;
	margin: 0 20px;
}

.product-info {
	display: flex;
	flex-direction: column;
}

.product-name {
	font-size: 1.2rem;
	font-weight: bold;
	color: #333;
	margin-bottom: 5px;
	margin-top: 20px;
}

.product-price {
	font-size: 3px;
	color: #888;
}

/* 미디어 쿼리: 화면 크기에 따라 조정 */
@media ( max-width : 768px) {
	.wishlist-container {
		width: 95%;
		padding: 15px;
	}
	.wishlist-item {
		flex-direction: column;
		align-items: flex-start;
	}
	.product-image {
		margin-bottom: 10px;
	}
	.product-info {
		align-items: flex-start;
	}
}

.product-info {
	display: flex;
	flex-direction: column;
}

.product-name {
	font-size: 1.2rem;
	font-weight: bold;
	color: #333;
	margin-bottom: 20px;
	text-align: left;
}

.product-price {
	font-size: 17px;
	text-align: left;
	color: black;
	margin-right: 5px;
}

/* 별점과 평점을 한 줄로 표시 */
.product-info .rating {
	display: flex;
	align-items: center;
}

.star {
	font-size: 1.5rem;
	color: #f39c12;
	margin-right: 5px;
}

.point {
	font-size: 1.1rem;
	color: #333;
	margin-right: 10px;
}

.wishlist-item {
	position: relative;
}

.wishlist-icon {
	position: absolute;
	bottom: 10px;
	right: 20px;
	font-size: 2.5rem;
	color: #ff6b81;
	cursor: pointer;
	transition: color 0.3s ease, transform 0.3s ease;
}

.wishlist-icon:hover {
	color: #ff4757;
	transform: scale(1.1);
}

.btn btn-outline-primary{
	border: 1px solid #c9c9c9;
}

a.btn.btn-outline-primary:hover {
    border: 1px solid #c9c9c9;
    background-color: transparent;
    color: inherit;
    text-decoration: none;
}

a.btn.btn-outline-primary:active {
    border: 1px solid #c9c9c9;
    background-color: transparent;
    color: inherit;
    text-decoration: none;
}


</style>

<body>
	<%@ include file="../fragments/header.jsp"%>
	<div class="mypage-container">
		<%@ include file="mypageSidebar.jsp"%>

		<main class="main-content">

			<div class="wishlist-container">
				<h2 style="font-size: 24px;">관심상품</h2>
				<div class="wishlist-list">
					<c:forEach var="wishlist" items="${wishlist}">
					
						<div class="product-info">
							<a href="/pakage/packages.do?package_id=${wishlist.package_id}" style="border: 1px solid #c9c9c9; margin: 15px;" class="btn btn-outline-primary">
								<h3 class="product-name">${wishlist.package_name}</h3>
								<div class="rating">
									<div class="star" data-value="1"> ★ </div>
									<div class="point">4.9(43)</div> &nbsp;&nbsp;&nbsp;
									<div class="product-price">가격 : ${wishlist.package_price}円</div>
								</div>
							<button class="wishlist-btn" style="border: none; background: none;" data-package-id="${bestitem.package_id}">
								<img class="wishlist-icon" style=" width: 15px; height: auto;" src="${pageContext.request.contextPath}/product/img/heart.png">
							</button>
							</a>
						</div> 
					</c:forEach>
				</div>
			</div>
		</main>
	</div>
</body>
<%@ include file="../fragments/footer.jsp"%>
</html>