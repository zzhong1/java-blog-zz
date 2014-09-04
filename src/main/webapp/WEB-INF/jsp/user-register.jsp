<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="../layout/taglib.jsp"%>

<form:form commandName="user" cssClss="form-horizontal" role="form">
	<c:if test="${param.success eq true}">
		<div class="alert alert-success">Registration Successful!</div>
	</c:if>
	<div class="form-group">
	
		    <label for="name" class="col-sm-2 control-label">name</label>
			<div class="col-sm-10">
      			<form:input path="name" cssClass="form-control"/>
      			
    		</div>
	
	</div>
	<div class="form-group">
		    <label for="email" class="col-sm-2 control-label">email</label>
			<div class="col-sm-10">
      			<form:input path="email" cssClass="form-control"/>
      			
    		</div>
	
	</div>
<br>
	<div class="form-group">
		    <label for="password" class="col-sm-2 control-label">password</label>
			<div class="col-sm-10">
      			<form:password path="password" cssClass="form-control"/>
      			
    		</div>
	
	</div>
<br>
	<div class="form-group">
			<div class="col-sm-10">
      			<input type="submit" value="Save" class="btn btn-default">
      			
    		</div>
	
	</div>
</form:form>