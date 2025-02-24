<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 반응형 웹 -->
<title>BoardCommentList</title>
</head>
<body>
	<div class="table_div">
		<c:forEach var="dto" items="${list}">
			<form name="CommentList${dto.b_comNo}" action="adBoardCommentUpdate.ad" method="post">
			<!-- 반복 -->
				<table border="1"  style="width: 80%; margin:auto;">
					<tr>
						<td rowspan="4" style="width:8%; text-align:center; min-width: 80px; max-width: 80px; border:1px solid black; white-space: nowrap;">
							<c:if test="${dto.b_comType == 'trainer'}">
								<i class="fa-solid fa-dumbbell fa-2xl" style="color: #FFD43B;"></i>
							</c:if> 	
							<c:if test="${dto.b_comType == 'admin'}">
								<i class="fa-solid fa-user-tie fa-2xl" style="color: #ff0000;"></i>
							</c:if>
							<c:if test="${dto.b_comType == 'user'}">
								<i class="fa-solid fa-user fa-2xl" style="color: #FFD43B;"></i>
							</c:if>
						</td>
					</tr>
					<tr>
						<td style="width:80%; background-color:#D8D8D8; height:5px; text-align:left;  padding:10px">
							${dto.b_comWriter}<br>
							<div style="font-size:13px;">${fn: substring(dto.b_comRegdate,0,19)}</div>
						</td>
						<td style="background-color:#D8D8D8; width:8%; min-width: 85px; max-width: 85px; white-space: nowrap;">
							<c:if test="${sessionScope.sessionID == dto.b_comWriter || sessionScope.sessionType == 'admin' || sessionScope.sessionType == 'trainer'}">
								<input type="hidden" name="hidden_b_comNo" id="hidden_b_comNo" value="${dto.b_comNo}">
			 					<input type="hidden" name="hidden_boardNo" id="hidden_boardNo" value="${dto.boardNo}">	
			 					
								<a href="javascript:commentUpdateBox${dto.b_comNo}();" style="pafont-size:13px; color: gray; text-decoration : underline; ">수정</a>
							
							<script type="text/javascript">
								function commentUpdateBox${dto.b_comNo}(){
									alert("test1");
									let editBox = '<div style="display: flex; align-items: center;">' +
							        			      '<textarea style="width: 650px; margin-right: 10px;" name="b_comContent_re" id="b_comContent_re${dto.b_comNo}">' + '${dto.b_comContent}' + '</textarea>' +
							                     	  '<button type="submit" class="btn active" id="boardInsert${dto.b_comNo}">수정</button>' +
							                      '</div>';
							                      alert("test3");
									$('#commentUpdate${dto.b_comNo}').html(editBox);
									
									$('#boardInsert' + ${dto.b_comNo}).click(function(){
										alert("test2");
										$('form[name="CommentList${dto.b_comNo}"]').submit();
									});
								}
							</script>
							<a href="${path}/boardCommentDelete.bo?b_comNo=${dto.b_comNo}&boardNo=${dto.boardNo}" style="pafont-size:13px; color: gray; text-decoration : underline;">삭제</a>
							</c:if>
						</td>
					</tr>
					<tr>
						<td id="commentUpdate${dto.b_comNo}" colspan="2" style="height:5px; text-align:left; padding:10px">${dto.b_comContent}</td>
					</tr>
				</table>
				<br>
     	 </form>
      </c:forEach>
   </div>
</body>
</html>