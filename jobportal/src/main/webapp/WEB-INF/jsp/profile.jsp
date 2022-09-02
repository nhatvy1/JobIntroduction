<%--
    Document   : profile
    Created on : Aug 28, 2022, 12:03:42 AM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<h1 class="text-center">Trang cá nhân</h1>

<div class="container emp-profile border">
    <div class="row">
        <div class="col-md-4">
            <div class="profile-img profile">
                <img src="${currentUser.image}" alt="${currentUser.name}"/>
            </div>
        </div>
        <div class="col-md-6">
            <div class="profile-head">
                <h5>
                    ${currentUser.name}
                </h5>
                <h6>
                    Web Developer
                </h6>
                <p class="proile-rating">RANKINGS : <span>8/10</span></p>
                <ul class="nav nav-tabs" id="myTab" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link text-primary" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Thông tin</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-dark" id="profile-ta  b" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">Kinh nghiệm</a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="col-md-2">
            <div id="edit" class="profile-edit-btn border border-secondary text-center">
                <a class="text-dark" href="<c:url value="/editprofile"/>">Edit profile</a>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4">
            <div class="profile-work">
                <p>WORK LINK</p>
                <a href="">Website Link</a><br/>
                <a href="">Bootsnipp Profile</a><br/>
                <a href="">Bootply Profile</a>
                <p>SKILLS</p>
                <a href="">Web Designer</a><br/>
                <a href="">Web Developer</a><br/>
                <a href="">WordPress</a><br/>
                <a href="">WooCommerce</a><br/>
                <a href="">PHP, .Net</a><br/>
            </div>
        </div>
        <div class="col-md-8">
            <div class="tab-content profile-tab" id="myTabContent">
                <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                    <div class="row">
                        <div class="col-md-6">
                            <label>UserID</label>
                        </div>
                        <div class="col-md-6">
                            <p>${currentUser.id}</p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <label>Họ và tên</label>
                        </div>
                        <div class="col-md-6">
                            <p>Kshiti Ghelani</p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <label>Email</label>
                        </div>
                        <div class="col-md-6">
                            <p><p>${currentUser.email}</p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <label>Số điện thoại</label>
                        </div>
                        <div class="col-md-6">
                            <p>Chưa cập nhật</p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <label>Chức danh</label>
                        </div>
                        <div class="col-md-6">
                            <p>Web Developer</p>
                        </div>
                    </div>
                </div>
                <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                    <div class="row">
                        <div class="col-md-6">
                            <label>Experience</label>
                        </div>
                        <div class="col-md-6">
                            <p>An alternative to the translate() function is scale(). While translate() changes the shadow position along the x- and y-axes, scale() increases the size of the box along the x- and y-axes.</p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <label>Hourly Rate</label>
                        </div>
                        <div class="col-md-6">
                            <p>10$/hr</p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <label>Total Projects</label>
                        </div>
                        <div class="col-md-6">
                            <p>230</p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <label>English Level</label>
                        </div>
                        <div class="col-md-6">
                            <p>Expert</p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <label>Availability</label>
                        </div>
                        <div class="col-md-6">
                            <p>6 months</p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <label>Your Bio</label><br/>
                            <p>Your detail description</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>



