<%-- 
    Document   : admin
    Created on : Aug 25, 2022, 10:44:16 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<h1 class="text-center">Quản lý danh mục</h1>

<c:if test="${msg != null}">
    <div class="alert alert-success">${msg}</div>
</c:if>
<c:url value="/jobCategories" var="action"/>
<div class="container mb-100">
    <form:form method="post" var="${action}" modelAttribute="category">
        <div class="form-group">
            <label for="name">Ten san pham</label>
            <form:input type="text" class="form-control" path="name" id="name" placeholder="Enter name" />
            <form:errors path="name" element="span" cssClass="text-danger" />
        </div>

        <input type="submit" value="Thêm danh mục">
    </form:form>
</div>