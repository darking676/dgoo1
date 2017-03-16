<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 머티리얼 -->
<title>Insert title here</title>
</head>
<body>
	<div class="modal-dialog modal-lg">
		<div class="modal-content" style="background-color: white;">
			<c:set var="sum_price" value="0"></c:set>
			<!-- Profile Content -->
			<div class="col-md-9">
				<div class="profile-body" style="width: 1000px;">
					<!--Basic Table Option (Spacing)-->
					<div class="panel panel-red margin-bottom-40">
						<div class="panel-heading">
							<h3 class="panel-title">
								<i class="fa fa-user"></i> 배송상태확인
							</h3>
						</div>

						<div class="panel-body">
							<table class="table">
								<thead>
									<tr>
										<th>이미지</th>
										<th>상품이름</th>
										<th>사이즈</th>
										<th>수량</th>
										<th>금액</th>
										<th>주문처리상태</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${list}" var="a">
										<tr>
											<td style="vertical-align: middle" ><img src="${a.p_img}"
												style="width: 100px; height: 100px;" class="responsive-img"></td>
											<td style="vertical-align: middle">${a.p_name}</td>
											<td style="vertical-align: middle">${a.pur_po_size}</td>

											<td style="vertical-align: middle">${a.pur_cnt}</td>

											<td style="vertical-align: middle">
												<fmt:formatNumber value="${a.p_price}" pattern="#,###"/>원
												<c:set var="sum_price" value="${sum_price + a.p_price*a.pur_cnt}"/>
											</td>

											<td style="vertical-align: middle">
											<c:choose>
												<c:when test="${a.d_yn eq 0}">
													입금확인
												</c:when>
												<c:when test="${a.d_yn eq 1}">
													상품준비중
												</c:when>
												<c:when test="${a.d_yn eq 2}">
													배송준비중
												</c:when>
												<c:when test="${a.d_yn eq 3}">
													배송중
												</c:when>
												<c:when test="${a.d_yn eq 4}">
													배송완료
												</c:when>
												<c:when test="${a.d_yn eq 5}">
													구매확정
												</c:when>
											</c:choose>
											<c:set var="discount" value="${a.pur_c_discount}"></c:set> 
											<c:set var="point" value="${a.pur_point}"></c:set>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<div class="panel-body" style="background-color: white; font-size: 20px;" >
							<div style="float: right;">
							<hr>
							<table>
								<tr>
									<td>
										총 금액 : <fmt:formatNumber value="${sum_price}" pattern="#,###"/>원&nbsp; &nbsp;	
									</td>
									<td>
									<c:choose>
											<c:when test="${discount eq null}">
									쿠폰사용 : 사용안함 &nbsp; &nbsp;
													<br>
											</c:when>
											<c:otherwise>
									쿠폰사용 : ${discount}% 사용 &nbsp; &nbsp;
													<br>
											</c:otherwise>
									</c:choose>
									</td>
									<td>
										포인트사용 : <fmt:formatNumber value="${point}" pattern="#,###"/>원&nbsp; &nbsp;
									</td>
									<td colspan="3" style="text-align: center; font-size: 30px;">
										결제금액 : <fmt:formatNumber value="${sum_price*(100-discount)*0.01-point}" pattern="#,###"/>원&nbsp; &nbsp;
									</td>
								</tr>
							</table>
							<br>
							<button type="button" class="btn btn-default" data-dismiss="modal" style="float: right;">닫기</button>
							<!-- 
							총 금액 : <fmt:formatNumber value="${sum_price}" pattern="#,###"/>원&nbsp; &nbsp;<br><br>
							<c:choose>
								<c:when test="${discount eq null}">
									쿠폰사용 : 사용안함 &nbsp; &nbsp;<br><br>
								</c:when>
								<c:otherwise>
									쿠폰사용 : ${discount}% 사용 &nbsp; &nbsp;<br><br>
								</c:otherwise>
							</c:choose>
							포인트사용 : ${point}원&nbsp; &nbsp;<br><br>
							<p style="font-size: 23px;">
							결제금액 : <fmt:formatNumber value="${sum_price*(100-discount)*0.01-point}" pattern="#,###"/>원&nbsp; &nbsp;</p><br><br>
							<hr>
							<button type="button" class="btn btn-default" data-dismiss="modal" style="float: right;">닫기</button>
							</div>
							 -->
						</div>
						<!--End Basic Table-->
						<!-- End Profile Content -->
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>