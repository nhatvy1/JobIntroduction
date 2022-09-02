    <%-- 
    Document   : register
    Created on : Aug 3, 2022, 7:54:12 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<div class="container">
    <h1 class="text-center mt-100"><spring:message code="label.dangky"/></h1>
    <div class="card">
        <c:url value="/register" var="action" />

        <form:form method="post" action="${action}" enctype="multipart/form-data" modelAttribute="user" class="p-5">
            <div class="form-group">
                <label for="name">Name</label>
                <form:input type="text" class="form-control" path="name" id="name" aria-describedby="emailHelp" placeholder="Enter name" />
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <form:input type="email" path="email" class="form-control" id="email" placeholder="Enter email" />
            </div>
            <div class="form-group">
                <label for="username">Tài khoản</label>
                <form:input type="text" path="username" class="form-control" id="username" placeholder="Enter username" />
            </div>
            <div class="form-group">
                <label for="password">Mật khẩu</label>
                <form:input type="password" path="password" class="form-control" id="password" placeholder="Enter password" />
            </div>
            <div class="form-group">
                <label for="confirm-password">Xác nhận mật khẩu</label>
                <form:input type="password" path="confirmPassword" class="form-control" id="confirm-password" placeholder="Enter confirm password" />
                <c:if test="${errorMsg != null}">
                    <span class="text-danger">${errorMsg}</span>
                </c:if>
            </div>
            <div class="form-group">
                <label for="avatar">Avatar</label>
                <form:input type="file" path="file" class="form-control" id="avatar" />
            </div>
            <div class="form-group">
                <label for="userrole">Người dùng</label>
                <form:select class="form-control w-100 mb-20" path="userRole" id="userRole">
                    <form:option value="1">Người xin việc</form:option>
                    <form:option value="2">Nhà tuyển dụng</form:option>
                </form:select>
            </div>
            <input type="submit" class="dropdownCus btn" value="Đăng ký" />
        </form:form>
    </div> 
</div>
