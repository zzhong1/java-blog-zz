<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="../layout/taglib.jsp"%>

<table class="table table-bordered table-hover table-striped">
	<thead>
		<tr>
			<th>user name</th>
		</tr>
	</thead>
	
	<tbody>
		<c:forEach items="${users}" var = "user">
		<tr>
			<td>
				<a href="<spring:url value='/users/${user.id }.html'/>">
								${user.name}
				</a>
			</td>
		
		</tr>
		
		</c:forEach>
	
	</tbody>


</table>