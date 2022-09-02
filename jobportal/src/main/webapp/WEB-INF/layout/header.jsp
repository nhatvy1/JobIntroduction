<%-- 
    Document   : header
    Created on : Aug 1, 2022, 10:03:03 AM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<header>
    <!-- Header Start -->
    <div class="header-area header-transparrent">
        <div class="headder-top header-sticky">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-3 col-md-2">
                        <!-- Logo -->
                        <div class="logo">
                            <a href="<c:url value="/"/>"><img src="<c:url value="/images/logo/logo.png"/>" /></a>
                        </div>  
                    </div>
                    <div class="col-lg-9 col-md-9">
                        <div class="menu-wrapper">
                            <!-- Main-menu -->
                            <div class="main-menu">
                                <nav class="d-none d-lg-block">
                                    <ul id="navigation">
                                        <li><a href="<c:url value="/"/>">Trang chủ</a></li>
                                        <li><a href="<c:url value="/jobs"/>">Tìm việc làm</a></li>
                                            <c:if test="${currentUser.userRole != 'ROLE_ADMIN'}">
                                            <li><a href="#">Bài viết</a>
                                                <ul class="submenu">
                                                    <li><a href="blog.html">Blog</a></li>
                                                    <li><a href="single-blog.html">Blog Details</a></li>
                                                    <li><a href="job_details.html">Chi tiết việc làm</a></li>
                                                    <li><a href="blog.html">Về chúng tôi</a></li>
                                                </ul>
                                            </li>
                                        </c:if>
                                        <c:if test="${pageContext.request.userPrincipal.name == null}">
                                            <li><a href="<c:url value="/register" />" class="d-lg-none border border-danger head-btn1" style="background-color: #fb246a;color: white;">Đăng ký</a></li>
                                            <li><a href="<c:url value="/login" />" class="d-lg-none border border-danger head-btn2 ">Đăng nhập</a></li>
                                            </c:if>

                                        <c:if test="${currentUser.userRole == 'ROLE_EMPLOYER'}">
                                            <li><a href="<c:url value="/jobposting"/>">Đăng bài</a></li>
                                            </c:if>

                                        <c:if test="${currentUser.userRole == 'ROLE_ADMIN'}">
                                            <li><a href="<c:url value="/admin/jobCategories"/>">Thêm danh mục</a></li>
                                            <li><a href="<c:url value="/admin/stats"/>">Thống kê</a></li>
                                        </c:if>

                                        <c:if test="${pageContext.request.userPrincipal.name != null}">
                                            <a href="<c:url value="/profile/"/>" class="border d-lg-none text-dark">
                                                <c:choose>
                                                    <c:when test="${currentUser.image != null}">
                                                        <img src="${currentUser.image}" class="avatar mr-10">
                                                    </c:when>
                                                    <c:when test="${currentUser.image == null}">
                                                        <img src="<c:url value="/images/banner/dog.png"/>" class="avatar mr-10">
                                                    </c:when>
                                                </c:choose>
                                                ${currentUser.name}
                                            </a>
                                            <a href="<c:url value="/logout"/>" class="text-danger d-lg-none" style="color: black;text-decoration: underline;margin-left: 20px;">Đăng xuất</a>
                                        </c:if>
                                    </ul>
                                </nav>
                            </div>          
                            <!-- Header-btn -->
                            <div class="header-btn d-none f-right d-lg-block">
                                <c:if test="${pageContext.request.userPrincipal.name == null}">
                                    <a href="<c:url value="/register" />" class="btn head-btn1">Đăng ký</a>
                                    <a href="<c:url value="/login" />" class="btn head-btn2">Đăng nhập</a>
                                </c:if>
                                <c:if test="${pageContext.request.userPrincipal.name != null}">
                                    <a href="<c:url value="/profile"/>" class="text-dark">
                                        <c:choose>
                                            <c:when test="${currentUser.image != null}">
                                                <img src="${currentUser.image}" class="avatar mr-10">
                                            </c:when>
                                            <c:when test="${currentUser.image == null}">
                                                <img src="<c:url value="/images/banner/dog.png"/>" class="avatar mr-10">
                                            </c:when>
                                        </c:choose>
                                        ${currentUser.name}
                                    </a>
                                    <a href="<c:url value="/logout"/>" class="" style="color: #fb246a;text-decoration: underline;margin-left: 20px;">Đăng xuất</a>
                                </c:if>
                            </div>
                        </div>
                    </div>
                    <!-- Mobile Menu -->
                    <div class="col-12">
                        <div class="mobile_menu d-block d-lg-none"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>