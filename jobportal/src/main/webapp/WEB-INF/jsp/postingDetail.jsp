<%-- 
    Document   : postingDetail
    Created on : Aug 25, 2022, 11:37:44 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h1 class="text-center mt-50">Chi tiết tin tuyển dụng</h1>

<!-- job post company Start -->
<div class="job-post-company pt-120">
    <div class="container">
        <div class="row justify-content-between">
            <!-- Left Content -->
            <div class="col-xl-7 col-lg-8">
                <!-- job single -->
                <div class="single-job-items mb-50">
                    <div class="job-items">
                        <div class="company-img company-img-details">
                            <a href="#"><img class="anh borderAnh" src="${posting.image}" alt="${posting.name}"></a>
                        </div>
                        <div class="job-tittle">
                            <a href="#">
                                <h4>${posting.name}</h4>
                            </a>
                            <ul>
                                <li>Creative Agency</li>
                                <li><i class="fas fa-map-marker-alt"></i>${posting.jobLocation}</li>
                                <li>${posting.salary}</li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- job single End -->

                <div class="job-post-details">
                    <div class="post-details1 mb-50">
                        <!-- Small Section Tittle -->
                        <div class="small-section-tittle">
                            <h4>Job Description</h4>
                        </div>
                        <p>${posting.description}</p>
                    </div>
                    <div class="post-details2  mb-50">
                        <!-- Small Section Tittle -->
                        <div class="small-section-tittle">
                            <h4>Required Knowledge, Skills, and Abilities</h4>
                        </div>
                        <ul>
                            <li>System Software Development</li>
                            <li>Mobile Applicationin iOS/Android/Tizen or other platform</li>
                            <li>Research and code , libraries, APIs and frameworks</li>
                            <li>Strong knowledge on software development life cycle</li>
                            <li>Strong problem solving and debugging skills</li>
                        </ul>
                    </div>
                    <div class="post-details2  mb-50">
                        <!-- Small Section Tittle -->
                        <div class="small-section-tittle">
                            <h4>Education + Experience</h4>
                        </div>
                        <ul>
                            <li>${posting.experience}</li>

                            <!--                            <li>3 or more years of professional design experience</li>
                                                        <li>Direct response email experience</li>
                                                        <li>Ecommerce website design experience</li>
                                                        <li>Familiarity with mobile and web apps preferred</li>
                                                        <li>Experience using Invision a plus</li>-->
                        </ul>
                    </div>
                </div>

            </div>
            <!-- Right Content -->
            <div class="col-xl-4 col-lg-4">
                <div class="post-details3  mb-50">
                    <!-- Small Section Tittle -->
                    <div class="small-section-tittle">
                        <h4>Job Overview</h4>
                    </div>
                    <ul>
                        <li>Posted date : <span>12 Aug 2019</span></li>
                        <li>Location : <span>${posting.jobLocation}</span></li>
                        <li>Vacancy : <span>02</span></li>
                        <li>Job nature : <span>Full time</span></li>
                        <li>Salary :  <span>${posting.salary}</span></li>
                        <li>Application date : <span>12 Sep 2020</span></li>
                    </ul>
                    <div class="apply-btn2">
                        <a href="#" class="btn">Apply Now</a>
                    </div>
                </div>
                <div class="post-details4  mb-50">
                    <!-- Small Section Tittle -->
                    <div class="small-section-tittle">
                        <h4>Company Information</h4>
                    </div>
                    <span>Colorlib</span>
                    <p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.</p>
                    <ul>
                        <!--                        <li>Name: <span>Colorlib </span></li>
                                                <li>Web : <span> colorlib.com</span></li>-->
                        <li>Email: <span>1951052249vy@ou.edu.vn</span></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- job post company End -->

<!-- comment -->
<c:url value="/api/postingDetail/${posting.id}/comments" var="apiComment"/>

<div class="container">
    <div class="d-flex justify-content-center row">
        <!<!-- list comment -->
        <div class="col-md-8" id="comment">
            
        </div>
        
        <!--post comment -->
        <div class="col-md-8">
            <div class="bg-light p-2">
                <div class="d-flex flex-row align-items-start"><img class="rounded-circle" src="${currentUser.image}" width="40"><textarea class="form-control ml-1 shadow-none textarea"></textarea></div>
                <div class="mt-2 text-right">
                    <button class="btn " type="button">Post comment</button>
                    <button class="btn head-btn2" type="button">Cancel</button>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="<c:url value="/js/comment.js"/>"></script>
<script>
    window.onload = function() {
        loadComment('${apiComment}');
    }
</script>