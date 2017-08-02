<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>sns</title>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/index_reset.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/index.css?ver=7">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/index.js?ver=26"></script>
<script type="text/javascript">
	


</script>
</head>
<body>

	<!--상단바 시작-->
	<header>
		<h1></h1>
		<ul>
		<c:choose>
		
		<%-- 사용자 Header --%>
			<c:when test="${sessionScope.member.id != null && sessionScope.member.id ne 'admin'}">
				<c:set value="${totalList_login }" var="list"/>
				<li class="hd_user">
					<img src="${pageContext.request.contextPath }/resources/images/index_img/header_user.png">
					<span>${sessionScope.member.id }</span> 님 환영합니다.
				</li>
				
				<a href="${pageContext.request.contextPath }/member/searchForModify.do">
					<li><img src="${pageContext.request.contextPath }/resources/images/index_img/header_btn_1.png" alt="myInfo"></li>
				</a>
				
				<a href="${pageContext.request.contextPath }/member/myFriends.do">
					<li><img src="${pageContext.request.contextPath }/resources/images/index_img/header_btn_2.png" alt="friends"></li>
				</a>
				
				<a href="${pageContext.request.contextPath }/member/myReport.do">
					<li><img src="${pageContext.request.contextPath }/resources/images/index_img/header_btn_3.png" alt="reportList"></li>
				</a>
				
				<a href="${pageContext.request.contextPath }/member/myBlockList.do">
					<li><img src="${pageContext.request.contextPath }/resources/images/index_img/header_btn_5.png" alt="blockList"></li>
				</a>
				
				<a href="${pageContext.request.contextPath }/member/logout.do">
					<li class="logout"><img src="${pageContext.request.contextPath }/resources/images/index_img/header_btn_4.png" alt="logout"></li>
				</a> 
			</c:when>
		
			<%--관리자 Header --%>
			<c:when test="${sessionScope.member.id != null && sessionScope.member.id eq 'admin'}">
				<c:set value="${totalList_login }" var="list"/>
				<li class="hd_admin">
					<img src="${pageContext.request.contextPath }/resources/images/index_img/header_user.png">
					<span>${sessionScope.member.id }</span> 님 환영합니다.
				</li>
				
				<a href="${pageContext.request.contextPath }/admin/allMemberList.do">
					<li><img src="${pageContext.request.contextPath }/resources/images/index_img/header_btn_2.png" alt="member_All"></li>
				</a>
				
				<a href="${pageContext.request.contextPath }/admin/allReportRequestList.do">
					<li><img src="${pageContext.request.contextPath }/resources/images/index_img/header_btn_3.png" alt="report_All"></li>
				</a>
				
				<a href="${pageContext.request.contextPath }/admin/banMemberList.do">
					<li><img src="${pageContext.request.contextPath }/resources/images/index_img/header_btn_5.png" alt="blockMember_List"></li>
				</a>
				
				<a href="${pageContext.request.contextPath }/member/logout.do" >
					<li class="logout"><img src="${pageContext.request.contextPath }/resources/images/index_img/header_btn_4.png" alt="logout"></li>
				</a>
			</c:when>
			
			<c:otherwise>
			<c:set value="${totalList_noLogin }" var="list"/>
				<a href="${pageContext.request.contextPath }/member/loginPage.do"><li><img src="${pageContext.request.contextPath }/resources/images/index_img/header_btn_6.png" alt="로그인"></li></a>
			</c:otherwise>
		</c:choose>
		</ul>
	</header>
<!--상단바 끝-->
	
	
	<section>
		<c:if test = "${sessionScope.member.id != null && sessionScope.member.id ne 'admin'}">
	  	<div class="btn_wrap11">
	  
			<!--버튼 시작-->
			<ul class="btn_wrap">
				<a href="${pageContext.request.contextPath }/board/writeForm.do"><li class="s_t_btn_1">글쓰기</li></a>
				<a href="#"><li class="s_t_btn_2">btn</li></a>
				<a href="#"><li class="s_t_btn_3">btn</li>	</a>
				<a href="#"><li class="s_t_btn_4">btn</li></a>
				<a href="#"><li class="s_t_btn_5">btn</li></a>
			</ul>
		</div>
		<!--버튼 끝-->
		</c:if>
		
		<!--내용 시작-->
		<c:forEach var="totalList" items="${list }">
		<article>
			<div class="article_1"><!-- resources/css/index.css -->
			
			<ul>
				<li class="profile_img">
