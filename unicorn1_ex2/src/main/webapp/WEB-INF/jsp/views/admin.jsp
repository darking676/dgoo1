<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<jsp:include page="/WEB-INF/include/include-admin-header.jspf" />
<head>
</head>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/highcharts-3d.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#r-order").hide();
	$("#r-board").hide();
	$("#r-users").hide();
	$("#r-coment").hide();
	
	if('${param.reply}' == 'ok'){
		$("#r-board").show();
	}

	$(".form-control").on("change", function(){
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
	
	if("${param.opagenum}" != null && "${param.opagenum}" != ""){
	      $("li[id='${param.opagenum}']").addClass("active");
	      if($("li[id='${param.opagenum}']").has(".active")){
	         $("#r-order").show();
	      }
	   }
	if("${param.pagenum}" != null && "${param.pagenum}" != ""){
	      $("li[id='${param.pagenum}']").addClass("active");
	      if($("li[id='${param.pagenum}']").has(".active")){
	         $("#r-board").show();
	      }
	   }
	if("${param.cpagenum}" != null && "${param.cpagenum}" != ""){
	      $("li[id='${param.cpagenum}']").addClass("active");
	      if($("li[id='${param.cpagenum}']").has(".active")){
	         $("#r-coment").show();
	      }
	   }
	if("${param.upagenum}" != null && "${param.upagenum}" != ""){
	      $("li[id='${param.upagenum}']").addClass("active");
	      if($("li[id='${param.upagenum}']").has(".active")){
	         $("#r-users").show();
	      }
	   }
})

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

