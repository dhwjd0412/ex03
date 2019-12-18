<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>주소목록</title>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
</head>
<body>
	<h1>[주소목록]</h1>
	<!-- 
	Total:${total} 
	<span id="paging"></span>
 	-->
<form name="frm" action="list" >
	<!--  <input type="text" name="page" value="${page}"> -->
	<select name="key">
		<option value="name"<c:out value="${key=='name'?'selected':'' }"/>>이름</option>
		<option value="address" <c:out value="${key=='address'?'selected':'' }"/>>주소</option> 
	</select>
	<input type="text" name="word" value="${word}">
	<input type="submit" value="검색">
	<input type="hidden" name="page" value="${page}">
	검색수:${total}
</form>
	
	<table border=1 width=600>
	<tr>
		<th>번호</th>
		<th>이름</th>
		<th>휴대전화</th>
		<th>주소</th>
	</tr>
	<c:forEach items="${list}" var="vo">
	<tr>
		<td>${vo.id }</td>
		<td>${vo.name }</td>
		<td>${vo.tel}</td>
		<td>${vo.address }</td>
	</tr>
	</c:forEach>
	</table>
	
	<button onClick="funPre()">◀</button>
	<button onClick="funNext()">▶</button>
	<span id="pasing"></span>
</body>
	<script>
		var page=${page};
		var totPage=${totPage}
		$("#pasing").html(page + "/" +totPage);
		
		
		function funPre(){
			if(page > 1){
				page=page-1;
				frm.page.value=page;	
				$("#pasing").html(page + "/" +totPage);
				frm.submit();
			}
			
		}
		function funNext(){
			if(page < totPage){
				page=page+1;
				frm.page.value=page;	
				$("#pasing").html(page + "/" +totPage);
				frm.submit();
			}
			
		}
	</script>
	<!-- 
	<script>
		var page=$(frm.page).val();

		var totPage=${totPage};
		/*
		if(totPage%10!=0){
			totPage=parseInt(totPage)+1;
		}
		*/
		$("#paging").html(page + "/" + totPage);	
		
		
		function funNext(){
			if(page< totPage){
				page=page+1;
				location.href='list?page=' +page;
				$("#paging").html(page + "/" + totPage);	
			}
				
		}
		function funPre(){
			if(page >1){
				page=page-1;
				location.href='list?page=' +page;	
				$("#paging").html(page + "/" + totPage);	
			}
		}
		
	</script>
	-->
</html>