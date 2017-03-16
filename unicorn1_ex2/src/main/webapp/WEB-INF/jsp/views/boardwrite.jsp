<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<%@ include file="/WEB-INF/include/include-header-template.jspf" %>  
	<%@ include file="/WEB-INF/include/include-header-script.jspf" %>
	<style type="text/css">
.red {
	color: red;
}

.form-area {
	background-color: #FAFAFA;
	padding: 10px 40px 60px;
	margin: 10px 0px 60px;
	border: 1px solid GREY;
}
</style>
</head>

<body>
	<!-- 
    <form id="frm">
        <table class="board_view" style="margin: auto;">
            <colgroup>
                <col width="15%">
                <col width="*"/>
            </colgroup>
            <caption>게시글 작성</caption>
            <tbody>
                <tr>
                    <th scope="row">제목${b_userid}</th>
                    
                    <td><input type="text" id="b_title" name="b_title" class="wdp_90"></input></td> 
                    <td><input type="hidden" id="b_userid" name="b_userid" class="wdp_90" value="${b_userid}"></input></td>
                </tr>
                <tr>
                    <th scope="row">비밀번호</th>
                    <td><input type="text" id="b_password" name="b_password" class="wdp_30"></input></td>
                </tr>
                <tr>
                    <td colspan="2" class="view_text">
                        <textarea rows="20" cols="100" title="내용" id="b_content" name="b_content"></textarea>
                    </td>
                </tr>
            </tbody>
        </table>
         
        <a href="#this" class="btn" id="write" >작성하기</a>
        <a href="#this" class="btn" id="list" >목록으로</a>
    </form>
     -->
    <div class="container">
		<div class="col-md-12">
    		<div class="form-area">  
        		<form role="form" id="frm">
        			<br style="clear:both">
                    <h3 style="margin-bottom: 25px; text-align: center;">문의 게시판</h3>
    				<div class="form-group">
						<input type="text" class="form-control" id="b_title" name="b_title" placeholder="제목" required>
						<input type="hidden" id="b_userid" name="b_userid" class="wdp_90" value="${b_userid}">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" id="b_password" name="b_password" placeholder="비밀번호" required>
					</div>
                    <div class="form-group">
                    <textarea class="form-control" type="textarea" id="b_content" name="b_content" placeholder="내용을 작성하세요" maxlength="3000" rows="10"></textarea>
                        <span class="help-block"><p id="characterLeft" class="help-block ">You have reached the limit</p></span>                    
                    </div>
            
        			<button type="button" id="write" name="write" class="btn btn-primary pull-right">작성하기</button>
        			<div style="float: left;">
        			<button type="button" id="list" name="list" class="btn btn-primary pull-right">목록으로</button>
        			</div>
        		</form>
    		</div>
		</div>
	</div>
     
    <%@ include file="/WEB-INF/include/include-body.jspf" %>
    <script type="text/javascript">
        $(document).ready(function(){
        	$("#list").on("click", function(e){
                e.preventDefault();
                fn_BoardList();
            }); 
        	
        	$("#write").on("click", function(e){ //작성하기 버튼
                e.preventDefault();
                fn_insertBoard();
            });
        });
        
        function fn_BoardList(){
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/BoardList.do' />");
            comSubmit.submit();
        }
        
        function fn_insertBoard(){
        	
        	var comSubmit = new ComSubmit("frm");
            comSubmit.setUrl("<c:url value='/insertBoard.do' />");
        	
        	//password 입력 할건지랑 모든 인풋 채웠는지
        	
        	if($("#b_title").val() == ""){
        		alert("제목을 입력 해주세요.");
        		return;
        	}else if($("#b_content").val() == ""){
        		alert("내용을 입력 해주세요.");
        		return;
        	}else if($("#b_password").val() == ""){
        		var pass = confirm("비밀번호를 사용하지 않겠습니까?");
        		if(pass == true && $("#b_content").val() != "" && $("#b_title").val() != ""){
                    comSubmit.submit();
        		}else{
        			return;
        		}
        	}else{
                comSubmit.submit();
        	}
        }
        
        //########################
        $(document).ready(function(){ 
   	 	$('#characterLeft').text('3000 characters left');
    	$('#b_content').keydown(function () {
        var max = 3000;
        var len = $(this).val().length;
        if (len >= max) {
            $('#characterLeft').text('You have reached the limit');
            $('#characterLeft').addClass('red');
            $('#btnSubmit').addClass('disabled');            
        } 
        else {
            var ch = max - len;
            $('#characterLeft').text(ch + ' characters left');
            $('#btnSubmit').removeClass('disabled');
            $('#characterLeft').removeClass('red');            
        }
    });    
});
    </script>
</body>
</html>