function reply(rv_idx){
	$("#rv_pid").empty();
	$("#cname").empty();
	$("#cuserid").empty();
	$("#cdate").empty();
	$("#ccontent").empty();
	$("#rv_index").empty();
	$.ajax({ 
		type : "get", url : "commentreply.do", dataType : "json", data : {"rv_index" : rv_idx},
		success:function(comment){
			var c_name = "";
			var c_content = "";
			var c_date = "";
			var c_userid = "";
			var c_pid = "";
			var c_index = "";
			var list = comment.datas;
			$(list).each(function(index, arrData){
				c_index += arrData["rv_index"];
				c_pid += arrData["rv_pid"];
				c_name += arrData["p_name"];
				c_content += arrData["rv_content"];
				c_date += arrData["rv_regdate"];
				c_userid += arrData["rv_userid"];
			})
			alert(c_pid);
			$("#rv_index").val(c_index);
			$("#rv_pid").val(c_pid);
			$("#cname").append(c_name);
			$("#cuserid").append(c_userid);
			$("#cdate").append(c_date);
			$("#ccontent").val(c_content);
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

function commentreplyup(){
	var rv_content = $("#rv_content").val();
	var rv_pid = $("#rv_pid").val();
	var rv_gnum = $("#rv_index").val();
	$.ajax({ 
		type : "get",
		url : "commentreplyup.do",
		data : {
				"rv_content" : rv_content,
				"rv_pid" : rv_pid,
				"rv_gnum" : rv_gnum,
				"rv_userid" : "Admin",
				"rv_lvl" : "1",
			   },
		success:function(data){
			location.href = 'admin.do?reply=ok'
		},
		error: function(e){
			alert(e.responseText);
			//$("#showdata").append("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error)
		}
	});
	
	
}


function rorder(){
	$("#r-order").toggle("slow");
}
function rboard(){
	$("#r-board").toggle("slow");
}
function rusers(){
	$("#r-users").toggle("slow");
}
function rcoment(){
	$("#r-coment").toggle("slow");
}

$(function () {
    price = Number('${tp[0]}'); price1 = Number('${tp[1]}'); price2 = Number('${tp[2]}'); price3 = Number('${tp[3]}');
    
	Highcharts.chart('container', {
        title: {
            text: '월별 매출',
            x: -20 //center
        },
        xAxis: {
            categories: ['1월', '2월', '3월', '4월', '5월', '6월',
                '7월', '8월', '9월', '10월', '11월', '12월']
        },
        yAxis: {
            
            plotLines: [{
                value: 0,
                width: 1,
                color: '#808080'
            }]
        },
        series: [{
            name: '매출',
            data: [10000000, 11000000, 15000000, 14500000, 10500000, 14500000, 14500000, 13000000, 9000000, 20000000, price, price1]
        }]
    });
    
    
});

$(function () {
	 String.prototype.replaceAll = function(org, dest) {
 	    return this.split(org).join(dest);
 	}
	 var t5name = "${t5name[0]}".replaceAll("'",'"'); var t5name1 = "${t5name[1]}".replaceAll("'",'"'); var t5name2 = "${t5name[2]}".replaceAll("'",'"'); var t5name3 = "${t5name[3]}".replaceAll("'",'"'); var t5name4 = "${t5name[4]}".replaceAll("'",'"');
	 $(document).ready(function () {
    	productcnt = Number('${t5cnt[0]}'); productcnt1 = Number('${t5cnt[1]}'); productcnt2 = Number('${t5cnt[2]}');
    	productcnt3 = Number('${t5cnt[3]}'); productcnt4 = Number('${t5cnt[4]}');
    	// Build the chart
        Highcharts.chart('container1', {
            chart: {
                plotBackgroundColor: null,
                plotBorderWidth: null,
                plotShadow: false,
                type: 'pie'
            },
            title: {
                text: ''
            },
            plotOptions: {
                pie: {
                    allowPointSelect: true,
                    cursor: 'pointer',
                    dataLabels: {
                        enabled: false
                    },
                    showInLegend: true
                }
            },
            series: [{
                name: 'Brands',
                colorByPoint: true,
                data: [{
                    name: t5name,
                    y: productcnt, 
              		sliced: true,
                    selected: true
                }, {
                    name: t5name1,
                    y: productcnt1
                }, {
                    name: t5name2,
                    y: productcnt2
                }, {
                    name: t5name3,
                    y: productcnt3
                }, {
                    name: t5name4,
                    y: productcnt4
                }]
            }]
        });
    });
});

	
$(function () {
    var catecnt = Number('${catecnt[0]}'); var catecnt1 = Number('${catecnt[1]}'); var catecnt2 = Number('${catecnt[2]}');
    var catecnt3 = Number('${catecnt[3]}'); var catecnt4 = Number('${catecnt[4]}');
	Highcharts.chart('container2', {
        chart: {
            type: 'pie',
            options3d: {
                enabled: true,
                alpha: 45
            }
        },
        title: {
            text: ''
        },
        plotOptions: {
            pie: {
                innerSize: 100,
                depth: 45
            }
        },
        series: [{
            name: 'Delivered amount',
            data: [
                ['${category[0]}', catecnt],
                ['${category[1]}', catecnt1],
                ['${category[2]}', catecnt2],
                ['${category[3]}', catecnt3],
                ['${category[4]}', catecnt4]
            ]
        }]
    });
});


$(function () {
    var todaypurchases = Number('${todaypurchases}');
	Highcharts.chart('container3', {
        chart: {
            plotBackgroundColor: null,
            plotBorderWidth: 0,
            plotShadow: false
        },
        title: {
            text: '${todaypurchases} 원',
            align: 'center',
            verticalAlign: 'middle',
            y: 40
        },
        tooltip: {
            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
        },
        plotOptions: {
            pie: {
                dataLabels: {
                    enabled: true,
                    distance: -50,
                    style: {
                        fontWeight: 'bold',
                        color: 'white'
                    }
                },
                startAngle: -90,
                endAngle: 90,
                center: ['50%', '75%']
            }
        },
        series: [{
            type: 'pie',
            name: 'Browser share',
            innerSize: '70%',
            data: [
                
                ['달성률', todaypurchases],
                ['미달성률',10000000-todaypurchases],
            ]
        }]
    });
});


</script>
<body>
<!-- ======================================================================================================== -->
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
<!-- ======================================================================================================== -->

<!-- ======================================================================================================== -->
<div class="container">
<!-- 모달 팝업 -->
	<div class="modal fade" id="commentModal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true" >
	  <div class="modal-dialog sm" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
		<h4 class="modal-title" id="myModalLabel">댓글 답글</h4>
	      </div>
	      <div class="modal-body" style="text-align: center">
			<table class = "table table-bordered table-hover table-striped">
				<tr>
					<th>제품명</th><td colspan = "3"><div id = "cname"></div></td>
				</tr>
				<tr>
					<th>작성자</th><td><div id = "cuserid"></div></td><th>작성일</th><td><div id = "cdate"></div></td>
				</tr>
				<tr>
					<td colspan = "4"><textarea cols="70" rows="10" id = "ccontent" readonly="readonly"></textarea></td>
				</tr>
				<tr>
					<td colspan = "4"><textarea rows="2" cols="70" id = "rv_content"></textarea></td>
				</tr>
			</table>
			<input type = "hidden" id = "rv_pid">
			<input type = "hidden" id = "rv_index">
	      </div>
	      <div class="modal-footer" id = "showdata" style = "text-align: center">
	      <button class = "btn btn-success" onclick = "commentreplyup()">댓글등록</button>
	      </div>
	      
	    </div>
	  </div>
	</div>

</div>
<!-- ======================================================================================================== -->

    <div id="wrapper">

        <div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Admin <small>Main Page</small>
                        </h1>
                    </div>
                </div>
                <!-- /.row -->

                 <div class="row">
                    
                    <div class="col-lg-3 col-md-6">
                        <div class="panel panel-yellow">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-shopping-cart fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                        <div class="huge">
                                        <c:if test="${empty ordercount }">0</c:if>
                                        <c:if test="${not empty ordercount }">${ordercount }</c:if>
                                        </div>
                                        <div>New Orders!</div>
                                    </div>
                                </div>
                            </div>
                            <a href="#" onclick = "javascript:rorder()">
                                <div class="panel-footer">
                                    <span class="pull-left">View Details</span>
                                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                    <div class="clearfix"></div>
                                </div>
                            </a>
                        </div>
                    </div>
                    
                    
                    <div class="col-lg-3 col-md-6">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-fw fa-table fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                        <div class="huge">
                                        <c:if test = "${boardcount == null}">0</c:if>
                                        <c:if test = "${boardcount != null}">${boardcount }</c:if>
                                        </div>
                                        <div>New Q & A</div>
                                    </div>
                                </div>
                            </div>
                            <a href="#" onclick = "javascript:rboard()">
                                <div class="panel-footer">
                                    <span class="pull-left">View Details</span>
                                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                    <div class="clearfix"></div>
                                </div>
                            </a>
                        </div>
                    </div>
                    
                    
                    
					<div class="col-lg-3 col-md-6">
                        <div class="panel panel-green">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-comments fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                        <div class="huge">
                                        <c:if test = "${comentcount == null}">0</c:if>
                                        <c:if test = "${comentcount != null}">${comentcount }</c:if>
                                        </div>
                                        <div>New Comments!</div>
                                    </div>
                                </div>
                            </div>
                            <a href="#" onclick = "rcoment()">
                                <div class="panel-footer">
                                    <span class="pull-left">View Details</span>
                                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                    <div class="clearfix"></div>
                                </div>
                            </a>
                        </div>
                    </div>
                    
                    
                    <div class="col-lg-3 col-md-6">
                        <div class="panel panel-red">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-user fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                        <div class="huge">
                                        <c:if test = "${usercount == null}">0</c:if>
                                        <c:if test = "${usercount != null}">${usercount }</c:if>
                                        </div>
                                        <div>New Users</div>
                                    </div>
                                </div>
                            </div>
                            <a href="#" onclick = "javascript:rusers()">
                                <div class="panel-footer">
                                    <span class="pull-left">View Details</span>
                                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                    <div class="clearfix"></div>
                                </div>
                            </a>
                        </div>
                        
                    </div>

                </div>
                <!-- /.row -->
                
                <!-- =================================   order   ======================================== -->
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
												<li id="${op}" style="list-style: none; float: left;"><a href = "admin.do?opagenum=${op}">${op }</a></li>
											</c:if>
										</c:if>
									</c:forEach>
								</ul>
                                </div>
                            </div>
                        </div>
                    </div>
				</div>                
				<!-- ============================================================================================== -->
				
				<!-- =================================   board   ======================================== -->
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
                                            	<td><button class = "btn btn-success"  data-target="#adminModal" data-toggle="modal" onclick = "boardreply('${board.b_id}')"> 답글달기 </button></td>
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
										<li id="${p}" style="list-style: none; float: left;"><a href = "admin.do?upagenum=${p}">${p }</a></li>
									</c:if>
								</c:if>
							</c:forEach>
							</ul>
                            </div>
                            </div>
                        </div>
                    </div>
				</div>
				<!-- ============================================================================================== -->
				
				<!-- =================================   coment   ======================================== -->
				<div class = "row" id = "r-coment">
					<div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-clock-o fa-fw"></i> coment Panel</h3>
                            </div>
                            <div class="panel-body">
                                <div class="table-responsive">
                                <c:if test="${ccount == 0 }">
									새로 등록된 댓글이 없습니다.
								</c:if>
								<c:if test="${ccount > 0  }">
                                    <table class="table table-bordered table-hover table-striped">
                                        <thead>
                                            <tr>
                                            	<th>댓글번호</th>
                                                <th>댓글내용</th>
                                                <th>등록아이디</th>
                                                <th>등록일</th>
                                                <th>select</th>
                                            </tr>
                                        </thead>
                                        <tbody>
											<c:forEach var = "coment" items = "${clist }">
                                            <tr>
                                            	<td>${coment.rv_index }</td>
                                            	<td>${coment.rv_content}</td>
                                            	<td>${coment.rv_userid}</td>
                                            	<td>${coment.rv_regdate}</td>
                                            	<td><button class = "btn btn-success"  data-target="#commentModal" data-toggle="modal" onclick = "reply('${coment.rv_index}')"> 댓글등록 </button></td>
                                            </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                    </c:if>
                                </div>
                            <div>
                          <ul>
                            <c:set var = "cpageCount" value = "${(ccount - 1) / cpageSize + 1}" />
							<c:forEach var = "cp" begin="1" end="${cpageCount }">
								<c:if test="${ccurrentPage == cp }">
									<li id="${cp}" style="list-style: none; float: left;">${cp }</li>	
								</c:if>
								<c:if test="${ccurrentPage != cp }">
									<c:if test="${search == null }">
										<li id="${cp}" style="list-style: none; float: left;"><a href = "admin.do?cpagenum=${cp}">${cp }</a></li>
									</c:if>
								</c:if>
							</c:forEach>
							</ul>
                            </div>
                            </div>
                        </div>
                    </div>
				</div>
				<!-- ============================================================================================== -->
				
				<!-- =======================================   user   ======================================== -->
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
                            <c:set var = "pageCount" value = "${(ucount - 1) / upageSize + 1}" />
							<c:forEach var = "p" begin="1" end="${upageCount }">
								<c:if test="${ucurrentPage == p }">
									<li id="${up}" style="list-style: none; float: left;">${up }</li>	
								</c:if>
								<c:if test="${ucurrentPage != p }">
									<c:if test="${usearch == null }">
										<li id="${up}" style="list-style: none; float: left;"><a href = "admin.do?upagenum=${up}">${up }</a></li>
									</c:if>
								</c:if>
							</c:forEach>
							</ul>
                            </div>
                            </div>
                        </div>
                    </div>
				</div>
				<!-- ============================================================================================== -->
				
        <div class="row">
            <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Admin <small>Chart</small>
                        </h1>
                    </div>
                </div>
             <div class="row">
                <div class="col-lg-4">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title"><i class="fa fa-bar-chart-o fa-fw"></i> 제품판매순 </h3>
                        </div>
                        <div class="panel-body">
                            <div id="container1" style="margin: 0 auto"></div>
                        </div>
                    </div>
                </div>
                
                <div class="col-lg-4">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title"><i class="fa fa-bar-chart-o fa-fw"></i> 카테고리 매출순 </h3>
                        </div>
                        <div class="panel-body">
                            <div id="container2" style="margin: 0 auto"></div>
                        </div>
                    </div>
                </div>
                
                <div class="col-lg-4">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title"><i class="fa fa-bar-chart-o fa-fw"></i> 오늘 매출</h3>
                        </div>
                        <div class="panel-body">
                            <div id="container3" style="margin: 0 auto"></div>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>
        <!-- /.row -->
        
                    
		 <div class="row">
		     <div class="col-lg-12">
		         <div class="panel panel-default">
		             <div class="panel-heading">
		                 <h3 class="panel-title"><i class="fa fa-bar-chart-o fa-fw"></i> 월별 매출</h3>
		             </div>
		             <div class="panel-body">
		                 <div id="container" style="min-width: 100%; height: 100%; margin: 0 auto"></div>
		             </div>
		         </div>
		     </div>
		 </div>
				
				
            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->
    </div>
    <!-- /#wrapper -->

</body>

</html>
