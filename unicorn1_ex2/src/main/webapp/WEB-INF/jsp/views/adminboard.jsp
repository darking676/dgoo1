<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/include/include-admin-header.jspf" />
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
function boardreply(b_id){
	$("#btitle").empty();
	$("#buserid").empty();
	$("#bdate").empty();
	$("#bcontent").empty();
	$.ajax({ 
		type : "get", url : "adminboardreply.do", dataType : "json", data : {"b_id" : b_id},
		success:function(checkid){
			var b_id = "";
			var b_title = "";
			var b_content = "";
			var b_date = "";
			var b_userid = "";
			var list = checkid.datas;
			$(list).each(function(index, arrData){
				b_id += arrData["b_id"];
				b_title += arrData["b_title"];
				b_content = arrData["b_content"];
				b_date += arrData["b_crea_date"];
				b_userid += arrData["b_userid"];
			})
			
			$("#btitle").append(b_title);
			$("#buserid").append(b_userid);
			$("#bdate").append(b_date);
			$("#bcontent").val(b_content);
			$("#bid").val(b_id)
		},
		error: function(request,status,error){
			$("#showdata").append("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error)
		}
	});
}

function boardreplyup(){
	var rp_userid = $("#buserid").text();
	var rp_bid = $("#bid").val();
	var rp_content = $("#rp_content").val();
	$.ajax({ 
		type : "get", url : "adminboardreplyup.do", data : {"rp_bid" : rp_bid, "rp_userid" : rp_userid, "rp_content" : rp_content},
		success:function(checkid){
			location.href = 'admin.do?reply=ok'
		},
		error: function(request,status,error){
			$("#showdata").append("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error)
		}
	});
	
}
</script>
</head>
<body>
<div class="container">
<!-- 모달 팝업 -->
	<div class="modal fade" id="adminModal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true" >
	  <div class="modal-dialog sm" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
		<h4 class="modal-title" id="myModalLabel">게시글 답글</h4>
	      </div>
	      <div class="modal-body" style="text-align: center">
			<table class = "table table-bordered table-hover table-striped">
				<tr>
					<th>제목</th><td colspan = "3"><div id = "btitle"></div></td>
				</tr>
				<tr>
					<th>작성자</th><td><div id = "buserid"></div></td><th>작성일</th><td><div id = "bdate"></div></td>
				</tr>
				<tr>
					<td colspan = "4"><textarea cols="70" rows="10" id = "bcontent" readonly="readonly"></textarea></td>
				</tr>
				<tr>
					<td colspan = "4"><textarea rows="2" cols="70" id = "rp_content"></textarea></td>
				</tr>
			</table>
	      </div>
	      <div class="modal-footer" id = "showdata" style = "text-align: center">
	      <input type = "hidden" id = "bid">
	      <button class = "btn btn-success" onclick = "boardreplyup()">댓글등록</button>
	      </div>
	      
	    </div>
	  </div>
	</div>

</div>

<div id="wrapper">

    <div id="page-wrapper">

        <div class="container-fluid">
        
        <!-- Page Heading -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">
                    Admin <small>Board Page</small>
                </h1>
            </div>
            
            <div class = "row" id = "r-board">
					<div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-clock-o fa-fw"></i> Board Panel</h3>
                            </div>
                            <div class="panel-body">
                                <div class="table-responsive">
                                <c:if test="${count == 0 }">
									새로 등록된 게시글이 없습니다.
								</c:if>
								<c:if test="${count > 0  }">
                                    <table class="table table-bordered table-hover table-striped">
                                        <thead>
                                            <tr>
                                                <th>idx</th>
                                                <th>title</th>
                                                <th>name</th>
                                                <th>date</th>
                                                <th>state</th>
                                            </tr>
                                        </thead>
                                        <tbody>
											<c:forEach var = "board" items = "${list }">
                                            <tr>
                                            	<td>${board.b_id }</td>
                                            	<td>${board.b_title}</td>
                                            	<td>${board.b_userid}</td>
                                            	<td>${board.b_crea_date}</td>
                                            	<td>
                                            		<c:if test="${board.b_state == 'N'}">
                                            			<button class = "btn btn-success"  data-target="#adminModal" data-toggle="modal" onclick = "boardreply('${board.b_id}')"> 답글달기 </button>
                                            		</c:if>
                                            		<c:if test="${board.b_state == 'Y'}">
                                            			답변완료
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
                            <c:set var = "pageCount" value = "${(count - 1) / pageSize + 1}" />
							<c:forEach var = "p" begin="1" end="${pageCount }">
								<c:if test="${currentPage == p }">
									<li id="${p}" style="list-style: none; float: left;">${p }</li>	
								</c:if>
								<c:if test="${currentPage != p }">
									<c:if test="${search == null }">
										<li id="${p}" style="list-style: none; float: left;"><a href = "adminboard.do?pagenum=${p}">${p }</a></li>
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