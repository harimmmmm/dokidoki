<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/fragments/header.jsp"%>
<link href="<%=request.getContextPath()%>/notice/css/noticestyle.css" rel="stylesheet">

<div class="container margintop140">
	<div class="row">
		<div class="col-md-3">
			<div class="noticeSideTitle">
				<h2 class="bold">サポート</h2>
			</div>
			<p class="sidemenu"><a class="sidemenucont" href="/notice/frequentlyAsked.jsp">よくある質問</a></p>
			<p class="sidemenu"><a class="sidemenucont" href="/boards/noticelist.do">お知らせ</a></p>
			<p class="sidemenu"><a class="sidemenucont" href="/notice/customerCharter.jsp">お客様憲章</a></p>
		</div> <!-- end col-md-3 -->
		
		<div class=" col-md-6">
			<div class="noticetitlte">
				<h4>よくある質問</h4>
			</div>
			<div class="accordion" id="accordionExample" style="margin-top: 20px;">
				<div class="emptybox"> </div>
				<div class="accordion-item">
				  <h2 class="accordion-header" id="headingOne">
				    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
				      항공권 예약 문의는 어느 곳에서 해야 하나요?
				    </button>
				  </h2>
				  <div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
				    <div class="accordion-body">
				      항공권은 1544-5252 연결 후, 2번 또는 1544-53530으로 연결 요청드립니다. 1544-5252 연결 후, 1번은 패키지 관련 상담입니다.
				    </div>
				  </div>
				</div>
				
				<div class="accordion-item">
				  <h2 class="accordion-header" id="headingTwo">
				    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
				      국내 패키지 일정표 내 항공 시간이 없네요?
				    </button>
				  </h2>
				  <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
				    <div class="accordion-body">
				      추가 일정은 패키지 예약 후, 상담원에게 문의해 주세요.
				    </div>
				  </div>
				</div>
				
				<div class="accordion-item">
				  <h2 class="accordion-header" id="headingThree">
				    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
				      지금 해외 패키지 상품 예약이 가능한가요?
				    </button>
				  </h2>
				  <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
				    <div class="accordion-body">
				      해외 패키지는 현재 예약이 가능합니다. 문의 사항은 고객센터로 연락해 주세요.
				    </div>
				  </div>
				</div>
				
				<!-- 더 많은 항목을 여기에 추가할 수 있습니다. -->
			</div>
			<!-- 아코디언 끝 -->
		</div> <!-- end col-md-6 -->
		
		<div class="col-md-3">
			<div class="noticetelbox">
				<div>
					<h5 class="text-center righttitle bold">どきどきKorea<br>サポート</h5>
				</div>
				<div class="">
					<div class="CounselingCenter rightcontent">
						<div class="d-flex justify-content-start gap-1">
							<img class="img-fluid callicon" alt="" src="/notice/img/call.png">旅行相談センター
						</div>
						<div class="d-flex justify-content-center">
							<span class="fontcolor">1234-1234</span>
						</div>
					</div>
					<div class="CounselingCenter rightcontent">
						<div class="d-flex justify-content-start gap-1">
							<img class="img-fluid callicon" alt="" src="/notice/img/call.png">海外/国内航空相談
						</div>
						<div class="d-flex justify-content-center">
							<span class="fontcolor">1234-1234</span>
						</div>
					</div>
					<div class="CounselingCenter">
						<div class="d-flex justify-content-start gap-1">
							<img class="img-fluid callicon" alt="" src="/notice/img/call.png">サポート
						</div>
						<div class="d-flex justify-content-center">
							<span class="fontcolor">+82-42-242-4412</span>
						</div>
					</div>
					
				</div>
				
			</div>
			<div class="warningbox">
			    <div class="d-flex justify-content-start marginbottom">
			        <img class="img-fluid warningicon gap-1" alt="" src="/notice/img/warning.png">
			        <span class="fontsize13 fontweight550">相談時間のご案内</span>
			    </div>
			
			    <div class="info-item">
			        <span class="fontsize11 fontweight550">海外/国内旅行および航空相談</span><br>
			        <span class="fontsize11">平日 09:00 ～ 18:00（土・日曜日および祝日休業）</span>
			    </div>
			
			    <div class="info-item">
			        <span class="fontsize11 fontweight550">航空券は電話相談予約時に、航空運賃とは別に取扱手数料がかかります。</span>
			    </div>
			
			    <div class="info-item">
			        <span class="fontsize11 fontweight550">[航空] システム決済依頼および変更に関するお問い合わせ</span><br>
			        <span class="fontsize11">平日 09:00 ～ 17:00（土・日曜日および祝日休業）</span>
			    </div>
			
			    <div class="info-item">
			        <span class="fontsize11 fontweight550">[航空] 払戻し/キャンセルに関するお問い合わせ</span><br>
			        <span class="fontsize11">マイページ内でオンラインリクエストが常時可能です</span>
			    </div>
			</div>
		</div> <!-- end col-md-3 -->
		
	</div> <!-- end row -->
</div> <!-- end container -->
  
 


<%@ include file="/fragments/footer.jsp"%>