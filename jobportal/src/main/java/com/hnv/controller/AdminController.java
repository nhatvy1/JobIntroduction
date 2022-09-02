package com.hnv.controller;

import com.hnv.pojo.JobCategory;
import com.hnv.service.JobCategoryService;
import com.hnv.service.UserService;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    private JobCategoryService jobCategoryService;
    @Autowired
    private UserService userService;
    
    @GetMapping("/jobCategories")
    public String jobCategories(Model model) {
        model.addAttribute("category", new JobCategory());
        return "jobCategories";
    }
    
    @PostMapping("/jobCategories")
    public String addJobCategories(Model model, @ModelAttribute(value = "category") @Valid JobCategory category, 
            BindingResult result) {
        if (result.hasErrors()) {
            return "jobCategories";
        }
        
        if (this.jobCategoryService.addJobCategory(category) == true) {
            return "redirect:/jobs";
        }
            
        return "jobCategories";
    }
    
    @GetMapping("/stats")
    public String stats(Model model) {
        model.addAttribute("countUser", this.userService.countUser());
        return "stats";
    }
}
