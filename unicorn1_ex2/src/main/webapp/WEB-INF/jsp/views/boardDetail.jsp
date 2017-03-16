<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="/WEB-INF/include/include-header-template.jspf" %>    
<%@ include file="/WEB-INF/include/include-header-script.jspf" %>
<style type="text/css">
table.board_view {
    border-collapse: collapse;
    text-align: left;
    line-height: 1.5;
    border: 1px solid #ccc;
    margin: 20px 10px;
}
table.board_view thead {
    border-right: 1px solid #ccc;
    border-left: 1px solid #ccc;
    background: #000000;
}
table.board_view thead th {
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    color: #fff;
}
table.board_view tbody th {
    width: 150px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    background: #000000;
    color: #fff;
}
table.board_view td {
    width: 350px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}
</style>   
</head>
<body style="text-align: center;margin: auto;">

<table style="margin: auto; width: 77%; text-align: left;">
<tbody>
<tr>
<td><a href="#this" class="btn" id="list">목록으로</a></td>
</tr>
</tbody>
</table>
    <table class="board_view" style="margin: auto; width: 77%; height: 100%;">
        <colgroup>
            <col width="15%"/>
            <col width="35%"/>
            <col width="15%"/>
            <col width="35%"/>
        </colgroup>
        <caption>게시글 상세보기</caption>
        <tbody>
            <tr>
                <th scope="row">글 번호</th>
                <td>${dto.b_id }</td>
                <th scope="row">조회수</th>
                <td>${dto.b_hit_cnt}</td>
            </tr>
            <tr>
                <th scope="row">작성자</th>
                <td>${dto.b_userid }</td>
                <th scope="row">작성시간</th>
                <td>${f:substring(dto.b_crea_date , 0, 16)}</td>
            </tr>
            <tr>
                <th scope="row">제목</th>
                <td colspan="3">${dto.b_title }</td>
            </tr>
            <tr style="overflow: auto; height: 100px">
                <td colspan="4" valign="top" height="100" width="100%" style="white-space: normal; text-overflow:ellipsis; height:100%; width:100%; overflow: hidden;">
            			<div style="width:100%; height:250px; z-index:0; overflow-x:hidden; overflow-y:auto;">
            				${dto.b_content }
            			</div>
                </td>
            </tr>
        </tbody>
    </table>

	<div style="height: 400px;">
		<c:if test="${f:length(replyList) > 0 }">
			<c:forEach var="re" items="${replyList}">
				<div>
					<div>
						<h4>${re.rp_userid}
							<small>${re.rp_regdate}</small>
						</h4>
						<div style="width:100%; height:350px; z-index:0; overflow-x:hidden; overflow-y:auto;">
            				${re.rp_content }
            			</div>
					</div>
				</div>
			</c:forEach>
		</c:if>
		<c:if test="${f:length(replyList) < 1 }">
			<div style="height: 100px;">
				<div>
					<h4 style="text-align: center;">등록된 답변이 없습니다</h4>
				</div>
			</div>
		</c:if>
	</div>

	<%@ include file="/WEB-INF/include/include-footer-template.jspf" %>
	<%@ include file="/WEB-INF/include/include-body.jspf" %>
    <script type="text/javascript">
					$(document).ready(function() {
						$("#list").on("click", function(e) { //목록으로 버튼
							e.preventDefault();
							fn_BoardList();
						});

						$("#update").on("click", function(e) {
							e.preventDefault();
							fn_BoardUpdate();
						});
					});

					function fn_BoardList() {
						var comSubmit = new ComSubmit();
						comSubmit.setUrl("<c:url value='/BoardList.do' />");
						comSubmit.submit();
					}

					function fn_BoardUpdate() {
						var b_id = "${dto.b_id}";
						var comSubmit = new ComSubmit();
						comSubmit.setUrl("<c:url value='/UpdateView.do'/>");
						comSubmit.addParam("b_id", b_id);
						comSubmit.submit();
					}
				</script>
</body>
</html>