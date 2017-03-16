<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<jsp:include page="/WEB-INF/include/include-admin-header.jspf" />
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<script type="text/javascript">
$(document).ready(function(){
	
	$(".form-control").on("change", function(){
		//alert(this.id);
		//alert(this.value);
		$.ajax({ 
			type : "get", url : "dstateup.do", dataType : "json", data : {"d_num" : this.id, "d_yn": this.value},
			 success:function(check){
				alert("성공");
				
			},
			error: function(request,status,error){
				alert("실패");
			}
		});
	});
})
</script>
<body>
<div id="wrapper">

    <div id="page-wrapper">

        <div class="container-fluid">
        
        <!-- Page Heading -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">
                    Admin <small>Order Page</small>
                </h1>
            </div>
            
            <div class = "row" id = "r-order">
					<div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-money fa-fw"></i> Order Panel</h3>
                            </div>
                            <div class="panel-body">
                                <div class="table-responsive">
                                <c:if test="${ocount == 0 }">
									새로로운 주문 건이 없습니다.
								</c:if>
								<c:if test="${ocount > 0  }">
                                    <table class="table table-bordered table-hover table-striped">
                                        <thead>
                                            <tr>
                                                <th>주문번호</th>
                                                <th>주문 품목</th>
                                                <th>주문 자</th>
                                                <th>주문 일자</th>
                                                <th>주문 주소</th>
                                                <th>주문 상태</th>
                                            </tr>
                                        </thead>
                                        <tbody>
											<c:forEach var = "order" items = "${olist }">
                                            <tr>
                                            	<td>${order.d_num}</td>
                                            	<td>${order.d_name}</td>
                                            	<td>${order.d_userid }</td>
                                            	<td>${order.d_crea_date}</td>
                                            	<td>${order.d_address}</td>
                                            	<td>
                                            			<c:if test = "${order.d_yn == 0 }">
                                            			<select id = "${order.d_num}" class = "form-control">
	                                            			<option value="0" selected="selected">입금확인중</option>
	                                            			<option value="1">상품준비중</option>
                                            				<option value="2">배송 준비중</option>
                                            				<option value="3">배송 중</option>
                                            				<option value="4">배송 완료</option>
                                            			</select>
                                            			</c:if>
                                            			<c:if test = "${order.d_yn == 1 }">
                                            			<select id = "${order.d_num}" class = "form-control">
                                            				<option value="0">입금확인중</option>
	                                            			<option value="1" selected="selected">상품 준비중</option>
                                            				<option value="2">배송 준비중</option>
                                            				<option value="3">배송 중</option>
                                            				<option value="4">배송 완료</option>
                                            			</select>
                                            			</c:if>
                                            			<c:if test = "${order.d_yn == 2 }">
                                            			<select id = "${order.d_num}" class = "form-control">
                                            				<option value="0">입금확인중</option>
	                                            			<option value="1">상품준비중</option>
	                                            			<option value="2" selected="selected">배송 준비중</option>
                                            				<option value="3">배송 중</option>
                                            				<option value="4">배송 완료</option>
                                            			</select>
                                            			</c:if>
                                            			<c:if test = "${order.d_yn == 3 }">
                                            			<select id = "${order.d_num}" class = "form-control">
                                            				<option value="0">입금확인중</option>
	                                            			<option value="1">상품준비중</option>
                                            				<option value="2">배송 준비중</option>
	                                            			<option value="3" selected="selected">배송중</option>
                                            				<option value="4">배송 완료</option>
                                            			</select>
                                            			</c:if>
                                            			<c:if test = "${order.d_yn == 4 }">
                                            			<select id = "${order.d_num}" class = "form-control">
                                            				<option value="0">입금확인중</option>
	                                            			<option value="1">상품준비중</option>
                                            				<option value="2">배송 준비중</option>
                                            				<option value="3">배송 중</option>
	                                            			<option value="4" selected="selected">배송완료</option>
	                                            		</select>
                                            			</c:if>
                                            		
                                            	</td>
                                            </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                    </c:if>
                                </div>
                                <div>
	                            <ul>
		                            <c:set var = "opageCount" value = "${(ocount - 1) / opageSize + 1}" />
									<c:forEach var = "op" begin="1" end="${opageCount }">
										<c:if test="${ocurrentPage == op }">
											<li id="${op}" style="list-style: none; float: left;">${op }</li>	
										</c:if>
										<c:if test="${ocurrentPage != op }">
											<c:if test="${osearch == null }">
												<li id="${op}" style="list-style: none; float: left;"><a href = "adminorder.do?opagenum=${op}">${op }</a></li>
											</c:if>
										</c:if>
									</c:forEach>
								</ul>
                                </div>
                            </div>
                        </div>
                    </div>
				</div> 
            
        </div>
        <!-- /.row -->
        
        </div>
        
    </div>
    
</div>
</body>
</html>