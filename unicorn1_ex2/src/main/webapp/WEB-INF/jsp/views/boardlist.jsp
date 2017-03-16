<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>아디다스 공식 온라인 쇼핑몰</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/include/include-header-template.jspf" %>    
<%@ include file="/WEB-INF/include/include-header-script.jspf" %>
<link rel="stylesheet" href="assets/plugins/animate.css">    
<link rel="stylesheet" href="assets/plugins/line-icons/line-icons.css">
<link rel="stylesheet" href="assets/plugins/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="assets/plugins/scrollbar/css/jquery.mCustomScrollbar.css">
<style type="text/css">
@media screen and (max-width:1000px) {
	table.board_list {
		overflow: hidden;
	}
}
table.board_list {
    border-collapse: collapse;
    text-align: left;
    line-height: 1.5;
    border: 1px solid #ccc;
    margin: 20px 10px;
}
table.board_list thead {
    border-right: 1px solid #ccc;
    border-left: 1px solid #ccc;
    background: #000000;
}
table.board_list thead th {
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    color: #fff;
}
table.board_list tbody th {
    width: 150px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    background: #fcf1f4;
}
table.board_list td {
    width: 350px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}
</style>  
</head>
<body>
<div class="container">
<table style="margin: auto; width: 100%; ">
<tbody>
<tr>
<td>
<a href="#this" class="btn" id="write" style="text-align: left;">문의하기</a>
<a href="BoardList.do" class="btn" id="latest" style="text-align: left;">최신으로</a>
</td>
<td style="text-align: right;">
<input type="text" name="searchvalue"><button onclick="board_search()">검색</button>
</td>
</tr>
</tbody>
</table>
<div id="content">
<table class="board_list" style="width: 100%; margin: auto;">
    <colgroup>
        <col width="10%"/>
        <col width="*"/>
        <col width="15%"/>
        <col width="10%"/>
        <col width="20%"/>
    </colgroup>
    <thead>
        <tr>
            <th scope="col">글번호</th>
            <th scope="col">제목</th>
            <th scope="col">작성자</th>
            <th scope="col">조회수</th>
            <th scope="col">작성일</th>
        </tr>
    </thead>
    <tbody>
        <c:choose>
            <c:when test="${f:length(list) > 0}">
            <c:set var="start" value="${(pageNum-1) * 20}"/>
            <c:set var="end" value="${(pageNum-1) * 20 + 20}"/>
                <c:forEach items="${list }" var="row" begin="${start }" end="${end }">
                    <tr>
                        <td>${row.b_id }</td>
                        <td class="title">
                        <c:if test="${row.b_state == 'Y' }">
                        	<a href="#this" name="title">${row.b_title }</a>&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-check" aria-hidden="true"></i>
                        </c:if>
                        <c:if test="${row.b_state == 'N' }">
                        	<a href="#this" name="title">${row.b_title }</a>
                        </c:if>
                        	<input type="hidden" id="b_id" value="${row.b_id }">
                        	<input type="hidden" id="b_pass" value="${row.b_pass }">
                        	<c:if test="${row.b_pass == 'Y' }">
                        	<img width="25" height="25" src="https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcTDnD8k5LQFAFDg93cxiXkBlXkV8U2DF5Uhs132u2yenqiWN_PyYA9vozg">
                        	</c:if>
                        </td>
                        <td>${row.b_userid }</td>
                        <td>${row.b_hit_cnt }</td>
                        <td>${f:substring(row.b_crea_date , 0, 16)}</td>
                    </tr>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <tr>
                    <td colspan="4">조회된 결과가 없습니다.</td>
                </tr>
            </c:otherwise>
        </c:choose>
    </tbody>
</table>
<br>
        <div class="text-center">
                    <ul class="pagination pagination-v2">
                        <li class="active"><a href="#this" onclick="funcPage('1')" id="1">1</a></li>
                        <c:if test="${list != null && fn:length(list) > 0 }">
                           <c:if test="${fn:length(list) % 20 == 0}">
                              <c:set value="${fn:length(list) / 20 }" var="pagesu"/>
                              <fmt:formatNumber value="${pagesu}" pattern="0" var="realpagesu"/>
                           </c:if>
                           <c:if test="${fn:length(list) % 20 != 0}">
                              <c:if test="${fn:length(list) % 20 < 1 }">
                              	<c:set value="${fn:length(list) / 20 + 1}" var="pagesu"/>
                              	<fmt:formatNumber value="${pagesu}" pattern="0" var="realpagesu"/>
                              </c:if>
                              
                              <c:if test="${fn:length(list) % 20 > 1 }">
                              	<c:set value="${fn:length(list) / 20}" var="pagesu"/>
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
<c:set var="session" value="${userid}" />
<%@ include file="/WEB-INF/include/include-footer-template.jspf" %>
<%@ include file="/WEB-INF/include/include-body.jspf" %>
<script type="text/javascript">
         $(document).ready(function(){
        	 
        	var width = $(window).width();	//976
        	 
        	$("#write").on("click", function(e){
                e.preventDefault();
                fn_BoardWrite();
            }); 
        	$("a[name='title']").on("click", function(e){
                e.preventDefault();
                fn_BoardDetail($(this));
            });
        	
        	if("${param.pageNum}" != "" && "${param.pageNum}" != null){
    			$("a[id='${param.pageNum}']").parent().parent().find($("li[class='active']")).removeClass("active")
    			$("a[id='${param.pageNum}']").parent().addClass("active");
    		}
        });
        
        function fn_BoardWrite(){
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/BoardWrite.do' />");
            comSubmit.submit();
        }
        function fn_BoardDetail(obj){
        	if(obj.parent().find("#b_pass").val() != "N"){
        		var password = prompt("비밀번호 입력");
        		if(password == null){
        			return;
        		}
        		var comSubmit = new ComSubmit();
                comSubmit.setUrl("<c:url value='/BoardDetail.do' />");
                comSubmit.addParam("b_id", obj.parent().find("#b_id").val());
                comSubmit.addParam("b_password", password);
                comSubmit.submit();
        	}else{
        		var comSubmit = new ComSubmit();
                comSubmit.setUrl("<c:url value='/BoardDetail.do' />");
                comSubmit.addParam("b_id", obj.parent().find("#b_id").val());
                comSubmit.submit();
        	}
        }
        function funcPage(pagenum){
    		var comSubmit = new ComSubmit();
    	 	comSubmit.setUrl("<c:url value='/BoardList.do' />");
    	 	comSubmit.addParam("pageNum", pagenum);
    	 	if("${searchValue}" != "" && "${searchValue}" != null){	//검색을 사용했을 경우 파라미터를 보냄
    	 		comSubmit.addParam("b_title", "${searchValue}");
    	 	}
    	 	comSubmit.submit();
    		
    	}
        function board_search(){
        	if($("input[name='searchvalue']").val() != ""){
            	//alert($("input[name='searchvalue']").val());
            	var nameLike =  "%" + $("input[name='searchvalue']").val() + "%";
            	var comSubmit = new ComSubmit();
        	 	comSubmit.setUrl("<c:url value='/BoardList.do' />");
        	 	comSubmit.addParam("b_title", nameLike);
        	 	comSubmit.submit();
        	}else{
        		alert("검색어를 입력하시오");
        	}
        }
        
</script>
</body>
</html>