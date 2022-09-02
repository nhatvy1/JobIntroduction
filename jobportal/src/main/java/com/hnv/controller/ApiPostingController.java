package com.hnv.controller;

import com.hnv.pojo.JobCategory;
import com.hnv.pojo.JobPosting;
import com.hnv.pojo.User;
import com.hnv.service.JobCategoryService;
import com.hnv.service.JobPostingService;
import com.hnv.service.UserService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ApiPostingController {
    @Autowired
    private JobCategoryService jobCategoryService;
    @Autowired
    private JobPostingService jobPostingService;
    
    @GetMapping("/api/category")
    public ResponseEntity<List<JobCategory>> listJobCategory(){
        List<JobCategory> categories = this.jobCategoryService.getJobCategories();
        
        return new ResponseEntity<>(categories, HttpStatus.OK);
    }
    
    @GetMapping("/api/posting")
    public ResponseEntity<List<JobPosting>> listJobPosting() {
        List<JobPosting> posts = this.jobPostingService.getJobPosting(null, 1);
        
        return new ResponseEntity<>(posts, HttpStatus.OK);
    }
}
