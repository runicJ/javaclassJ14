<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=divice-width, initial-scale=1.0">
	<title>FAQ</title>
	<style>
		.accordion {
		  background-color: #eee;
		  color: #444;
		  cursor: pointer;
		  padding: 18px;
		  width: 100%;
		  border: none;
		  text-align: left;
		  outline: none;
		  font-size: 15px;
		  transition: 0.4s;
		  font-weight:bold;
		}
		
		.active, .accordion:hover {
		  background-color: #ccc;
		}
		
		.accordion:after {
		  content: '\002B';
		  color: #777;
		  font-weight: bold;
		  float: right;
		  margin-left: 5px;
		}
		
		.active:after {
		  content: "\2212";
		}
		
		.panel {
		  padding: 0 18px;
		  background-color: white;
		  max-height: 0;
		  overflow: hidden;
		  transition: max-height 0.2s ease-out;
		}
	</style>
  <%@ include file = "/include/bs4.jsp"%>
</head>
<body>
<%@ include file = "/include/header.jsp"%>
<%@ include file = "/include/nav.jsp"%>
<!-- breadcrumb start-->
<section class="breadcrumb breadcrumb_bg">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb_iner">
                    <div class="breadcrumb_iner_item text-center">
                        <h2>Service</h2>
                        <p>Serene Nest는 항상 당신의 목소리에 귀 기울이겠습니다.</p>
                        <c:if test="${sMid == 'admin'}"><a href="StayInput.st" class="btn_1">숙소 등록하기</a></c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<p><br><p>
<div class="container">
	<div class="text-center">
		<h2 class="mb-4">자주하는 질문 Top</h2>
		<h3 class="mb-2">${!empty sMid ? 'sNickName' : "'guest'"} 님 안녕하세요! 무엇을 알려드릴까요?</h3>
	</div>
	<button class="accordion">나에게 맞는 숙소 찾기</button>
	<div class="panel">
	  <p><br>Serene Nest에서 목적지, 여행 날짜, 게스트 인원수를 입력하여 검색하면, 예약 가능한 숙소만 검색 결과에 표시됩니다.<br>
	  마음에 드는 숙소를 찾았지만, 아직 궁금한 사항이 있나요? 예약 전에 숙소를 방문하는 것은 불가능하지만,<br>
	  호스트에게 연락하여 자세한 내용을 문의하실 수 있습니다. 호스트에게 숙소 내 편의시설이나 숙소가 위치한 동네에 대해 물어보세요.<br><br></p>
	</div>
	<button class="accordion">내 계정 관리</button>
	<div class="panel">
	  <p><br>호스트나 게스트, 에어비앤비에서 회원님께 연락을 취할 수 있으므로 계정 정보를 항상 정확하게 관리하는 것이 중요합니다.<br> 
	  이메일 주소나 전화번호를 수정하려면 로그인한 후 계정으로 이동하세요. 일부 계정 정보는 공개됩니다(예: 프로필 사진 또는 닉네임).<br>
	  단, 정보공개에 동의하지 않았다면 타인에게 정보가 공개되지 않습니다.(관리자는 당신의 정보를 확인할 수 있습니다.)<br><br></p>
	</div>
	<button class="accordion">예약 취소 방법</button>
	<div class="panel">
	  <p><br>체크인 날짜까지 남은 일정이 3일 이내가 아니라면, 예약을 신속하게 취소하실 수 있도록 도와드리겠습니다.<br>
	  계획이 변경되었다면 여행으로 가서 예약을 취소하세요. 취소 절차를 진행하면 환불 금액을 확인하실 수 있습니다.<br>
	  취소 대신 날짜를 변경하는 방법을 고려해 보세요. 호스트에게 변경 요청을 보내세요. 예약 변경으로 인한 차액을 발생할 수 있습니다.<br>
	  변경 요청을 보내는 것과 더불어, 예약 변경 사유를 설명하는 메시지를 호스트에게 보내실 수도 있습니다.<br><br></p>
	</div>
	<button class="accordion">예약상태 확인하기</button>
	<div class="panel">
	  <p><br>예약하는 즉시 숙소의 경우, 예약이 자동으로 확정됩니다. 호스트에게 예약 관련 질문이나 메시지를 보낸 경우,<br>
	  해당 호스트는 24시간 내에 응답해야 합니다. 호스트가 거절하거나 응답하지 않아도 걱정하지 마세요.<br>
	  요금이 청구되지 않으며 수많은 숙소가 당신을 기다리고 있습니다. 계정정보를 최신 상태로 유지하세요.<br>
	  결제 정보가 유효하고 본인 인증(일부 호스트 요구사항)이 완료된 상태여야 합니다.<br><br></p>
	</div>
	<button class="accordion">계정 탈퇴하기</button>
	<div class="panel">
	  <p><br>계정을 영구적으로 해지 및 삭제하려면, 보안상의 목적으로 본인 여부를 확인한 후에만 삭제 요청을 처리합니다.<br>
	  요청이 처리되면 Serene Nest가 보유하고 있는 사용자의 모든 개인정보가 영구적으로 삭제됩니다.<br>
	  단, 개인정보 처리방침에 명시된 것과 같이 법적으로 보관이 필수이거나 허용된 일부 정보는 제외됩니다.<br>
	  또한 작성하신 게시글이나 댓글의 경우 자동으로 삭제되지 않으며, 직접 삭제 후에 계정을 탈퇴하셔야 합니다.<br>
	  계정이 삭제된 후에는 재활성화하거나, 데이터를 복구하거나, 계정에 접속할 수 없습니다.<br>
	  Serene Nest를 다시 이용하려면 새 계정을 만드셔야 합니다.<br><br></p>
	</div>
</div>
<p><br/></p>
<script>
	var acc = document.getElementsByClassName("accordion");
	var i;
	
	for (i = 0; i < acc.length; i++) {
	  acc[i].addEventListener("click", function() {
	    this.classList.toggle("active");
	    var panel = this.nextElementSibling;
	    if (panel.style.maxHeight) {
	      panel.style.maxHeight = null;
	    } else {
	      panel.style.maxHeight = panel.scrollHeight + "px";
	    } 
	  });
	}
</script>
<%@ include file = "/include/footer.jsp"%>
</body>
</html>