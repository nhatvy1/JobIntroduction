<%-- 
    Document   : login
    Created on : Aug 3, 2022, 7:13:58 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div class="container">
    <h1 class="text-center"><spring:message code="label.dangnhap"/></h1>
    <c:if test="${param.error != null}">
        <div class="alert alert-danger">
            Da co loi vui long quay lai sau
        </div>
    </c:if>
    <div class="card">
        <c:url value="/login" var="action" />
        <form method="post" action="${action}" class="p-5 mb-10">
            <div class="form-group">
                <label for="username"><spring:message code="label.username"/></label>
                <input type="text" name="username" class="form-control" id="username" placeholder="Enter username" />
                <small id="emailHelp" class="form-text text-muted"><spring:message code="label.small"/></small>
            </div>
            <div class="form-group">
                <label for="password"><spring:message code="label.password"/></label>
                <input type="password" name="password" class="form-control" id="password" placeholder="Password"/>
            </div>
            <div class="form-group">
                <input type="submit" class="dropdownCus btn" value="<spring:message code="label.login"/>"/>
            </div>
        </form>
    </div> 
</div>
