<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("euc-kr"); %>
<!DOCTYPE html>
<html lang="ko">
<%@ include file="/WEB-INF/include/include-header-template.jspf" %>    
<%@ include file="/WEB-INF/include/include-header-script.jspf" %>    
<head>
    <title>ADIDAS KOREA | RESISTER</title>

    <!-- CSS Implementing Plugins -->
    <link rel="stylesheet" href="assets/plugins/animate.css">    
    <link rel="stylesheet" href="assets/plugins/line-icons/line-icons.css">
    <link rel="stylesheet" href="assets/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="assets/plugins/scrollbar/css/jquery.mCustomScrollbar.css">
    <link rel="stylesheet" href="assets/plugins/owl-carousel/owl-carousel/owl.carousel.css">
    <link rel="stylesheet" href="assets/plugins/revolution-slider/rs-plugin/css/settings.css">
</head>	
<script type="text/javascript">
$(document).ready(function(){ 
	//id check btn
	$("#idcheckajax").on("click", function(){
		$("#showdata").empty();
		 $.ajax({ 
			type : "get", url : "idcheck.do", dataType : "json", data : {"idcheck" : $("#idcheck").val()},
			success:function(checkid){
				var str = "";
				var result = "";
				var list = checkid.datas;
				$(list).each(function(index, arrData){
					str += arrData["result"];
				})
				
				if(str === "사용하기"){
					result += "<button type='button' class='btn btn-primary' onclick='idok()' id = 'idok'>사용하기</button>" 
				}else{
					result += str
				}
				$("#showdata").append(result)
				
			},
			error: function(request,status,error){
				$("#showdata").append("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error)
			}
		});
		
	});
	//////////////////////////////////////join ok/////////////////////////////////////////////
	$("#joinok").on("click", function(){
		$("#sky-form4").submit();
	});
	
 });
function idok(){
	$("#myModal").modal("hide");
	$("#checkid").val($("#idcheck").val());
	$("#idcheck").val("");
	$("#u_userpassword").focus();
}

</script>
<body class="header-fixed">
<!-- =======================idcheck modal======================= -->
<div class="container">
<!-- 모달 팝업 -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true" >
	  <div class="modal-dialog sm" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
		<h4 class="modal-title" id="myModalLabel">ID중복확인</h4>
	      </div>
	      <div class="modal-body" style="text-align: center">
			<section>
				<label class="input"> 
					<input type="text" name="idcheck" id = "idcheck" placeholder="input id" class="form-control in">
				</label>
	        	<button class="btn-u btn-u-sea" type="button" id = "idcheckajax">idcheck</button>

			</section>
	      </div>
	      <div class="modal-body" id = "showdata" style = "text-align: center">
	      </div>
	      
	    </div>
	  </div>
	</div>

</div>
<!-- =======================idcheck modal======================= -->

<!-- =======================zipcheck modal======================= -->
<div class="container">
<!-- 모달 팝업 -->
	<div class="modal fade" id="zipcheck" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true" >
	  <div class="modal-dialog sm" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
			<h4 class="modal-title" id="myModalLabel">우편번호 검색</h4>
	      </div>
	      <div class="modal-body"style="text-align: center">
			<section>
				<label class="input"> 
					<input type="text" name="area3" id = "area3" placeholder="동이름을 적어주세요" class="form-control">
				</label>
	        	<button class="btn-u btn-u-sea" type="button" id = "zipsearch">검색</button>
			</section>
	      </div>
	      <div class="modal-body" id = "zipshowdata" style = "text-align: center" >
	      </div>
	      
	    </div>
	  </div>
	</div>

</div>
<!-- =======================zipcheck modal======================= -->

	<div class="wrapper">

		<!--=== Breadcrumbs v4 ===-->
		<div class="breadcrumbs-v4">
			<div class="container">
				<span class="page-name">Log In</span>
				<h1>
					Maecenas <span class="shop-green">enim</span> sapien
				</h1>
				
				<ul class="breadcrumb-v4-in">
					<li><a href="index.html">Home</a></li>
					<li><a href="">Product</a></li>
					<li class="active">Log In</li>
				</ul>
			</div>
			<!--/end container-->
		</div>
		<!--=== End Breadcrumbs v4 ===-->

		<!--=== Registre ===-->
		<div class="log-reg-v3 content-md margin-bottom-30">
			<div class="container">
				<div class="row">
					<div class="col-md-7 md-margin-bottom-50">
						<h2 class="welcome-title">Welcome to Adidas</h2>
						<p>Suspendisse et tincidunt ipsum, et dignissim urna.
							Vestibulum nisl tortor, gravida at magna et, suscipit vehicula
							massa.</p>
						<br>
						<div class="row margin-bottom-50">
							<div class="col-sm-4 md-margin-bottom-20">
								<div class="site-statistics">
									<span>20,039</span> <small>Products</small>
								</div>
							</div>
							<div class="col-sm-4 md-margin-bottom-20">
								<div class="site-statistics">
									<span>54,283</span> <small>Reviews</small>
								</div>
							</div>
							<div class="col-sm-4">
								<div class="site-statistics">
									<span>376k</span> <small>Sale</small>
								</div>
							</div>
						</div>
						<div class="members-number">
							<h3>
								Join more than <span class="shop-green">13,000</span> members
								worldwide
							</h3>
							<img class="img-responsive" src="assets/img/map.png" alt="">
						</div>
					</div>
<!-- ==========================================join form================================================================== -->
					<div class="col-md-5">
						<form id="sky-form4" name = "sky-form4" class="log-reg-block sky-form" action = "join.do" method = "post">
							<h2>Create New Account</h2>

							<div class="login-input reg-input">
								<section>
									<label class="input">
										<input type="text" name="u_userid" id = "checkid" placeholder="ID" class="form-control" readonly="readonly">
									</label>
										<button class="btn-u btn-u-sea" type="button"  data-target="#myModal" data-toggle="modal">idcheck</button>
								</section>
								<section>
									<label class="input">
										<input type="password" name="u_password" id="u_userpassword" placeholder="password" class="form-control">
									</label>
								</section>
								<section>
									<label class="input">
										<input type="text" name="u_name" placeholder="이름" class="form-control">
									</label>
								</section>
								<section>
									<div class="radio">
									  <label>성별 : </label>
									  <label>
									    <input type="radio" name="u_gender" id="men" value="남" checked>남
									  </label>
									  <label>
									    <input type="radio" name="u_gender" id="women" value="여">여
									  </label>
									</div>
								</section>
								<section>
									<label class="input">
										<input type="text" name="u_jumin" placeholder="주민등록번호" class="form-control">
									</label>
								</section>
								<section>
									<label class="input">
										<input type="text" name="u_phone" placeholder="핸드폰 번호" class="form-control">
									</label>
								</section>
								<section>
									<label class="input">
										<input id="zip" type="text" placeholder="우편 번호" name="u_zipcode" class="form-control">
									</label>
								</section>
								<section>
									<label class="input">
										<input type="text" id="Address" placeholder="기본 주소" name="u_address1" class="form-control">
									</label>
								</section>
								<section>
									<label class="input">
										<input type="text" id="Address2" placeholder="상세 주소" name="u_address2" class="form-control">
									</label>
								</section>
								<section>
									<label class="input">
										<input type="email" name="u_mail" placeholder="이메일" class="form-control">
									</label>
								</section>
							</div>
							<c:set var="adr" value="$(input[name='u_address1']).text()" />
							<button class="btn-u btn-u-sea-shop btn-block margin-bottom-20" type = "button" id = "joinok">확인</button>
							<input type = "hidden" name = "u_address" id = "u_address" value="">
						</form>

						<div class="margin-bottom-20"></div>
						<p class="text-center"> 이미 계정이 있으신가요? 
							<a href="Login.do">로그인</a>
						</p>
					</div>
				</div>
				<!--/end row-->
			</div>
			<!--/end container-->
		</div>
		<!--=== End Registre ===-->
		<%@ include file="/WEB-INF/include/include-footer-template.jspf" %>
		<!--=== End Shop Suvbscribe ===-->
	</div>
	<%@ include file="/WEB-INF/include/include-body.jspf" %>  
<!-- JS Implementing Plugins -->
<script src="assets/plugins/back-to-top.js"></script>
<script src="assets/plugins/smoothScroll.js"></script>
<script src="assets/plugins/jquery.parallax.js"></script>
<script src="assets/plugins/owl-carousel/owl-carousel/owl.carousel.js"></script>
<script src="assets/plugins/scrollbar/js/jquery.mCustomScrollbar.concat.min.js"></script>
<script src="assets/plugins/revolution-slider/rs-plugin/js/jquery.themepunch.tools.min.js"></script>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<script src="assets/plugins/revolution-slider/rs-plugin/js/jquery.themepunch.revolution.min.js"></script>

<!-- JS Page Level -->
<script src="assets/js/shop.app.js"></script>
<script src="assets/js/plugins/owl-carousel.js"></script>
<script src="assets/js/plugins/revolution-slider.js"></script>
<script>
    jQuery(document).ready(function() {
        App.init();
        App.initScrollBar();
        App.initParallaxBg();
        OwlCarousel.initOwlCarousel();
        RevolutionSlider.initRSfullWidth();
});
    
$(function() { $("#zip").postcodifyPopUp({  //zip코드 클릭이벤트
    insertPostcode5 : "#zip",
    insertAddress : "#Address",
	});
});

$(function() { $("#Address").postcodifyPopUp({  //address1 클릭이벤트
    insertPostcode5 : "#zip",
    insertAddress : "#Address",
	});
});
</script>
</body>
</html>