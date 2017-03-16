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
<body class="modal-open">
<div id="wrapper">

    <div id="page-wrapper">

        <div class="container-fluid">
        
        <!-- Page Heading -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">
                    Admin <small>Users Page</small>
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
                                                <th>etc.</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<c:set var="no" value="0" />
											<c:forEach var = "user" items = "${ulist }" varStatus="status">
                                            <tr>
                                            	<td>${user.u_userid }</td>
                                            	<td>${user.u_password}</td>
                                            	<td>${user.u_name}</td>
                                            	<td>${user.u_crea_date}</td>
                                            	<td>${user.u_point}</td> 
                                            	<td>${user.u_gender}</td>  
                                            	<td style="width: 3%">
                                            		<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal${status.current.u_userid }" data-whatever="@getbootstrap"><i class="fa fa-codepen"></i></button>
                                            	</td>
                                            	<c:set var="no" value="${no + 1 }" />
                                            </tr>
<!-- Modal -->                                           
<div class="modal fade" id="exampleModal${status.current.u_userid }" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="exampleModalLabel">쿠폰 발급</h4>
      </div>
      <div class="modal-body">
        <form id="frm">
          <div class="form-group">
            <label for="recipient-name" class="control-label">아이디:</label>
            <input type="text" class="form-control" id="recipient-name" name="c_userid" value="${user.u_userid }">
          </div>
          <div class="form-group">
            <label for="message-text" class="control-label">할인율%:</label>
            <input type="number" class="form-control" id="message-text" name="c_discount" maxlength="100" min="1"></input>
          </div>
       </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="btnOk" onclick="javascript:fn_btn_ok(this);">발급</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>
<!-- ------- -->
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
<script>
jQuery(document).ready(function() {
  	$('.modal fade').modal({   
		  show : false
		});
});
function fn_btn_ok(a){
  		$.ajax({ 
			type : "get", url : "insertCoupon.do", dataType : "json", data : {"c_userid" : $(a).parent().parent().find("#recipient-name").val(), "c_discount": $(a).parent().parent().find("#message-text").val()},
			 success:function(check){
				alert("성공");
				
			},
			error: function(request,status,error){
				alert("실패");
			}
		});
}
</script>
</body>
</html>