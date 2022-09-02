package com.hnv.controller;

import com.hnv.service.JobCategoryService;
import com.hnv.service.JobPostingService;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class JobController {
    @Autowired
    private JobCategoryService jobCategoryService;
    
    @Autowired
    private JobPostingService jobPostingService;
    
    @RequestMapping("/jobs")
    public String jobs(Model model, @RequestParam Map<String, String> params) {
        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        model.addAttribute("posts", this.jobPostingService.getJobPosting(params, page));
        return "jobs";
    }
}
