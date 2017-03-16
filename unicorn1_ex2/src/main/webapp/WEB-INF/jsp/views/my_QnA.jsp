<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<%@ include file="/WEB-INF/include/include-header-template.jspf" %>  
	<%@ include file="/WEB-INF/include/include-header-script.jspf" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아디다스 공식 온라인 쇼핑몰</title>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
    <link rel="stylesheet" href="assets/css/custom.css">
</head> 

<body>
<div class="wrapper">
<c:set var="now" value="<%=new java.util.Date()%>" />
<fmt:formatDate value="${now}" var="now" pattern="yyyyMMdd" />
<input type="hidden" id="now" value="${now}">
	<%@ include file="/WEB-INF/include/include-body.jspf" %>  
    <!--=== Profile ===-->
    <div class="container content profile">
        <div class="row">
            <!--Left Sidebar-->
            <%@ include file="/WEB-INF/include/include-my-left.jsp" %>
            <!--End Left Sidebar-->

            <!-- Profile Content -->                
            <div class="col-md-9">
                <div class="profile-body">
                    <div class="panel panel-profile">
                        <c:if test="${not empty QnAlist}">
                        <c:set var="start" value="${(pageNum-1) * 5}"/>
                   		<c:set var="end" value="${(pageNum-1) * 5 + 4}"/>
                        	<c:forEach var="q" items="${QnAlist}"  begin="${start }" end="${end }">
                        		<div class="media media-v2 margin-bottom-20">
                                <div class="media-body">
                                    <h4 class="media-heading">
                                        <strong>${q.b_id} . ${q.b_title}</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <small>
                                        <fmt:formatDate value="${q.b_crea_date}" var="b_date" pattern="yyyy-MM-dd hh:mm:ss"/>
                                        ${b_date}
                                        </small>
                                    </h4>
                                    <br>
                                    <p>${q.b_content }</p>
                                    <c:if test="${empty q.rp_content}">
                                    	<div class="media media-v2">
                                        <a class="pull-left" href="#">
                                            <i class="glyphicon glyphicon-arrow-right" style="margin-top: 3px"></i>
                                        </a>
                                        <div class="media-body pull-left">
                                            <p>관리자의 답변이 없습니다.</p>
                                        </div>
                                    	</div>
                                    </c:if>
                                    <c:if test="${not empty q.rp_content}">
	                                    <div class="media media-v2">
                                        <a class="pull-left" href="#">
                                            <i class="glyphicon glyphicon-arrow-right" style="margin-top: 3px"></i>
                                        </a>
                                        <div class="media-body pull-left">
                                            <h4 class="media-heading">
                                                <strong style="color: red;">운영자</strong> 
                                                <small>
                                                <fmt:formatDate value="${q.rp_regdate}" var="rp_date" pattern="yyyy-MM-dd hh:mm"/>
                                                ${rp_date}
                                                ${q.rp_regdate}
                                                </small>
                                            </h4>
                                            <p>${q.rp_content}</p>
                                        </div>
                                    	</div>
                                   </c:if>
                                   <hr>
                                </div>
                            </div><!--/end media media v2-->
                        	</c:forEach>
                        </c:if>
                        <c:if test="${empty QnAlist}">
                        		<div style="margin: auto; text-align: center;">
                                    <h4 class="media-heading">
                                        <strong>등록된 글이 없습니다</strong>
                                    </h4>
                                </div>
                        </c:if>
                        
                        </div>
                    </div>
                    
                    <div class="text-center">
                    <ul class="pagination pagination-v2">
                        <li class="active"><a href="#this" onclick="funcPage('1')" id="1">1</a></li>
                        <c:if test="${QnAlist != null && fn:length(QnAlist) > 0 }">
                           <c:if test="${fn:length(QnAlist) % 5 == 0}">
                              <c:set value="${fn:length(QnAlist) / 5 }" var="pagesu"/>
                              <fmt:formatNumber value="${pagesu}" pattern="0" var="realpagesu"/>
                           </c:if>
                           <c:if test="${fn:length(QnAlist) % 5 != 0}">
                              <c:if test="${fn:length(QnAlist) % 5 < 1 }">
                              	<c:set value="${fn:length(QnAlist) / 5 + 1}" var="pagesu"/>
                              	<fmt:formatNumber value="${pagesu}" pattern="0" var="realpagesu"/>
                              </c:if>
                              
                              <c:if test="${fn:length(QnAlist) % 5 > 1 }">
                              	<c:set value="${fn:length(QnAlist) / 5}" var="pagesu"/>
                              	<fmt:formatNumber value="${pagesu}" pattern="0" var="realpagesu"/>
                              </c:if>
                           </c:if>
                           <c:forEach var="i" begin="2" end="${realpagesu}">
                              <li><a href="#this" onclick="funcPage('${i}')" id="${i}">${i}</a></li>
                           </c:forEach>
                        </c:if>
                    </ul>                                                            
                </div><!--/end pagination-->
                </div>
            </div>
            <!-- End Profile Content -->                
        </div>
    </div>      
    <!--=== End Profile ===-->
    <%@ include file="/WEB-INF/include/include-footer-template.jspf" %>
</div><!--/wrapper-->

<!-- JS Global Compulsory -->           
<script type="text/javascript" src="assets/plugins/jquery/jquery.min.js"></script>
<script type="text/javascript" src="assets/plugins/jquery/jquery-migrate.min.js"></script>
<script type="text/javascript" src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>
<!-- JS Implementing Plugins -->
<script type="text/javascript" src="assets/plugins/back-to-top.js"></script>
<script type="text/javascript" src="assets/plugins/smoothScroll.js"></script>
<script type="text/javascript" src="assets/plugins/circles-master/circles.js"></script>
<script type="text/javascript" src="assets/plugins/sky-forms-pro/skyforms/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="assets/plugins/scrollbar/js/jquery.mCustomScrollbar.concat.min.js"></script>
<!-- JS Customization -->
<script type="text/javascript" src="assets/js/custom.js"></script>
<!-- JS Page Level -->           
<script type="text/javascript" src="assets/js/app.js"></script>
<script type="text/javascript" src="assets/js/plugins/datepicker.js"></script>
<script type="text/javascript" src="assets/js/plugins/circles-master.js"></script>
<script type="text/javascript">
    jQuery(document).ready(function() {
    	
    	//alert($("input[id='now']").val());
		if("${param.pageNum}" != "" && "${param.pageNum}" != null){
			$("a[id='${param.pageNum}']").parent().parent().find($("li[class='active']")).removeClass("active")
			$("a[id='${param.pageNum}']").parent().addClass("active");
		}
    	
        App.init();
        App.initScrollBar();
        Datepicker.initDatepicker();
    });
    function funcPage(pagenum){
		var comSubmit = new ComSubmit();
	 	comSubmit.setUrl("<c:url value='/my_QnA.do' />");
	 	comSubmit.addParam("pageNum", pagenum);
	 	comSubmit.submit();
		
	}
</script>
<!--[if lt IE 9]>
    <script src="assets/plugins/respond.js"></script>
    <script src="assets/plugins/html5shiv.js"></script>
    <script src="assets/plugins/placeholder-IE-fixes.js"></script>
<![endif]-->

</body>

</html>