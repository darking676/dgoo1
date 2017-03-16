<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->  
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->  
<!--[if !IE]><!--> <html lang="ko"> <!--<![endif]-->
<%@ include file="/WEB-INF/include/include-header-template.jspf" %>    
<%@ include file="/WEB-INF/include/include-header-script.jspf" %>   
<head>
    <title></title>


    <!-- CSS Implementing Plugins -->
    <link rel="stylesheet" href="assets/plugins/animate.css">    
    <link rel="stylesheet" href="assets/plugins/line-icons/line-icons.css">
    <link rel="stylesheet" href="assets/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="assets/plugins/jquery-steps/css/custom-jquery.steps.css">
    <link rel="stylesheet" href="assets/plugins/scrollbar/css/jquery.mCustomScrollbar.css">
    
    <link rel="stylesheet" href="assets/plugins/animate.css">
    <link rel="stylesheet" href="assets/plugins/line-icons/line-icons.css">
    <link rel="stylesheet" href="assets/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="assets/plugins/ladda-buttons/css/custom-lada-btn.css">
    <link rel="stylesheet" href="assets/plugins/hover-effects/css/custom-hover-effects.css"> 

</head>	
<body class="header-fixed">
<div class="wrapper">
    <!--=== Breadcrumbs v4 ===-->
    <div class="breadcrumbs-v4">
        <div class="container">
            <span class="page-name">Check out</span>
            <h1><span class="shop-green">adidas</span> WishList</h1> 
            <ul class="breadcrumb-v4-in">
                <li><a href="home.do">홈</a></li>
                <li><a href="productlist.do?p_sex=0,1">상품목록</a></li>
                <li class="active">장바구니</li>
            </ul>
        </div><!--/end container-->
    </div> 
    <!--=== End Breadcrumbs v4 ===-->

    <!--=== Content Medium Part ===-->
    <div class="content-md margin-bottom-30">
        <div class="container">
            <form class="shopping-cart" id="frm">
                <div>
                    <div class="header-tags">            
                        <div class="overflow-h">
                            <h2>장바구니</h2>
                            <p>review &amp; edit your product</p>
                            <i class="rounded-x fa fa-check"></i>
                        </div>    
                    </div>
                    <section>
                        <div class="table-responsive">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>상품</th>
                                        <th>옵션</th> 
                                        <th>가격</th>
                                        <th>수량</th>
                                        <th>소계</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:set var="no" value="0"/>
                                <c:set var="payment" value="0" />
                                <c:forEach var="w" items="${list }" varStatus="status">
                                    <tr>
                                        <td class="product-in-table">
                                            <img class="img-responsive" src="${w.p_img }" alt="">
                                            <div class="product-it-in">
                                                <h3>${w.p_name }</h3>
                                                <span>${w.p_category }</span>
                                            </div>    
                                        </td>
                                        <td>
	                                        <select name="sel" id="sel${no }">
	                                        		<c:if test="${po.po_p_id != w.wish_p_id}">	                    
	                                        			<c:if test="${w.wish_size == 'X' }">
	                                        				<option name="chk">옵션</option>	 	                                        			
	                                        			</c:if>
	                                        		</c:if>
	                                        	<c:forEach var="po" items="${list2 }" begin="0" end="${fn:length(list2) }"> 
		                                        	<c:if test="${po.po_p_id == w.wish_p_id}">
		                                        		<c:if test="${po.po_size == w.wish_size }">
	                                        				<option name="chk" value="${po.po_size }" selected="selected">${po.po_size }</option>	                                         					                                        			
		                                        		</c:if>
		                                        		<c:if test="${po.po_size != w.wish_size }">
	                                        				<option name="chk" value="${po.po_size }">${po.po_size }</option>	                                         					                                        			
		                                        		</c:if>
		                                        	</c:if>
	                                        	</c:forEach>
	                              			</select>
                                        </td>
                                        <td id="price">${w.p_price }</td>
                                        <input type="hidden" id="sub_price" value="${status.current.p_price }">
                                        <td>
                                            <button type='button' class="quantity-button" name='subtract' onclick='javascript: subQty(this);' value='-'>-</button>
                                            <input type='text' class="quantity-field" name='qty' value="${status.current.wish_number }" id="qty${no }" min="1" readonly="readonly"/>
                                            <input type="hidden" name='p_id' value="${w.wish_p_id }" id='p_id${no }'/>
                                            <input type="hidden" value="${w.p_name }" id='p_name${no }'/>
                                            <button type='button' class="quantity-button" name='add' onclick='javascript: addQty(this);' value='+' id="add">+</button>
                                        </td>
                                        <td class="shop-red" id="red${no }">${w.p_price * w.wish_number}</td>
                                        <td>
                                            <button type="button" class="close c2" onclick="fn_go_delete(this)"><span>&times;</span><span class="sr-only">Close</span></button>
                                        	<input type="hidden" id="p_size" value="${w.wish_size }">
                                        </td>
                                    </tr>
                                   	<c:set var="payment" value="${payment + w.p_price * w.wish_number }" />
                                    <c:set var="no" value="${no+1 }"/>
                                </c:forEach>                                   
                                    <input type="hidden" id="sub_total" value="${payment }">
                                </tbody>
                            </table>
                        </div>
                    </section>
                    
                    <div class="header-tags">
                        <div class="overflow-h">
                            <h2>배송지 정보</h2>
                            <p>Shipping Info.</p> 
                            <i class="rounded-x fa fa-home"></i>
                        </div>    
                    </div>
                    <section class="billing-info">
                        <div class="row">
                            <div class="col-md-6 md-margin-bottom-40">                         
                                <h2 class="title-type">청구지 주소</h2>
                                <div class="billing-info-inputs checkbox-list">
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <input id="name" type="text" placeholder="이름(First Name)" name="pur_name" class="form-control required">
                                            <input id="email" type="text" placeholder="이메일(Email)" name="email" class="form-control required email">
                                        </div> 
                                        <div class="col-sm-6">
                                            <input id="surname" type="text" placeholder="성(Last Name)" name="lastname" class="form-control required">
                                            <input id="phone" type="tel" placeholder="전화번호(Phone)" name="phone" class="form-control required">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-6">
                                    <input id="zip" type="text" placeholder="우편번호(Zip Code)" name="zip" class="form-control required"/>  
                                        </div>
                                    </div>
                                    <input id="billingAddress" type="text" placeholder="주소1(Address Line 1)" name="pur_address" class="form-control required" readonly="readonly">
                                    <input id="billingAddress2" type="text" placeholder="주소2(Address Line 2)" name="pur_address" class="form-control required">                                  
	                                    <label class="checkbox text-left" title="" data-placement="" data-content="" data-trigger="" id="chk" style="width: 300px;">
	                                    <input type="checkbox" name="checkbox"/>            
	                                        <i></i>
	                                       	 배송정보가 청구지주소와 동일합니다.                                                                           
	                                    </label>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <h2 class="title-type">배송주소</h2>
                                <div class="billing-info-inputs checkbox-list">
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <input id="name2" type="text" placeholder="이름(First Name)" name="d_name12" class="form-control">
                                            <input id="email2" type="text" placeholder="이메일(Email)" name="email" class="form-control email">
                                        </div>
                                        <div class="col-sm-6">
                                            <input id="surname2" type="text" placeholder="성(Last Name)" name="d_name12" class="form-control">
                                            <input id="phone2" type="tel" placeholder="전화번호(Phone)" name="d_phone" class="form-control">
                                        </div>
                                    </div>
                                    <div class="row">            
                                        <div class="col-sm-6">
                                            <input id="zip2" type="text" placeholder="우편번호(Zip Code)" name="zip" class="form-control" onclose="javascript:$('#zip2').focus()">
                                        </div>
                                    </div>
                                    <input id="shippingAddress" type="text" placeholder="주소1(Address Line 1)" name="d_address" class="form-control">
                                    <input id="shippingAddress2" type="text" placeholder="주소2(Address Line 2)" name="d_address" class="form-control">
                                    <input id="memo" type="text" placeholder="메모(Memo)" name="d_memo" class="form-control">
                                </div>
                            </div>
                        </div>       
                    </section>
                        
                    <div class="header-tags">
                        <div class="overflow-h">
                            <h2>결제</h2>
                            <p>Payment</p>
                            <i class="rounded-x fa fa-credit-card"></i>
                        </div>    
                    </div>
                    <section>
                        <div class="row">
                            <div class="col-md-6 md-margin-bottom-50">
                                <h2 class="title-type">#결제방식</h2>
                                <!-- Accordion -->
                                <div class="accordion-v2">
                                    <div class="panel-group" id="accordion">
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
                                                        <i class="fa fa-credit-card"></i>
                                                                  신용 or 체크 카드
                                                    </a>
                                                </h4>
                                            </div>
                                            <div id="collapseOne" class="panel-collapse collapse in">
                                                <div class="panel-body cus-form-horizontal">
                                                    <div class="form-group">
                                                        <label class="col-sm-4 no-col-space control-label">카드소지자 이름</label>
                                                        <div class="col-sm-8">
                                                            <input type="text" class="form-control required" name="cardholder" placeholder="">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-sm-4 no-col-space control-label">카드 번호</label>
                                                        <div class="col-sm-8">
                                                            <input type="text" class="form-control required" name="cardnumber" placeholder="">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-sm-4 no-col-space control-label">결제방법</label>
                                                        <div class="col-sm-8">
                                                            <ul class="list-inline payment-type">
                                                                <li><i class="fa fa-cc-paypal"></i></li>
                                                                <li><i class="fa fa-cc-visa"></i></li>
                                                                <li><i class="fa fa-cc-mastercard"></i></li>
                                                                <li><i class="fa fa-cc-discover"></i></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-sm-4">만료일</label>
                                                        <div class="col-sm-8 input-small-field">
                                                            <input type="text" name="mm" placeholder="MM" class="form-control required sm-margin-bottom-20">
                                                            <span class="slash">/</span>
                                                            <input type="text" name="yy" placeholder="YY" class="form-control required">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-sm-4 no-col-space control-label">CVC</label>
                                                        <div class="col-sm-8 input-small-field" title="" data-placement="" data-content="" data-trigger="" id="chk2" style="width: 80px;">
                                                            <input type="text" name="number" placeholder="" class="form-control required" id="wit" style="width: 60px;">
                                                        </div> 
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">
                                                        <i class="fa fa-paypal"></i>
                                                        Pay with PayPal
                                                    </a>
                                                </h4>
                                            </div>
                                            <div id="collapseTwo" class="panel-collapse collapse">
                                                <div class="content margin-left-10">
                                                    <a href="#"><img src="https://www.paypalobjects.com/webstatic/en_US/i/buttons/PP_logo_h_150x38.png" alt="PayPal"></a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- End Accordion -->    
                            </div>

                            <div class="col-md-6">
                                <h2 class="title-type">#자주 묻는 질문</h2>
                                <!-- Accordion -->
                                <div class="accordion-v2 plus-toggle">
                                    <div class="panel-group" id="accordion-v2">
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a data-toggle="collapse" data-parent="#accordion-v2" href="#collapseOne-v2">
                                                        결제방식은 어떤게있나요?
                                                    </a>
                                                </h4>
                                            </div>
                                            <div id="collapseOne-v2" class="panel-collapse collapse in">
                                                <div class="panel-body">
                                                    저희 사이트는 신용 or 체크카드 결제만 가능합니다.
                                                </div>
                                            </div>
                                        </div>
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a data-toggle="collapse" data-parent="#accordion-v2" href="#collapseTwo-v2">
                                                        할인종류는 어떤게있나요?
                                                    </a>
                                                </h4>
                                            </div>
                                            <div id="collapseTwo-v2" class="panel-collapse collapse">
                                                <div class="panel-body">
                                                    할인은 사이트내에서 제공하는 쿠폰사용이나 포인트 차감이 있습니다. 쿠폰은 각종 이벤트로 지급 받으실 수 있고 포인트 경우 구매금액의 4%가 적립됩니다.    
                                                </div>
                                            </div>
                                        </div>
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a data-toggle="collapse" data-parent="#accordion-v2" href="#collapseThree-v2">
                                                        결제 영수증은 어디서 확인하나요?
                                                    </a>
                                                </h4>
                                            </div>
                                            <div id="collapseThree-v2" class="panel-collapse collapse">
                                                <div class="panel-body">
                                                    결제완료 후 영수증 페이지가 나옵니다. 페이지 우측하단에 프린트를 누르시면 프린트도 가능합니다.    
                                                </div>
                                            </div>
                                        </div>
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a data-toggle="collapse" data-parent="#accordion-v2" href="#collapseFour-v2">
                                                        배송기간은 어느정도 걸리나요?
                                                    </a>
                                                </h4>
                                            </div>
                                            <div id="collapseFour-v2" class="panel-collapse collapse">
                                                <div class="panel-body">
                                                    국내인 경우 산간지역 제외. 수도권 1~2일, 평균 2~3일 정도 소요됩니다.    
                                                </div>
                                            </div>
                                        </div>    
                                    </div>
                                </div>
                                <!-- End Accordion -->    
                            </div>
                        </div>
                    </section>

                    <div class="coupon-code">
                        <div class="row">
                            <div class="col-sm-4 sm-margin-bottom-30">
                                <h3>할인 코드</h3>
                                <p>쿠폰번호를 입력하세요</p>
                                <input class="form-control margin-bottom-10" name="c_bun" type="text">
                                <button type="button" id="btn1" class="btn-u btn-u-sea-shop" onclick="javascript:configCoupon(this);">쿠폰 등록</button>
                                <c:set var="cou" value="1" />
                                <c:forEach var="coupon" items="${list3 }">
	                                <input name="coupon" type="hidden" value="${coupon.c_bun }" id="coupon${cou }">
	                                <input name="couponV" type="hidden" value="${coupon.c_discount }" id="discount${cou }">
	                                <input name="couNum" type="hidden" id="${cou }">
	                                <c:set var="cou" value="${cou+1 }"/>
                                </c:forEach>
                                <h5 id="couName" style="color: red;"></h5>
                            </div>
                            <div class="col-sm-4 sm-margin-bottom-30">
                                <h3>포인트</h3>
                                <p id="pointView"></p>
                                <input class="form-control margin-bottom-10" name="px" type="text">
                                <button type="button" id="btn2" class="btn-u btn-u-sea-shop" onclick="javascript:configPoint(this);">포인트 사용</button>
                            	<input type="hidden" id="point" value="${point.u_point }">
                            	<h5 id="pointMsg" style="color: red;"></h5>
                            </div>
                            <div class="col-sm-3 col-sm-offset-1">
                                <ul class="list-inline total-result">
                                    <li>
                                        <h4>결제예정금액:</h4>
                                        <div class="total-result-in">
                                            <span id="total-rs">${payment }</span>
                                        </div>    
                                    </li>    
                                    <li>
                                        <h4>할인금액:</h4>
                                        <div class="total-result-in">
                                            <span class="text-right">- - - -</span>
                                        </div>
                                    </li>
                                    <li>
                                        <h4>배송비:</h4>
                                        <div class="total-result-in">
                                            <span class="text-right11">0</span>
                                        </div>
                                    </li>
                                    <li class="divider"></li>
                                    <li class="total-price">
                                        <h4>총결제금액:</h4> 
                                        <div class="total-result-in">
                                            <span id="total-rs2">${payment }</span>
                                            <input type="hidden" value="${payment }">
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>    
                </div>
            </form>
        </div><!--/end container-->
    </div>
    <!--=== End Content Medium Part ===-->     
