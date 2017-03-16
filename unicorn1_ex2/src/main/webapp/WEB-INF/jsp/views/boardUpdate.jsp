<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
</head>
<body>
	<form id="frm">
	    <table class="board_view">
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
	                <td>
	                	${dto.b_id }
	                	<input type="hidden" id="b_id" name="b_id" value="${dto.b_id }">
	                </td>
	                <th scope="row">조회수</th>
	                <td>${dto.b_hit_cnt }</td>
	            </tr>
	            <tr>
	                <th scope="row">작성자</th>
	                <td>${dto.b_userid }</td>
	                <th scope="row">작성시간</th>
	                <td>${dto.b_crea_date }</td>
	            </tr>
	            <tr>
	                <th scope="row">제목</th>
	                <td colspan="3">
	                	${dto.b_title }
	                	 <input type="text" id="b_title" name="b_title" class="wdp_90" value="${dto.b_title }"/>
	                </td>
	            </tr>
	            <tr>
	                <td colspan="4" class="view_text">
	                	${dto.b_content }
	                	<textarea rows="20" cols="100" title="내용" id="content" name="content">${dto.b_content }</textarea>
	                </td>
	            </tr>
	        </tbody>
	    </table>
     </form>
    <a href="#this" class="btn" id="list">목록으로</a>
    <a href="#this" class="btn" id="update">수정하기</a>
     
    <%@ include file="/WEB-INF/include/include-body.jspf" %>
    <script type="text/javascript">
        $(document).ready(function(){
            $("#list").on("click", function(e){ //목록으로 버튼
                e.preventDefault();
                fn_BoardList();
            });
             
            $("#update").on("click", function(e){
                e.preventDefault();
                fn_BoardUpdate();
            });
        });
         
        function fn_BoardList(){
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/BoardList.do' />");
            comSubmit.submit();
        }
         
        function fn_BoardUpdate(){
            var idx = "${dto.b_id}";
            var comSubmit = new ComSubmit("frm");
            comSubmit.setUrl("<c:url value='/insertBoard.do' />");
            comSubmit.submit();
        }
        
    </script>
</body>
</html>