<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../fragments/header.jsp"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/boardstyle.css">


<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<!-- Page content -->
<div class="w3-content" style="max-width: 1100px">

	<!-- About Section -->
	<div class="w3-row w3-padding-64" id="about">
		<div class="w3-col m6 w3-padding-large w3-hide-small">
			<img src="${request.contextPath}/uploads/${board_img}"
				class="w3-round w3-image w3-opacity-min" alt="Table Setting"
				style="width: calc(100% + 20px); height: 480px; margin-top: 50px; margin-left: -20px;">
		</div>



		<div class="w3-col m6 w3-padding-large">
			<h1
				style="text-align: center; margin-top: 50px; font-size: 36px; font-weight: bold;">${title }</h1>
			<br>
			<p class="w3-large" style="word-wrap: break-word; word-break: break-word;">
			${content }
			</p>
			
		</div>
	</div>
</div>





<%@ include file="../fragments/footer.jsp"%>

