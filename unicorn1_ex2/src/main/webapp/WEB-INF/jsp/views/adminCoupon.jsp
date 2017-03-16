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
<body>
<div id="wrapper">

    <div id="page-wrapper">

        <div class="container-fluid">
        
        <!-- Page Heading -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">
                    Admin <small>Coupon Page</small>
                </h1>
            </div>
            
            <div class = "row" id = "r-users">
					<div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-clock-o fa-fw"></i> Tasks Panel</h3>
                            </div>
                                                        <div class="panel-body">
                                <div class="table-responsive">
                                <c:if test="${ucount == 0 }">
									새로 등록된 게시글이 없습니다.
								</c:if>
								<c:if test="${ucount > 0  }">
                                    <table class="table table-bordered table-hover table-striped">
                                        <thead>
                                            <tr>
                                                <th>id</th>
                                                <th>password</th>
                                                <th>name</th>
                                                <th>date</th>
                                                <th>point</th>
                                                <th>sex</th>
                                            </tr>
                                        </thead>
                                        <tbody>
											<c:forEach var = "user" items = "${ulist }">
                                            <tr>
                                            	<td>${user.u_userid}</td>
                                            	<td>${user.u_password}</td>
                                            	<td>${user.u_name}</td>
                                            	<td>${user.u_crea_date}</td>
                                            	<td>${user.u_point}</td>
                                            	<td>${user.u_gender}</td>
                                            </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                    </c:if>
                                </div>
                            <div>
                          <ul>
                            <c:set var = "upageCount" value = "${(ucount - 1) / upageSize + 1}" />
							<c:forEach var = "up" begin="1" end="${upageCount }">
								<c:if test="${ucurrentPage == up }">
									<li id="${up}" style="list-style: none; float: left;">${up }</li>	
								</c:if>
								<c:if test="${ucurrentPage != up }">
									<c:if test="${usearch == null }">
										<li id="${up}" style="list-style: none; float: left;"><a href = "adminuser.do?upagenum=${up}">${up }</a></li>
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