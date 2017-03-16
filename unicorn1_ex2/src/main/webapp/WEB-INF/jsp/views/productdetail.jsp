<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
</head>
<body>
<script type="text/javascript">
function ppp(param){
	alert(param);
}
</script>
<h2 style="text-align: center;">${dto.p_name }</h2>
<div style="text-align: center;"><img src=${dto.p_img }></div>
<div style="text-align: center;">상품명 : ${dto.p_name }</div>
<div style="text-align: center;">금액 : ${dto.p_price }</div>
<div style="text-align: center;">수량 : <input type="number" id="p_stock" max="100" min="1" value="1" class="wdp_38p"></div>
<div style="text-align: center;"><br/>
	<select name="chk">
		<option>선택</option>
<c:forEach var="p" items="${list }">
		<option name="chk">사이즈 - ${p.po_size }  재고량 - ${p.po_stock }</option>
</c:forEach>
	</select>
</div>
<%@ include file="/WEB-INF/include/include-body.jspf" %>
</body>
</html>