<%@ include file="/WEB-INF/include/include-footer-template.jspf" %>   
</div><!--/wrapper-->
<%@ include file="/WEB-INF/include/include-body.jspf" %>

<!-- JS Implementing Plugins -->
<script src="assets/plugins/back-to-top.js"></script>
<script src="assets/plugins/smoothScroll.js"></script>
<script src="assets/plugins/jquery-steps/build/jquery.steps.js"></script>
<script src="assets/plugins/scrollbar/js/jquery.mCustomScrollbar.concat.min.js"></script>
<script src="assets/plugins/sky-forms-pro/skyforms/js/jquery.validate.min.js"></script>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>  <!-- 도로명주소 Api -->

<script type="text/javascript" src="assets/plugins/back-to-top.js"></script>
<script type="text/javascript" src="assets/plugins/smoothScroll.js"></script>
<script src="assets/plugins/ladda-buttons/js/spin.min.js"></script>
<script src="assets/plugins/ladda-buttons/js/ladda.min.js"></script>
<script type="text/javascript" src="assets/js/plugins/ladda-buttons.js"></script>

<!-- JS Page Level -->           
<script src="assets/js/shop.app.js"></script>
<script src="assets/js/forms/page_login.js"></script>
<script src="assets/js/plugins/stepWizard.js"></script>
<script src="assets/js/forms/product-quantity.js"></script>
<script>
	var coupon = "NoneCode";  //쿠폰번호
	var discount = ""; //할인율
	var tot = "";   //할인율 적용 가격
	var sub_point = ""; //사용예정 포인트
    jQuery(document).ready(function() {	
        App.init();
        Login.initLogin();
        App.initScrollBar();        
        StepWizard.initStepWizard();
		$("#pointView").text("보유 포인트 : " + $("#point").val());
   		$("#chk").attr("data-placement", "bottom");	//팝업속성 추가
   		$("#chk").attr("title", "경고!"); 
   		$("#chk").attr("data-content", "누락된 정보가 있습니다. 청구지 주소를 채워주세요.");  
   		$("#chk").attr("data-trigger", "focus");
        $("#chk").popover('hide');   //초기화땐 숨겨요
   		//csc 팝업창//
        $("#chk2").attr("data-placement", "right");	//팝업속성 추가
   		$("#chk2").attr("title", "CVC"); 
   		$("#chk2").attr("data-content", "카드뒷면에 적힌 번호 뒤 3자리");  
   		$("#chk2").attr("data-trigger", "focus");
        $("#chk2").popover('hide');   //초기화땐 숨겨요
        ////////////
        $("#total-rs").text(${payment});   //결제금액 
        $("#total-rs2").text(${payment});  //결제금액2 
        $("input:checkbox").on('click', function() {	//체크박스 (빌링 쉽핑 동일할때 빌링정보 쉽핑에 덮기)
        	if($(this).parent().parent().find("#name").val() == "" || $(this).parent().parent().find("#surname").val() == "" || 
        		$(this).parent().parent().find("#email").val() == "" || $(this).parent().parent().find("#phone").val() == "" ||
        		$(this).parent().parent().find("#zip").val() == "" || $(this).parent().parent().find("#billingAddress").val() == "" ||
        		$(this).parent().parent().find("#billingAddress2").val() == ""){ 
        		$(this).prop('checked', false);
		   		$("#chk").popover();  //정보란이 비어있을땐 팝업을 띄워요
        	}else{
	        	if ($(this).prop('checked')) {
	        	  $("#chk").popover('destroy');	 //팝업창 해제
	              $("#name2").val($("#name").val())
	              $("#surname2").val($("#surname").val())
	              $("#email2").val($("#email").val())
	              $("#phone2").val($("#phone").val())
	              $("#zip2").val($("#zip").val())
	              $("#shippingAddress").val($("#billingAddress").val())
	              $("#shippingAddress2").val($("#billingAddress2").val())
	            } else {
	            	 $("#name2").val("")
		             $("#surname2").val("")
		             $("#email2").val("")
		             $("#zip2").val("")
		             $("#shippingAddress").val("")
		             $("#shippingAddress2").val("")
	            }        		
        	}
          });
        $("#wit").on('click', function() {
        	$("#chk2").popover();
        });
        $("#finish").on('click', function() {
        	alert("hi");
        });
});
function fn_go_delete(a){	//위시리스트 삭제
    var comSubmit = new ComSubmit();
      	if(confirm("삭제하시겠습니까?")){
      		comSubmit.setUrl("<c:url value='/wishDelete.do' />");
            comSubmit.addParam("wish_p_id", $(a).parent().parent().find("input[name='p_id']").val());
            comSubmit.addParam("wish_size", $(a).parent().find("#p_size").val());
            comSubmit.submit();
      	}else{
      		return;
      	}
}
function addQty(a){		//수량 +
	var sub_pay = Number($(a).parent().parent().find("#price").text());
	var tot = $(a).parent().parent().parent().find("#sub_total").val();
	$(a).parent().find("#" + $(a).parent().find("input[name='qty']").attr("id")).val(Number($(a).parent().find("#" + $(a).parent().find("input[name='qty']").attr("id")).val()) + 1);
	$(a).parent().parent().find(".shop-red").text(Number($(a).parent().parent().find(".shop-red").text()) + sub_pay);
	$("#total-rs").text(Number($("#total-rs").text()) + sub_pay); 
	$("#total-rs2").text(Number($("#total-rs2").text()) + sub_pay); 
}

