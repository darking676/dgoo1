<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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

    <!-- CSS Page Style -->    
    <link rel="stylesheet" href="assets/css/pages/page_invoice.css">
</head> 

<body>    

<div class="wrapper">
    <!--=== Breadcrumbs ===-->
    <div class="breadcrumbs">
    	<div class="container">
            <h1 class="pull-left">결제내역</h1> 
            <ul class="pull-right breadcrumb">
                <li><a href="home.do">홈</a></li>
                <li class="active">결제내역</li> 
            </ul>
        </div><!--/container-->
    </div><!--/breadcrumbs-->
    <!--=== End Breadcrumbs ===-->

    <!--=== Content Part ===-->
    <div class="container content">
        <!--Invoice Header-->
        <div class="row invoice-header">
            <div class="col-xs-6">
                <img src="assets/img/adidas.png" alt="">
                <!-- You also can use a title instead of image
                <h2 class="pull-left">Product Invoice</h2>
                -->
            </div>
            <div class="col-xs-6 invoice-numb">
            </div>
        </div>
        <!--End Invoice Header-->

        <!--Invoice Detials-->
        <div class="row invoice-info">
            <div class="col-xs-6">
                <div class="tag-box tag-box-v3">
                    <h2>고객 정보:</h2>
                    <ul class="list-unstyled">
                        <li><strong>Full Name:</strong> ${list[0].u_name }</li>
                        <li><strong>Phone:</strong> ${list[0].u_phone }</li>
                        <li><strong>Email:</strong><a href="mailto:${list[0].u_mail}"> ${list[0].u_mail }</a></li>
                    </ul>
                </div>        
            </div>
            <div class="col-xs-6">
                <div class="tag-box tag-box-v3">
                    <h2>결제 정보:</h2>        
                    <ul class="list-unstyled">
                        <li><strong>Bank Name:</strong> 신한</li>
                        <li><strong>Account Number:</strong> 123456789012</li>
                        <li><strong>SWIFT Code:</strong> 123DEMO45DEMO</li>
                    </ul>
                </div>
            </div>
        </div>
        <!--End Invoice Detials-->

        <!--Invoice Table-->
        <div class="panel panel-default margin-bottom-40">
            <div class="panel-heading">
                <h3 class="panel-title">#상세내역</h3>
            </div>
            <div class="panel-body">
                <p></p>
            </div>
            <table class="table table-striped invoice-table">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>상품</th>
                        <th>수량</th>
                        <th>가격</th>
                        <th>소계</th>
                    </tr>
                </thead>
                <tbody>
                <c:set var="no" value="1" />
                <c:set var="addTotal" value="" />
                <c:set var="subTotal" value="" />
                <c:forEach var="p" items="${list }">
                    <c:set var="addTotal" value="${addTotal + subTotal}" /> 
                    <tr>
                        <td>${no }</td>
                        <td>${p.d_name }</td>
                        <td>${p.pur_cnt }</td>
                        <td><fmt:formatNumber value="${p.pur_price / p.pur_cnt }" pattern="#,###"/></td>
                        <td><fmt:formatNumber value="${p.pur_price }" pattern="#,###"/></td>
					</tr>
                    <c:set var="no" value="${no + 1 }" />
                    <c:set var="subTotal" value="${p.pur_price}" />
                </c:forEach>
                </tbody>
            </table>
        </div>
        <!--End Invoice Table-->

        <!--Invoice Footer-->
        <div class="row">
            <div class="col-xs-6">
                <div class="tag-box tag-box-v3 no-margin-bottom">
                    <address class="no-margin-bottom">
                    	Name: ${list[0].d_user_name } <br>
                        Address: ${list[0].d_address } <br>
                        Phone: ${list[0].d_phone } <br>
                        Memo: ${list[0].d_memo } 
                    </address>                
                </div>            
            </div>
            <div class="col-xs-6 text-right">
                <ul class="list-unstyled invoice-total-info">
                    <li><strong>결제예정금액:</strong> ￦<fmt:formatNumber value="${addTotal + subTotal }" pattern="#,###"/></li>
                    <li><strong>쿠폰할인:</strong> ${fn:substring(list[0].pur_c_bun,0,2)}%</li>
                    <li><strong>사용포인트:</strong> ￦<fmt:formatNumber value="${list[0].pur_point }" pattern="#,###"/></li>
                    <c:if test="${fn:substring(list[0].pur_c_bun,0,2) == 'No'}">
	                    <li><strong>총결제금액:</strong> ￦<fmt:formatNumber value="${addTotal + subTotal - (addTotal + subTotal) / 100 * 0 - list[0].pur_point}" pattern="#,###"/></li>                
                    </c:if>
                    <c:if test="${fn:substring(list[0].pur_c_bun,0,2) != 'No'}">
	                    <li><strong>총결제금액:</strong> ￦<fmt:formatNumber value="${addTotal + subTotal - (addTotal + subTotal) / 100 * fn:substring(list[0].pur_c_bun,0,2) - list[0].pur_point}" pattern="#,###"/></li>                
                    </c:if>
                </ul>
                <button class="btn-u sm-margin-bottom-10" onclick="javascript:window.print();"><i class="fa fa-print"></i> 프린트</button>            
                <a class="btn-u" href="home.do"><i class="fa fa-home"></i> 홈으로</a>            
            </div>
        </div>
        <!--End Invoice Footer-->
    </div><!--/container-->		
    <!--=== End Content Part ===-->
</div><!--/wrapper-->
<%-- <%@ include file="/WEB-INF/include/include-footer-template.jspf" %>  --%>
<%@ include file="/WEB-INF/include/include-body.jspf" %>
<!-- JS Global Compulsory -->           
<script type="text/javascript" src="assets/plugins/jquery/jquery.min.js"></script>
<script type="text/javascript" src="assets/plugins/jquery/jquery-migrate.min.js"></script>
<script type="text/javascript" src="assets/plugins/bootstrap/js/bootstrap.min.js"></script> 
<!-- JS Implementing Plugins -->           
<script type="text/javascript" src="assets/plugins/back-to-top.js"></script>
<script type="text/javascript" src="assets/plugins/smoothScroll.js"></script>
<!-- JS Customization -->
<script type="text/javascript" src="assets/js/custom.js"></script>
<!-- JS Page Level -->           
<script type="text/javascript" src="assets/js/app.js"></script>
<script type="text/javascript">
    jQuery(document).ready(function() {    	
    	var dtt = Date();
	    $(".invoice-numb").text(dtt.substring(0, 24));  
        App.init();
        });
</script>
<!--[if lt IE 9]>
    <script src="assets/plugins/respond.js"></script>
    <script src="assets/plugins/html5shiv.js"></script>
    <script src="assets/plugins/placeholder-IE-fixes.js"></script>
<![endif]-->

</body>
</html> 