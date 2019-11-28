<%@ page import="com.peter.kist.model.enums.Sex" %>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<% pageContext.setAttribute("sexnEnum", Sex.values()); %>
<%@ page contentType="text/html;charset=utf-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Person page</title>
    <link href="${contextPath}/resources/css/styles.css" rel="stylesheet">
</head>

<body>
<div class = "mainmenu">
    <ul class = "list">
        <li><a class="link" href="${contextPath}/welcome">Home page</a></li>
        <li><a class="link" href="${contextPath}/queryY">Query</a></li>
        <li><form id="logoutForm" class="link" method="POST" action="${contextPath}/logout">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <a class="link" onclick="document.forms['logoutForm'].submit()">Logout</a>
        </form></li>
    </ul>
</div>
<div class="container">
    <form:form method="DELETE" action="${contextPath}/person/${personForm.id}" modelAttribute="personForm"
                                  class="form-signin">
    <button class="but" style="background-color:red;" type="submit">Delete</button>
</form:form>
    <form:form method="GET" action="${contextPath}/person/all" class="form-signin">
        <button class="but" style="background-color:lightblue;" type="submit">View all persons</button>
    </form:form>
    <hr>
    <div class="row">
        <div class="col-10">

            <form:form cssClass="f" method="POST" action="${contextPath}/person/edit" modelAttribute="personForm"
                       class="form-signin">
                <h2 class="form-signin-heading">View person</h2>

                <form:hidden path="id"/>

                <%--NAME--%>
                <spring:bind path="name">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        Person name:<br>
                        <form:input type="text" path="name" class="form-control" placeholder="Person name"
                                    autofocus="true" readonly="true"/>
                        <form:errors path="name"/>
                    </div>
                </spring:bind>

                <%--SURNAME--%>
                <spring:bind path="surname">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        Person surname:<br>
                        <form:input type="text" path="surname" class="form-control" placeholder="Person surname"
                                    readonly="true"/>
                        <form:errors path="surname"/>
                    </div>
                </spring:bind>

                <%--Address--%>
                <spring:bind path="address">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        Address:<br>
                        <form:input type="text" path="address" class="form-control" placeholder="Address"
                                    readonly="true"/>
                        <form:errors path="address"/>
                    </div>
                </spring:bind>

                <%--Sex--%>
                <spring:bind path="sex">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        Sex:<br>
                        <form:input type="text" path="sex" class="form-control" placeholder="Sex" readonly="true"/>
                    </div>
                </spring:bind>

                <%--Birth_date--%>
                <spring:bind path="birthDate">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        Student birth date:<br>
                        <form:input type="date" path="birthDate" class="form-control" readonly="true"/>
                        <form:errors path="birthDate"/>
                    </div>
                </spring:bind>

                <%--Birth_place--%>
                <spring:bind path="birthPlace">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        Birth place:<br>
                        <form:input type="text" path="birthPlace" class="form-control" placeholder="Birth place"
                                    readonly="true"/>
                        <form:errors path="birthPlace"/>
                    </div>
                </spring:bind>

                <%--Birth_place--%>
                <spring:bind path="telephoneNumber">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        Telephone Number:<br>
                        <form:input type="text" path="telephoneNumber" class="form-control"
                                    placeholder="Telephone Number" readonly="true"/>
                        <form:errors path="telephoneNumber"/>
                    </div>
                </spring:bind>

                <button class="but" type="submit">Edit</button>
            </form:form>
        </div>
        <div class="col-2 margin-view">

        </div>
    </div>
</div>

<script src="${contextPath}/resources/js/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.js"></script>
</body>
</html>
