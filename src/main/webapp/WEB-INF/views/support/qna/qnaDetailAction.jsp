<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<style>
	#customAccordionButton:focus {
	    box-shadow: none !important; /* 기본 부트스트랩 효과 제거 */
	    border: 2px solid #000000 !important; /* 클릭 시 검은색 테두리 */
  	}
   	.btn btn-light{
  		background-color:orange-500;
  	} 
</style>

<script>
	$(function(){	// 상세페이지가 로딩되면
		// 자동으로 댓글 목록 호출
		comment_list();
	
		// [댓글쓰기 버튼 클릭 1번]
		$('#qnaCommentInsert').click(function(){
			comment_add();
		});
		// [문의 목록 버튼] 클릭시 컨트롤러의 목록으로 이동
		$("#qnaList").click(function(){
			location.href="${path}/qnaList.bo";
		});
		// [삭제 버튼] 클릭시 
		$("#qnaDelete").click(function(){
			alert("삭제합니다")
			location.href="${path}/qnaDelete.bo?qnaNo=${dto.qnaNo}";
		});
	});
	
	// 댓글쓰기 버튼 클릭
	function comment_add(){
		// 게시글번호,댓글 내용을 파라미터로 넘김
		let param = {
			"qnaNo" : ${dto.qnaNo},
			"q_comContent" : $('#q_comContent').val()
		}
		$.ajax({
			url: '${path}/qnaCommentInsert.bo',	// 컨트롤러로 이동 3번
			type: 'POST',
			data: param,
			success: function(){	// 콜백함수 6번 => 댓글쓰기가 완료되면 서버에서 콜백함수 호출
				$('#q_comContent').val('');
				comment_list();		// 댓글목록 새로고침 7번			
			},
			error: function(){
				comment_list();
				alert('내용을 확인해주세요');
			}
		});
	}
	
	// 댓글 목록
	function comment_list(){ 
		$.ajax({
			url: '${path}/qnaCommentList.bo',	// 컨트롤러로 이동(9번)
			type: 'POST',
			data: 'qnaNo=${dto.qnaNo}',
			// 
			success: function(result){	//  13번 콜백함수 => result는 comment_list.jsp(컨트롤러에서 넘긴)
				$('#commentList').html(result);		// div id가 commentList인 자리에 댓글 리스트페이지를 출력			
			},
			error: function(){
				alert('comment_list() 오류');
			}
		});
	}
	
</script>
<head>
<meta charset="UTF-8">
<title>QNA Detail</title>
</head>
<body>
	<div class="wrap">
		<!-- header 시작 -->
		<%@ include file="/WEB-INF/views/common/header.jsp" %>
		<!-- header 끝 -->
		
		<!-- 컨텐츠 시작 -->
		<!-- 상단 메뉴바 -->
		<br>
		<div  style="width:1000px; margin:auto" class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
			<div class="btn-group me-2" role="group" aria-label="Second group">
			    <button type="button" class="btn btn-light">
					<a href="${path}/noticeList.bo" style="text-decoration: none; color: inherit;">공지사항</a>
				</button>
				<button type="button" class="btn btn-light">
					<a href="${path}/eventList.bo" style="text-decoration: none; color: inherit;">이벤트</a>
				</button>
				<button type="button" class="btn btn-light">
					<a href="${path}/boardList.bo" style="text-decoration: none; color: inherit;">자유게시판</a>
				</button>
			    <button type="button" class="btn btn-light" >
					<a href="${path}/faqList.bo" style="text-decoration: none; color: inherit;"> FAQ</a>
			    </button>
			    <button type="button" class="btn btn-warning" >
					<a href="${path}/qnaList.bo" style="text-decoration: none; color: inherit;">1대1문의</a>
				</button>
			</div>
		</div>
		<!-- 상단 메뉴바 끝 -->
		
		<hr>
		<h3 align="center">문의내용</h3>
		<br>
		
		<!-- 문의내용 시작 -->
		<div style="width:1150px; text-align: right;">
			<input type="hidden" name="hidden_qnaNo" value="${dto.qnaNo}">
		</div>
		
		<table class="table" style="width:1000px; margin:auto;">
			<thead>
			<tr>
				<td colspan="6" align="right">
				<!-- 수정삭제버튼 시작 -->
					<button type="button" class="btn btn-warning" >
							<a href="${path}/qnaUpdate.bo?qnaNo=${dto.qnaNo}" style="text-decoration: none; color: inherit;">수정</a>
					</button>
					
					<!-- Modal 시작 -->
					<button type="button" class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#exampleModal">
					  삭제
					</button>
					<div class="modal" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-dialog modal-dialog-centered">
								<div class="modal-content">
									<div class="modal-header">
						        		<h1 class="modal-title fs-5" id="exampleModalLabel">확인</h1>
						       			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						      		</div>
							     	<div class="modal-body">
							        	삭제하겠습니까?
							      	</div>
							      	<div class="modal-footer">
							        	<button type="button" class="btn btn-primary" data-bs-dismiss="modal" id="qnaDelete">예</button>
							        	<button type="button" class="btn btn-secondary"data-bs-dismiss="modal">아니요</button>
							      	</div>
								</div>
							</div>
						</div>
					</div>
					<!-- Modal 끝 -->
				<!-- 수정삭제버튼 끝 -->
				</td>
			</tr>
			
			<tr>
				<td colspan="6">
					<hr style="border:3px solid orange; width:1000px; margin:auto;">
				</td>
			</tr>
			    <tr>
					<th colspan="5" style="width:5%">
						<h4>${dto.qnaTitle}</h4>
					</th>
					<td align="right" colspan="5" style="width:5%"> 
						처리상태 : ${dto.qnaStatus}
					</td>
			    </tr>
		    </thead>
		    <tbody>
			    <tr>
			        <td colspan="7">
			      	 <p class="text-start"> ${dto.qnaContent}</p>
			        </td>
			    </tr>
			    <!-- 댓글 목록 시작 -->
			    <tr>
				    <td colspan="7" >
				    	
				    	<div id="commentList" align="center">
							<!-- 댓글 들어가는 부분 -->
						</div>
				    </td>
				</tr>
				<!-- 댓글 목록 끝 -->
				
				<!-- 추가문의 시작 -->
				<tr>
				    <td colspan="7" align="center">
					    <div class="row g-3 align-items-center">
							<div class="col-md-4" >
								<h5>추가문의</h5>
							</div>
						</div>
						<div class="row form-group">
							<textarea style="width:800px; margin:auto;"name="q_comContent" id="q_comContent" rows="3" class="form-control form-control-lg" placeholder="내용을 입력해주세요"></textarea>
						</div>
						<button type="button" class="btn active" data-bs-toggle="button" aria-pressed="true" id="qnaCommentInsert">작성</button>
			  		</td>
				</tr>
				<!-- 추가문의 끝 -->
				
				<!-- 목록 버튼 -->
			    <tr>
			   		<td colspan="7" class="text-end">
						<button type="button" class="btn active" data-bs-toggle="button" aria-pressed="true" id="qnaList">목록</button>
			  		</td>
			    </tr>
		    </tbody>
		</table>
		<!-- 문의내용 끝 -->
		
		<!-- 컨텐츠 끝 -->
	</div>
	
	<!-- footer 시작 -->
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	<!-- footer 끝 -->
</body>
</html>
