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
				      航空券の予約に関するお問い合わせはどこで行えますか？
				    </button>
				  </h2>
				  <div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
				    <div class="accordion-body">
				     航空券に関しては、1544-5252にお電話後、2番をご選択いただくか、または1544-53530におかけください。
					1544-5252にお電話後、1番はパッケージに関する相談です。
				    </div>
				  </div>
				</div>
				
				<div class="accordion-item">
				  <h2 class="accordion-header" id="headingTwo">
				    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
				       パッケージの日程表に航空便の時間が記載されていませんね？
				    </button>
				  </h2>
				  <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
				    <div class="accordion-body">
				     追加の日程については、パッケージ予約後にカスタマーサポートにお問い合わせください。
				    </div>
				  </div>
				</div>
				
				<div class="accordion-item">
				  <h2 class="accordion-header" id="headingThree">
				    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
				     現在、パッケージ商品の予約は可能ですか？
				    </button>
				  </h2>
				  <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
				    <div class="accordion-body">
				      現在、予約は可能です。お問い合わせはカスタマーサポートまでご連絡ください。
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