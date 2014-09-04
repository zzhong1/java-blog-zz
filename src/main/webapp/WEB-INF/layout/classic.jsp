<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix = "tiles" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">

<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>
<tiles:getAsString name="title"/></title>
</head>
<body>
<%@ taglib uri="http://tiles.apache.org/tags-tiles-extras" prefix="tilesx" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<tilesx:useAttribute name="current"/>

 <div class="container">
  <!-- Static navbar -->
      <div class="navbar navbar-default" role="navigation">
        <div class="container-fluid">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href='<spring:url value="/" />'>ZZ study blog</a>
          </div>
          <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
              <li class="${current=='index' ? 'active':''}"><a href='<spring:url value="/" />'>Home</a></li>
              
              <security:authorize access="hasRole('ROLE_ADMIN')">
              	<li class="${current=='users' ? 'active':''}"><a href="<spring:url value='/users.html'/>">Users</a></li>
              
              </security:authorize>
              <security:authorize access="! isAuthenticated()">
                  <li class="${current=='register' ? 'active':''}"><a href="<spring:url value='/register.html'/>">Register</a></li>
              
                  <li class="${current=='login' ? 'active':''}"><a href="<spring:url value='/login.html'/>">Login</a></li>
              </security:authorize>
              <security:authorize access="isAuthenticated()">
                  <li class="${current=='users' ? 'active':''}"><a href="<spring:url value='/account.html'/>">My Account</a></li>
              
                  <li><a href="<spring:url value='/logout'/>">Logout</a></li>
              
              </security:authorize>
              
               </ul>
           
          </div><!--/.nav-collapse -->
        </div><!--/.container-fluid -->
      </div>
<tiles:insertAttribute name = "body"/>
<br>
<br>
<center>
	<tiles:insertAttribute name="footer"/>
</center>
</div>
</body>

</html>