<!-- 					<a href="#"></a> -->
					<img src="/sns/resources/images/member_img/${totalList.board.member.img }" width="50px" height="50px"/>
					<a href="#">${totalList.board.writer }</a> 님이 글을 게시했습니다. ${totalList.board.board_date }</li>
					<li class="more"></li><!-- 하나만 눌러도 전부 이벤트 호출됨  .. 해결가능함 -->
					<li class="like"></li>
					
			</ul>
			
			<ul class="sub">
					<li><a href="${pageContext.request.contextPath}/member/block.do?target=${totalList.board.writer}" class = "block_user">차단하기</a></li>
					<li><a href="${pageContext.request.contextPath}/board/report.do?target=${totalList.board.writer}" class = "report_user">신고하기</a></li>
					<li><a class = "friendRequest_user">친구요청</a></li>	
					<c:choose>
					<c:when test="${sessionScope.member.id != null && sessionScope.member.id eq totalList.board.writer}">
					<li><a href="${pageContext.request.contextPath}/board/editForm.do?num=${totalList.board.num}" class = "updateBoard_user">글수정</a></li>
					<li><a href="${pageContext.request.contextPath}/board/delete.do?num=${totalList.board.num}" class = "deleteBoard_user">글삭제</a></li>
					</c:when>
					<c:otherwise><li><a class = "sorry">글삭제는 회원만 가능</a></li></c:otherwise>
					</c:choose>
			</ul>
			
			<!-- 내용이 들어가는 부분 -->
			<p>
				<span class="list_img">
					<img src="/sns/resources/images/board_img/${totalList.board.path }" style="width:150px; height:100%">
				</span>
				<span class="list_contet">
					<textarea name="content" readOnly>${totalList.board.content }</textarea> </span>
				<br><!-- 공란 --><br><!-- 공란 --></p>			
			</div>
			
			<!--  -------- article_1 (div) : 글을 쓴 부분 ---------------------- -->
			
			<!--  -------- article_2 (div) : 댓글 쓰는 부분 ---------------------- -->
			
			<div class="article_2">
			<!-- 보여주는 부분 -->
				<div id="rep_view_${totalList.board.num }">
					<ul>
						<c:forEach var = "reps" items="${totalList.replist }">
							<c:if test='${totalList.board.num == reps.board_num }'>
			                  
			                     <li>${reps.writer } : ${reps.content }</li>
				                     <c:if test='${sessionScope.member.id == reps.writer}'>
				                     	<li>
				                     		<input type="button" class="delete_rep" value = "delete" />
				                     		<input type="hidden" class="rep_num" value="${reps.num }"/>
				                     		<input type="hidden" class="board_num" value="${totalList.board.num}"/>
				                     		<input type="hidden" class="member_id" value="${sessionScope.member.id}"/>
				                     	</li>
<%-- 				                     	<li class="update_rep">update<input type="hidden" class="" value="${reps}"/></li> --%>
				                     </c:if>
<%-- 			                     	<li><input type="button" value="report" onclick="report_rep('${reps}')"/></li> --%>

			            </c:if>
			           </c:forEach>
		           </ul>
				</div>
				
			<!-- 작성 부분 -->
				<form method="post" id="rep_submit_${totalList.board.num }" name="repForm" >
	        		<fieldset>
<%-- 	        			<input type="hidden" name="writer" class="writer" value="${member.id}"/> --%>
<%-- 	        			<input type="hidden" name="board_num" class="board_num" value="${totalList.board.num }"/> --%>
	                 	<input type="checkbox" name="checkbox"/>비밀댓글
	                 	<input type="text" placeholder="댓글을 입력하세요..." name="content"  class="content" id="private_rep">
<%-- 	                    <input type="button" class="write_rep" onclick="writerep('${member.id }', '${totalList.board.num }', this.form.content.value)"/> --%>
						<input type="button" class="write_rep" onclick="write_rep('${totalList.board.num}', '${member.id }', this.form.content.value)"/>
	           		</fieldset>
	           	</form>
				
			</div>
			
			<!--  -------- article_2 (div) 댓글 부분 ---------------------- -->
			
		</article>
		<!--내용 끝-->
		
		</c:forEach>

	</section>
	
	<footer>
		
	</footer>
	
</body>
</html>