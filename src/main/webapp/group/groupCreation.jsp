<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="specialities" value="${pageContext.request.getAttribute('specialities')}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Group page</title>

    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/common.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/my.css" rel="stylesheet">
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.3/css/bootstrap-select.min.css" />
</head>

<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="mainNav">
    <div class="container">
        <a class="navbar-brand js-scroll-trigger" href="#page-top">DB Admin</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive"
                aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse text-right" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link js-scroll-trigger" href="${contextPath}/welcome">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link js-scroll-trigger" onclick="document.forms['logoutForm'].submit()">Logout</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<form id="logoutForm" method="POST" action="${contextPath}/logout">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>

<div class="container margin-table-view">

    <form:form method="POST" action="${contextPath}/group/create" modelAttribute="groupForm" class="form-signin">
        <h2 class="form-signin-heading">${groupForm.id != null ? 'Edit' : 'Create'} group</h2>

        <form:hidden path="id"/>

        <%--groupCode--%>
        <spring:bind path="groupCode">
            <div class="form-group ${status.error ? 'has-error' : ''}"> Group code:
                <form:input type="text" id = "groupCode" path="groupCode" class="form-control"
                            autofocus="true"/>
                <form:errors path="groupCode"/>
            </div>
        </spring:bind>

        <%--groupCreateDate--%>
        <spring:bind path="groupCreateDate">
            <div class="form-group ${status.error ? 'has-error' : ''}"> Group creation date:
                <form:input type="date" path="groupCreateDate" class="form-control" />
                <form:errors path="groupCreateDate"/>
            </div>
        </spring:bind>

        <button class="btn btn-lg btn-primary btn-block" type="submit">Submit</button>
    </form:form>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.3/js/bootstrap-select.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>

</body>
</html>
