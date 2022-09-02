<%-- 
    Document   : jobposting
    Created on : Aug 24, 2022, 9:27:29 AM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<div class="container">
    <h1 class="text-center">Đăng bài tuyển dụng</h1>
    <div class="card">
        <c:url value="/jobposting" var="action"/>
        <form:form method="post" action="${action}" modelAttribute="posting" enctype="multipart/form-data" class="p-5">
            <form:errors path="*" cssClass="alert alert-danger" element="div"/>
            <div class="form-group">
                <label for="name">Job title</label>
                <form:input type="text" class="form-control" path="name" id="name" placeholder="Enter name" />
                <form:errors path="name" cssClass="text-danger" element="span"/>
            </div>
            <div class="form-group">
                <label for="description">Description</label>
                <form:input type="area" path="description" class="description" id="description" />
                <%--<form:input type="text" class="form-control" path="description" id="name" placeholder="Enter description" />--%>
            </div>
            <div class="form-group">
                <label for="experience">Experience</label>
                <form:input type="area" path="experience" class="experience" id="description" />
                <%--<form:input type="text" class="form-control" path="experience" id="name" placeholder="Enter experience" />--%>
            </div>
            <div class="form-group">
                <label for="file">Image</label>
                <form:input type="file" class="form-control" path="file" id="name" />
            </div>
            <div class="form-group">
                <label for="salary">Salary</label>
                <form:input type="text" class="form-control" path="salary" id="name" placeholder="Enter salary" />
            </div>
            <div class="form-group">
                <label for="jobLocation">Job Location</label>
                <form:input type="text" class="form-control" path="jobLocation" id="name" placeholder="Enter jobLocation" />
            </div>
            <div class="form-group">
                <label for="jobCategoryId">Job Category</label>
                <form:select class="form-control w-100 mb-20" path="jobCategoryId" id="jobCategoryId">
                    <c:forEach items="${jobCategories}" var="cate">
                        <form:option value="${cate.id}">${cate.name}</form:option>
                    </c:forEach>
                </form:select>
                <form:errors path="jobCategoryId" cssClass="text-danger" element="span"/>
            </div>
            <input type="submit" class="dropdownCus btn" value="Đăng bài"/>
        </form:form>
    </div>
</div>