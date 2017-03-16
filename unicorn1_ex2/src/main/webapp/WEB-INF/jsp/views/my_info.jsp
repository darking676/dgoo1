<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<%@ include file="/WEB-INF/include/include-header-template.jspf" %>  
	<%@ include file="/WEB-INF/include/include-header-script.jspf" %>
<head>
<style type="text/css">
.readonly{
	border:none;
}
.read{
	background-color: white;
}
</style>
<title>Profile Settings | Unify - Responsive Website Template</title>

    <!-- Meta -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Favicon -->
    <link rel="shortcut icon" href="favicon.ico">

    <!-- Web Fonts -->
    <link rel='stylesheet' type='text/css' href='//fonts.googleapis.com/css?family=Open+Sans:400,300,600&amp;subset=cyrillic,latin'>

    <!-- CSS Global Compulsory -->
    <link rel="stylesheet" href="assets/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/style.css">

    <!-- CSS Header and Footer -->
    <link rel="stylesheet" href="assets/css/headers/header-default.css">
    <link rel="stylesheet" href="assets/css/footers/footer-v1.css">

    <!-- CSS Implementing Plugins -->
    <link rel="stylesheet" href="assets/plugins/animate.css">
    <link rel="stylesheet" href="assets/plugins/line-icons/line-icons.css">
    <link rel="stylesheet" href="assets/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="assets/plugins/scrollbar/css/jquery.mCustomScrollbar.css">
    <link rel="stylesheet" href="assets/plugins/sky-forms-pro/skyforms/css/sky-forms.css">
    <link rel="stylesheet" href="assets/plugins/sky-forms-pro/skyforms/custom/custom-sky-forms.css">

    <!-- CSS Page Style -->
    <link rel="stylesheet" href="assets/css/pages/profile.css">

    <!-- CSS Customization -->
    <!-- 
    <link rel="stylesheet" href="assets/css/custom.css">
    <style type="text/css">
    .well {
    min-height: 20px;
    padding: 0px;
    margin-bottom: 20px;
    background-color: #D9D9D9;
    border: 1px solid #D9D9D9;
    border-radius: 0px;
    -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.05);
    box-shadow: inset 0 1px 1px rgba(0,0,0,.05);
    padding-left: 15px;
    border:0px;
}
.thumbnail .caption {
    padding: 9px;
    color: #333;
    padding-left: 0px;
    padding-right: 0px;
}
.icon-style
{
    margin-right:15px;
    font-size:18px;
    margin-top:20px;
}
p
{
    margin:3px;
}
.well-add-card
{
    margin-bottom:10px;
}
.btn-add-card
{
    margin-top:20px;
}
.thumbnail {
    display: block;
    padding: 4px;
    margin-bottom: 20px;
    line-height: 1.42857143;
    background-color: #fff;
    border: 6px solid #D9D9D9;
    border-radius: 15px;
    -webkit-transition: border .2s ease-in-out;
    -o-transition: border .2s ease-in-out;
    transition: border .2s ease-in-out;
    padding-left: 0px;
    padding-right: 0px;
}
.btn
{
    border-radius:0px;
}
.btn-update
{
    margin-left:15px;
}
    </style>
     -->
     <style type="text/css">
     .shape{    
	border-style: solid; border-width: 0 70px 40px 0; float:right; height: 0px; width: 0px;
	-ms-transform:rotate(360deg); /* IE 9 */
	-o-transform: rotate(360deg);  /* Opera 10.5 */
	-webkit-transform:rotate(360deg); /* Safari and Chrome */
	transform:rotate(360deg);
}
.offer{
	background:#fff; border:1px solid #ddd; box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2); margin: 15px 0; overflow:hidden;
}
.offer:hover {
    -webkit-transform: scale(1.1); 
    -moz-transform: scale(1.1); 
    -ms-transform: scale(1.1); 
    -o-transform: scale(1.1); 
    transform:rotate scale(1.1); 
    -webkit-transition: all 0.4s ease-in-out; 
-moz-transition: all 0.4s ease-in-out; 
-o-transition: all 0.4s ease-in-out;
transition: all 0.4s ease-in-out;
    }
