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
				<h4>お知らせ</h4>
			</div>
				<div class="noticeContentList">
					<h6>${list.title }</h6>
					<p class="noticedatefont">${fn:substring(list.created_date, 0, 10)}</p>
				</div>
				<div class="text-break" style="padding: 20px 0 30px;">
					<span style="color: #000000;">
						${list.content }
					</span>
				</div>
				<div class="d-flex justify-content-center">
					<div class="noticebtn text-center d-flex align-items-center justify-content-center" style="cursor: pointer" onclick="location.href='/boards/noticelist.do'"><span style="color: #e5e7eb">一覧で</span></div>
				</div>
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