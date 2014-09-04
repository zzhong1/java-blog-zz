<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="../layout/taglib.jsp"%>

<h1>
	${user.name}
</h1>
<!-- Button trigger modal -->
<button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
  New Blog
</button>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="myModalLabel">Modal title</h4>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
<c:forEach items="${user.blogs}" var ="blog">
	<h1>${blog.name}</h1>
	<p>${blog.url}</p>
	
	<table class="table table-bordered table-hover table-striped">
		<thead>
		
			<tr>
				<th>Title</th>
				<th>Link</th>
			
			</tr>
		
		</thead>
		<tbody>
			<c:forEach items="${blog.items}" var="item">
				<tr>
				<td>${item.title}</td>
				<td>${item.link}</td>
				</tr>
			
			</c:forEach>
		</tbody>
	
	</table>


</c:forEach>