.shape {
	border-color: rgba(255,255,255,0) #d9534f rgba(255,255,255,0) rgba(255,255,255,0);
}
.offer-radius{
	border-radius:7px;
}
.offer-danger {	border-color: #d9534f; }
.offer-danger .shape{
	border-color: transparent #d9534f transparent transparent;
}
.offer-success {	border-color: #5cb85c; }
.offer-success .shape{
	border-color: transparent #5cb85c transparent transparent;
}
.offer-default {	border-color: #999999; }
.offer-default .shape{
	border-color: transparent #999999 transparent transparent;
}
.offer-primary {	border-color: #428bca; }
.offer-primary .shape{
	border-color: transparent #428bca transparent transparent;
}
.offer-info {	border-color: #5bc0de; }
.offer-info .shape{
	border-color: transparent #5bc0de transparent transparent;
}
.offer-warning {	border-color: #f0ad4e; }
.offer-warning .shape{
	border-color: transparent #f0ad4e transparent transparent;
}

.shape-text{
	color:#fff; font-size:12px; font-weight:bold; position:relative; right:-40px; top:2px; white-space: nowrap;
	-ms-transform:rotate(30deg); /* IE 9 */
	-o-transform: rotate(360deg);  /* Opera 10.5 */
	-webkit-transform:rotate(30deg); /* Safari and Chrome */
	transform:rotate(30deg);
}	
.offer-content{
	padding:0 20px 10px;
}
@media (min-width: 487px) {
  .container {
    max-width: 750px;
  }
  .col-sm-6 {
    width: 50%;
  }
}
@media (min-width: 900px) {
  .container {
    max-width: 970px;
  }
  .col-md-4 {
    width: 33.33333333333333%;
  }
}

@media (min-width: 1200px) {
  .container {
    max-width: 1170px;
  }
  .col-lg-3 {
    width: 25%;
  }
}
     </style>
</head> 

<body>    

<div class="wrapper">
	<%@ include file="/WEB-INF/include/include-body.jspf" %>  
    <!--=== Profile ===-->
    <div class="container content profile">   
        <div class="row">
            <!--Left Sidebar-->
            <%@ include file="/WEB-INF/include/include-my-left.jsp" %>
            <!--End Left Sidebar-->

            <!-- Profile Content -->            
            <div class="col-md-9">
                <div class="profile-body margin-bottom-20">
                    <div class="tab-v1">
                        <ul class="nav nav-justified nav-tabs">
                            <li class="active"><a data-toggle="tab" href="#profile">Profile</a></li>
                            <li><a data-toggle="tab" href="#passwordTab">Change Password</a></li>
                        </ul>          
                        <div class="tab-content">
                            <div id="profile" class="profile-edit tab-pane fade in active">
                                <h2 class="heading-md">회원정보를 관리하세요.</h2>
                                <br>
                                <div style="text-align: center; font-size: 30px;">
                                	<a class="cta-title" data-toggle="modal" data-target="#myModal" style="cursor: pointer; color: blue;">쿠폰 보유갯수 : ${myDto.u_coupon_count}장</a>
                                	<b style="margin-left: 100px;">보유 포인트 : ${myDto.u_point}원</b><br><br>
                                </div>
                                <dl class="dl-horizontal">
                                    <dt><strong>ID </strong></dt>
                                    <dd>
                                    <input class="readonly" type="text" name="u_userid" value="${myDto.u_userid}" readonly="readonly">
                                    </dd>
                                    <hr>
                                    <dt><strong>E-mail </strong></dt>
                                    <dd>
                                    <input class="readonly" type="text" name="u_mail" value="${myDto.u_mail}" readonly="readonly">
                                        <span>
                                            <a class="pull-right" href="#this" name="u_mail">
                                                <i class="fa fa-pencil"></i>
                                            </a>
                                        </span>
                                    </dd>
                                    <hr>
                                    <dt><strong>Your name </strong></dt>
                                    <dd>
                                    <input class="readonly" type="text" name="u_name" value="${myDto.u_name}" readonly="readonly">
                                        <span>
                                            <a class="pull-right" href="#this" name="u_name">
                                                <i class="fa fa-pencil"></i>
                                            </a>
                                        </span>
                                    </dd>
                                    <hr>
                                    <dt><strong>Phone Number </strong></dt>
                                    <dd>
                                        <input class="readonly" type="text" name="u_phone" value="${myDto.u_phone}" readonly="readonly">
                                        <span>
                                            <a class="pull-right" href="#this" name="u_phone">
                                                <i class="fa fa-pencil"></i>
                                            </a>
                                        </span>
                                    </dd>
                                    <hr>
                                    <dt><strong>Address </strong></dt>
                                    <dd>
                                    <input class="readonly" type="text" name="u_address" value="${myDto.u_address}" readonly="readonly">
                                        <span>
                                            <a class="pull-right" href="#this" name="u_address">
                                                <i class="fa fa-pencil"></i>
                                            </a>
                                        </span>
                                    </dd>
                                    <hr>
                                </dl>
                                <!-- form -->
                                <input type="hidden" name="name" value="${myDto.u_name}">
                                <input type="hidden" name="address" value="${myDto.u_address}">
                                <input type="hidden" name="phone" value="${myDto.u_phone}">
                                <input type="hidden" name="email" value="${myDto.u_mail}">
                                <!-- ## -->
                                <button type="button" class="btn-u btn-u-default" onclick="resetProfile()">Cancel</button>
                                <button type="button" class="btn-u" onclick="saveProfile()">Save Changes</button>
                            </div>

                            <div id="passwordTab" class="profile-edit tab-pane fade">
                                <h2 class="heading-md">비밀번호 관리</h2>
                                <p>비밀번호를 변경하세요.</p>
                                <br>
                                <form class="sky-form" id="sky-form4" action="#">
                                    <dl class="dl-horizontal">
                                        <dt>현재 Password</dt>
                                        <dd>
                                            <section>
                                                <label class="input">
                                                    <i class="icon-append fa fa-lock"></i>
                                                    <input type="password" placeholder="현재 Password" name="userpassword">
                                                    <b class="tooltip tooltip-bottom-right">Write your password</b>
                                                </label>
                                            </section>
                                        </dd>
                                        <dt>새로운 Password</dt>
                                        <dd>
                                            <section>
                                                <label class="input">
                                                    <i class="icon-append fa fa-lock"></i>
                                                    <input type="password" id="password" name="password" placeholder="Password">
                                                    <b class="tooltip tooltip-bottom-right">Don't forget your password</b>
                                                </label>
                                            </section>
                                        </dd>
                                        <dt>새로운 Password 확인</dt>
                                        <dd>
                                            <section>
                                                <label class="input">
                                                    <i class="icon-append fa fa-lock"></i>
                                                    <input type="password" name="passwordConfirm" placeholder="Confirm password">
                                                    <b class="tooltip tooltip-bottom-right">Don't forget your password</b>
                                                </label>
                                            </section>
                                        </dd>    
                                    </dl>
                                    <button type="reset" class="btn-u btn-u-default">Cancel</button>
                                    <button type="button" class="btn-u" name="btn-u" onclick="fn_updatePassword()">Save Changes</button>
                                </form>    
                            </div>
                        </div>
                    </div>    
                </div>
            </div>
            <!-- End Profile Content -->            
        </div><!--/end row-->
    </div>      
    <!--=== End Profile ===-->
    <%@ include file="/WEB-INF/include/include-footer-template.jspf" %>
</div><!--/wrapper-->

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">쿠폰 목록</h4>
      </div>
      <div class="modal-body">
      <div class="container">
		<div class="col-xs-12 col-sm-9 col-md-7 row col-lg-6">
		<c:if test="${empty my_coupon}">
			<div style="margin: auto; text-align: center;">
				<h4 class="media-heading">
					<strong>보유 쿠폰이 없습니다</strong>
				</h4>
			</div>
		</c:if>
		<c:forEach items="${my_coupon}" var="c">
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-6">
			<div class="offer offer-default">
				<div class="shape">
					<div class="shape-text">
						쿠폰							
					</div>
				</div>
				<div class="offer-content">
					<h3 class="lead">
						${c.c_discount} % 쿠폰
					</h3>
					<p>
						쿠폰번호 : ${c.c_bun}
					</p>
				</div>
			</div>
		</div>
		</c:forEach>
		</div>
		</div>
		
      
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
  </div>

<!-- JS Global Compulsory -->           
<script type="text/javascript" src="assets/plugins/jquery/jquery.min.js"></script>
<script type="text/javascript" src="assets/plugins/jquery/jquery-migrate.min.js"></script>
<script type="text/javascript" src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>
<!-- JS Implementing Plugins -->
<script type="text/javascript" src="assets/plugins/back-to-top.js"></script>
<script type="text/javascript" src="assets/plugins/smoothScroll.js"></script>
<script type="text/javascript" src="assets/plugins/sky-forms-pro/skyforms/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="assets/plugins/sky-forms-pro/skyforms/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="assets/plugins/sky-forms-pro/skyforms/js/jquery.maskedinput.min.js"></script>
<script type="text/javascript" src="assets/plugins/scrollbar/js/jquery.mCustomScrollbar.concat.min.js"></script>
<!-- JS Customization -->
<script type="text/javascript" src="assets/js/custom.js"></script>
<!-- JS Page Level -->           
<script type="text/javascript" src="assets/js/app.js"></script>

<script type="text/javascript">
    jQuery(document).ready(function() {
        App.init();
        App.initScrollBar();
        
        
        $("a[name='u_address']").on("click", function(e){
        	e.preventDefault();
        	fn_updateAddress(this.name);
        });
        $("a[name='u_name']").on("click", function(e){
        	e.preventDefault();
        	fn_updateName(this.name);
        });
        $("a[name='u_mail']").on("click", function(e){
        	e.preventDefault();
        	fn_updateMail(this.name);
        });
        $("a[name='u_phone']").on("click", function(e){
        	e.preventDefault();
        	fn_updatePhone(this.name);
        });
        
    });
    function fn_updateMail(a){
    	$("input[name='"+a+"']").removeAttr("readonly");
    	$("input[name='"+a+"']").removeClass("readonly");
    	$("input[name='"+a+"']").addClass("read");
    }
    function fn_updatePhone(a){
    	$("input[name='"+a+"']").removeAttr("readonly");
    	$("input[name='"+a+"']").removeClass("readonly");
    	$("input[name='"+a+"']").addClass("read");
    }

    function fn_updateName(a){
    	$("input[name='"+a+"']").removeAttr("readonly");
    	$("input[name='"+a+"']").removeClass("readonly");
    	$("input[name='"+a+"']").addClass("read");
    }
    function fn_updateAddress(a){
    	$("input[name='"+a+"']").removeAttr("readonly");
    	$("input[name='"+a+"']").removeClass("readonly");
    	$("input[name='"+a+"']").addClass("read");
    }
    function resetProfile(){
    	$("input[name='u_name']").val($("input[name='name']").val());
    	$("input[name='u_mail']").val($("input[name='email']").val());
    	$("input[name='u_address']").val($("input[name='address']").val());
    	$("input[name='u_phone']").val($("input[name='phone']").val());
    	
    	$("input[name='u_name']").prop("readonly",true);
    	$("input[name='u_mail']").prop("readonly",true);
    	$("input[name='u_address']").prop("readonly",true);
    	$("input[name='u_phone']").prop("readonly",true);
    	
    	$("input[name='u_name']").removeClass("read");
    	$("input[name='u_mail']").removeClass("read");
    	$("input[name='u_address']").removeClass("read");
    	$("input[name='u_phone']").removeClass("read");
    	
    	$("input[name='u_name']").addClass("readonly");
    	$("input[name='u_mail']").addClass("readonly");
    	$("input[name='u_address']").addClass("readonly");
    	$("input[name='u_phone']").addClass("readonly");
    }
    function saveProfile(){
    	var name = "NoneV";
    	var email = "NoneV";
    	var phone = "NoneV";
    	var address = "NoneV";
    	if($("input[name='u_name']").attr("class") == "read"){
    		name = $("input[name='u_name']").val();
    	}
    	if($("input[name='u_mail']").attr("class") == "read"){
    		email = $("input[name='u_mail']").val();
    	}
    	if($("input[name='u_address']").attr("class") == "read"){
    		address = $("input[name='u_address']").val();
    	}
    	if($("input[name='u_phone']").attr("class") == "read"){
    		phone = $("input[name='u_phone']").val();
    	}
    	//alert(name);
    	//alert(email);
    	//alert(address);
    	//alert(phone);
    	var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/updateMyInfo.do' />");
		 	comSubmit.addParam("u_name", name);
		 	comSubmit.addParam("u_mail", email);
		 	comSubmit.addParam("u_phone", phone);
		 	comSubmit.addParam("u_address", address);
		 	comSubmit.submit();
    }
    
    function fn_updatePassword(){
		var userpassword = $("input[name='userpassword']").val();
		var password = $("input[name='password']").val();
		var passwordConfirm = $("input[name='passwordConfirm']").val(); 
		
		if(userpassword == ""){
			alert("현재 Password를 입력해주세요.");
			return;
		}else if(password == ""){
			alert("새로운 Password를 입력해주세요.");
			return;
		}else if(passwordConfirm == ""){
			alert("새로운 Password를 확인해주세요.");
			return;
		}else{
			if('${myDto.u_password}' != userpassword){
				alert('현재 패스워드가 다릅니다.');
				return;
			}else if(password != passwordConfirm){
				alert('새로운 패스워드가 같지 않습니다.');
				return;
			}else{
				var comSubmit = new ComSubmit();
				comSubmit.setUrl("<c:url value='/updatePassword.do' />");
			 	comSubmit.addParam("u_userid", '${myDto.u_userid}');
			 	comSubmit.addParam("u_password", passwordConfirm);
			 	comSubmit.submit();
			 	alert('비밀번호 변경에 성공하였습니다.');
			}
			return;
		}
    }
</script>
<!--[if lt IE 9]>
    <script src="assets/plugins/respond.js"></script>
    <script src="assets/plugins/html5shiv.js"></script>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <script src="assets/plugins/sky-forms-pro/skyforms/js/sky-forms-ie8.js"></script>
<![endif]-->

<!--[if lt IE 10]>
    <script src="assets/plugins/sky-forms-pro/skyforms/js/jquery.placeholder.min.js"></script>
<![endif]-->

</body>

</html>