function subQty(a){		//수량 -
	if($(a).parent().find("#" + $(a).parent().find("input[name='qty']").attr("id")).val() > 1){
		$(a).parent().find("#" + $(a).parent().find("input[name='qty']").attr("id")).val($(a).parent().find("#" + $(a).parent().find("input[name='qty']").attr("id")).val() - 1);
			var sub_pay = Number($(a).parent().parent().find("#price").text());
			$(a).parent().parent().find(".shop-red").text(Number($(a).parent().parent().find(".shop-red").text()) - sub_pay);
			$("#total-rs").text(Number($("#total-rs").text()) - sub_pay);
			$("#total-rs2").text(Number($("#total-rs2").text()) - sub_pay);
	}
}

String.prototype.replaceAll = function(org, dest) {
    return this.split(org).join(dest);
}

function fn_payment_ok(){
	var p_id = "";
	var p_cnt = "";
	var p_price = "";
	var p_option = "";
	var d_name = "";
	var d_user_name = $("#surname2").val() + $("#name2").val()
	var tot = $("#total-rs2").text(); //차감 후 결제비용
	for (var i = 0; i < ${no}; i++) { 
		p_id += $("#p_id" + i).val() + ",";
		p_cnt += $("#qty" + i).val() + ",";
		p_price += $("#red" + i).text() + ",";	
		p_option += $("#sel" + i).val() + ",";
		d_name += $("#p_name" + i).val().replaceAll("'","\"") + ",";
	}
	if(sub_point != "" || discount != ""){  //값이 존재할때 인트
		Number(sub_point);
		Number(discount);
	}
    var comSubmit = new ComSubmit("frm");
    comSubmit.setUrl("<c:url value='/payment.do' />");
    comSubmit.addParam("pur_price", p_price);
    comSubmit.addParam("pur_p_id", p_id);
    comSubmit.addParam("pur_cnt", p_cnt);
    comSubmit.addParam("pur_po_size", p_option);
    comSubmit.addParam("d_user_name", d_user_name);
    comSubmit.addParam("d_name", d_name);
    comSubmit.addParam("u_point", Number(sub_point));
    comSubmit.addParam("pur_c_bun", String(coupon));
    comSubmit.addParam("c_discount", Number(discount));
    comSubmit.addParam("tot", Number(tot));
    comSubmit.submit();
}
$(function() { $("#zip").postcodifyPopUp({  //zip코드 클릭이벤트
    insertPostcode5 : "#zip",
    insertAddress : "#billingAddress",
	});
});
$(function() { $("#zip2").postcodifyPopUp({  //zip2코드 클릭이벤트
    insertPostcode5 : "#zip2",
    insertAddress : "#shippingAddress",
	});
});
function configCoupon(a){
	var b = false; 
	 for (var i = 1; i <= ${fn:length(list3)}; i++) {
		 if(Number($(a).parent().find("input[name='c_bun']").val().trim()) == Number($(a).parent().find("#coupon"+i).val())){
 			discount = $(a).parent().find("#discount"+i).val()
 			coupon = String($(a).parent().find("#coupon"+i).val())
			tot = $("#total-rs2").text() / 100 * discount		
 			b = true;
 			break;
		}else{
			b = false;
		}
	 } 
		if(b){
			$("#couName").text("쿠폰번호 : " + String(coupon) + " \n" + Number(discount) + "% 쿠폰 적용");
			$("span[class='text-right']").text($("#total-rs2").text() / 100 * discount);
			$("#total-rs2").text((Number($("#total-rs2").text())) - (Number($("#total-rs2").text() / 100 * discount)));
			$("#btn1").attr("onclick", "");
			$("#btn1").attr("style", "background-color: gray;");
			$("input[name='c_bun']").attr("readonly", "readonly");
			if(sub_point == "") $("span[class='text-right']").text(tot);
			else $("span[class='text-right']").text(tot + sub_point);
			return;
		}else {
			$("#couName").text("일치하는 쿠폰이 없습니다.");
			$(a).parent().find("input[name='c_bun']").focus();
		}
}

