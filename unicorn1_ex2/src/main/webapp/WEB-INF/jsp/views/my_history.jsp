<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
   <%@ include file="/WEB-INF/include/include-header-template.jspf" %>  
   <%@ include file="/WEB-INF/include/include-header-script.jspf" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Profile History | Unify - Responsive Website Template</title>

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
    <link rel="stylesheet" href="assets/css/pages/shortcode_timeline2.css">

    <!-- CSS Customization -->
    <link rel="stylesheet" href="assets/css/custom.css">
    <style type="text/css">
    .modal {
}
.vertical-alignment-helper {
    display:table;
    height: 100%;
    width: 100%;
}
.vertical-align-center {
    /* To center vertically */
    display: table-cell;
    vertical-align: middle;
}
.modal-content {
    /* Bootstrap sets the size of the modal in the modal-dialog class, we need to inherit it */
    width:inherit;
    height:inherit;
    /* To center horizontally */
    margin: 0 auto;
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
                <div class="profile-body">
                                    <!--Basic Table Option (Spacing)-->
                <div class="panel panel-red margin-bottom-40">
                    <div class="panel-heading">
                        <h3 class="panel-title"><i class="fa fa-user"></i> 구매목록</h3>
                    </div>
                    <div class="panel-body">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>주문일자</th>
                                    <th width="300px">상품정보</th>
                                    <th>수량</th>
                                    <th>금액</th>
                                    <th>결제 총 금액</th>
                                    <th>주문처리상태</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:if test="${not empty list2 }">
                            <c:set var="start" value="${(pageNum-1) * 5}"/>
                            <c:set var="end" value="${(pageNum-1) * 5 + 4}"/>
                            <c:forEach var="c" items="${list2}" begin="${start }" end="${end }">
                               <tr>
                                    <td style="text-align: center; vertical-align: middle; font-size: 15px;">
                                       <fmt:parseDate value="${c.pur_created}" var="date" pattern="yyyy-MM-dd HH:mm:ss"></fmt:parseDate>
                                       <fmt:formatDate value="${date}" pattern="yyyy-MM-dd HH:mm"/>
                                    </td>
                                    <td style="vertical-align: middle;">   
                                    <c:forEach var="s" items="${list1}">
                                       <c:if test="${c.pur_gnum eq s.pur_gnum}">
                                          <img src="${s.p_img}" style="width: 60px; height: 60px; margin-top: 10px;">
                                          <c:if test="${fn:length(s.p_name) >25 }">
                                    ${fn:substring(s.p_name,0,25)}..
                                           </c:if>
                                           <c:if test="${fn:length(s.p_name) <26 }">
                                               ${s.p_name}
                                           </c:if><br>
                                       </c:if>
                                    </c:forEach>
                                    </td>
                                    
                                    <td style="vertical-align: middle; text-align: center;">
                                    <div style="margin-top: 55px;">
                                    <c:forEach var="s" items="${list1}">
                                       <c:if test="${c.pur_gnum eq s.pur_gnum}">
                                          ${s.pur_cnt}<br><br><br><br>
                                       </c:if>
                                    </c:forEach>
                                    </div>
                                    </td>
                                    
                                    <td style="vertical-align: middle; text-align: center;">
                                    <div style="margin-top: 55px;">
                                    <c:forEach var="s" items="${list1}">
                                       <c:if test="${c.pur_gnum eq s.pur_gnum}">
                                          <fmt:formatNumber value="${s.p_price}" pattern="#,###"/>원<br><br><br><br>
                                       </c:if>
                                    </c:forEach>
                                    </div>
                                    </td>
                                    
                                    <td style="text-align: center; vertical-align: middle">
                                    <c:set var="a" value="0"></c:set>
                                    <c:forEach var="s" items="${list1}">
                                       <c:if test="${c.pur_gnum eq s.pur_gnum}">
                                          <c:set var="a" value="${a + s.p_price*s.pur_cnt}"></c:set>
                                       </c:if>
                                    </c:forEach>
                                    <fmt:formatNumber value="${a-a/100*c.pur_c_discount-c.pur_point}" pattern="#,###"/>원
                                    </td>
                                    
                                    <td style="text-align: center; vertical-align: middle" >
                                       <button class="btn"> 배송상태확인</button>
                                    </td>
                                    <input type="hidden" name="gnum" value="${c.pur_gnum}">
                                </tr>
                            </c:forEach>
                            </c:if>
                            <c:if test="${empty list2 }">
                               <tr>
                                  <td>구매 목록이 없습니다.</td>
                               </tr>
                            </c:if>
                            </tbody>
                        </table>
                    </div>                      
                </div>
                <!--End Basic Table-->
                </div>
               <!-- pagination -->
               <div class="text-center">
                    <ul class="pagination pagination-v2">
                        <li class="active"><a href="#this" onclick="funcPage('1')" id="1">1</a></li>
                        <c:if test="${list2 != null && fn:length(list2) > 0 }">
                           <c:if test="${fn:length(list2) % 5 == 0}">
                              <c:set value="${fn:length(list2) / 5 }" var="pagesu"/>
                              <fmt:formatNumber value="${pagesu}" pattern="0" var="realpagesu"/>
                           </c:if>
                           <c:if test="${fn:length(list2) % 5 != 0}">
                              <c:if test="${fn:length(list2) % 5 < 1 }">
                              	<c:set value="${fn:length(list2) / 5 + 1}" var="pagesu"/>
                              	<fmt:formatNumber value="${pagesu}" pattern="0" var="realpagesu"/>
                              </c:if>
                              
                              <c:if test="${fn:length(list2) % 5 > 1 }">
                              	<c:set value="${fn:length(list2) / 5}" var="pagesu"/>
                              	<fmt:formatNumber value="${pagesu}" pattern="0" var="realpagesu"/>
                              </c:if>
                           </c:if>
                           <c:forEach var="i" begin="2" end="${realpagesu}">
                              <li><a href="#this" onclick="funcPage('${i}')" id="${i}">${i}</a></li>
                           </c:forEach>
                        </c:if>
                    </ul>                                                            
                </div>
                <!--/end pagination-->
            </div>
            <!-- End Profile Content -->
        </div>
    </div><!--/container-->    
    <!--=== End Profile ===-->
    <%@ include file="/WEB-INF/include/include-footer-template.jspf" %>
</div><!--/wrapper-->

<!-- 모달창 -->
   <div class="modal fade" tabindex="-1" role="dialog"   aria-labelledby="myModalLabel" aria-hidden="true">
      <!-- 
      <div class="modal-dialog modal-lg">
         <div class="modal-content"> 
            <div class="modal-header">
               <button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>
               <h4 id="myLargeModalLabel2" class="modal-title">Large Modal</h4>
            </div>
            <div class="modal-body ">
               <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                  Praesent nec mattis odio. In hac habitasse platea dictumst.
                  Vestibulum volutpat pretium porta. Cras mattis metus non ipsum
                  porttitor pulvinar. Proin tempus erat ac neque gravida suscipit.
                  Morbi faucibus turpis a turpis hendrerit sodales sed vel nisl.
                  Praesent vitae magna luctus, blandit quam eu, semper mi.</p>
            </div>
         </div>
      </div>
       -->
   </div>

   <!-- JS Global Compulsory -->           
<script type="text/javascript" src="assets/plugins/jquery/jquery.min.js"></script>
<script type="text/javascript" src="assets/plugins/jquery/jquery-migrate.min.js"></script>
<script type="text/javascript" src="assets/plugins/bootstrap/js/bootstrap.min.js"></script> 
<!-- JS Implementing Plugins -->
<script type="text/javascript" src="assets/plugins/back-to-top.js"></script>
<script type="text/javascript" src="assets/plugins/smoothScroll.js"></script>
<script type="text/javascript" src="assets/plugins/counter/waypoints.min.js"></script>
<script type="text/javascript" src="assets/plugins/counter/jquery.counterup.min.js"></script> 
<script type="text/javascript" src="assets/plugins/sky-forms-pro/skyforms/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="assets/plugins/scrollbar/js/jquery.mCustomScrollbar.concat.min.js"></script>
<!-- JS Customization -->
<script type="text/javascript" src="assets/js/custom.js"></script>
<!-- JS Page Level -->           
<script type="text/javascript" src="assets/js/app.js"></script>
<script type="text/javascript" src="assets/js/plugins/datepicker.js"></script>
<script type="text/javascript">
    jQuery(document).ready(function() {
       
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
       comSubmit.setUrl("<c:url value='/my_history.do' />");
       comSubmit.addParam("pageNum", pagenum);
       comSubmit.submit();
      
   }
</script>

<script>

$(".btn").on("click", function(){
   var gnum = $(this).parent().parent().find("input[name=gnum]").val();
   //alert($(this).parent().parent().find("input[name=gnum]").val());
   var url = 'myModal.do?gnum='+gnum
   $('.modal').load(url, function(){
      $('.modal').modal();
   })
         
/*    $('.modal').modal({
      remote: url
   }); */
   
})
</script>
<!--[if lt IE 9]>
    <script src="assets/plugins/respond.js"></script>
    <script src="assets/plugins/html5shiv.js"></script>
    <script src="assets/plugins/placeholder-IE-fixes.js"></script>
<![endif]-->

</body>

</html>