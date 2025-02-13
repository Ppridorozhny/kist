<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Lesson page</title>

    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/common.css" rel="stylesheet">
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

    <div class="row">
        <div class="col-10">

            <form:form method="POST" action="${contextPath}/lesson/edit" modelAttribute="lessonForm"
                       class="form-signin">
                <h2 class="form-signin-heading">View lesson</h2>

                <form:hidden path="id"/>
                <form:hidden path="teacher.id"/>
                <form:hidden path="lessonKind.id"/>
                <form:hidden path="teacherPlan.id"/>

                <spring:bind path="teacher.name">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        Teacher name:<br>
                        <form:input type="text" path="teacher.name" class="form-control" placeholder="Teacher name"
                                    readonly="true"/>
                        <form:errors path="teacher.name"/>
                    </div>
                </spring:bind>
                <spring:bind path="teacher.surname">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        Teacher surname:<br>
                        <form:input type="text" path="teacher.surname" class="form-control"
                                    placeholder="Teacher surname"
                                    readonly="true"/>
                        <form:errors path="teacher.surname"/>
                    </div>
                </spring:bind>

                <spring:bind path="lessonKind.name">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        Lesson Kind:<br>
                        <form:input type="text" path="lessonKind.name" class="form-control" placeholder="Lesson Kind"
                                    readonly="true"/>
                        <form:errors path="lessonKind.name"/>
                    </div>
                </spring:bind>

                <%--hours--%>
                <spring:bind path="hours">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        Hours:<br>
                        <form:input type="text" path="hours" class="form-control" placeholder="Lesson hours"
                                    readonly="true"/>
                        <form:errors path="hours"/>
                    </div>
                </spring:bind>

                <button class="btn btn-lg btn-primary btn-block" type="submit">Edit</button>
            </form:form>
        </div>
        <div class="col-2 margin-view">
            <form:form method="DELETE" action="${contextPath}/lesson/${lessonForm.id}" modelAttribute="lessonForm"
                       class="form-signin">
                <button class="btn btn btn-danger btn-block" type="submit">Delete</button>
            </form:form>
            <form:form method="GET" action="${contextPath}/lesson/all" class="form-signin">
                <button class="btn btn btn-info btn-block" type="submit">View all lessons</button>
            </form:form>
        </div>
    </div>
</div>

<script src="${contextPath}/resources/js/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.js"></script>
</body>
</html>
