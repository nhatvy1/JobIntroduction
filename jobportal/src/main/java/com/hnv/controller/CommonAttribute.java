package com.hnv.controller;

import com.hnv.service.JobCategoryService;
import com.hnv.service.JobPostingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

@Controller
@ControllerAdvice
public class CommonAttribute {

    @Autowired
    private JobCategoryService jobCategoryService;
    @Autowired
    private JobPostingService jobPostingService;

    @ModelAttribute
    public void commonAttr(Model model) {
        model.addAttribute("jobCategories", this.jobCategoryService.getJobCategories());
        model.addAttribute("postingCounter", this.jobPostingService.countPosting());
    }
}