function configPoint(a){  
	var discount = "";
		if(confirm("포인트를 사용하시겠습니까?")){
			if(Number($(a).parent().find("input[name='px']").val()) <= Number($("#total-rs2").text())){
			if(Number($("#point").val() < sub_point)){
				$("#pointMsg").text("보유 포인트보다 숫자가 큽니다.");
				$(a).parent().find("input[name='u_point1']").focus();
				return;
			}
		sub_point = Number($(a).parent().find("input[name='px']").val());
		$("#total-rs2").text(Number($("#total-rs2").text()) - sub_point);
		$("#btn2").attr("onclick", "");
		$("#btn2").attr("style", "background-color: gray;");
		$("input[name='u_point1']").attr("readonly", "readonly");	
		$("#pointView").text("보유 포인트 : " + Number($("#point").val() - sub_point));
		$("#pointMsg").text(sub_point + "point 사용");
		if(tot == "") $("span[class='text-right']").text(sub_point);
		else $("span[class='text-right']").text(tot + sub_point);
			}else{
				$("#pointMsg").text("결제 금액보다 많은 숫자입니다.");
			}
		}else{
			return;
		}
}

function funcLoading(){

}

</script>

<!--[if lt IE 9]>
    <script src="assets/plugins/respond.js"></script>
    <script src="assets/plugins/html5shiv.js"></script>
    <script src="assets/plugins/sky-forms-pro/skyforms/js/sky-forms-ie8.js"></script>
<![endif]-->
<!--[if lt IE 10]>
    <script src="assets/plugins/sky-forms-pro/skyforms/js/jquery.placeholder.min.js"></script>
<![endif]-->

</body>
</html> 