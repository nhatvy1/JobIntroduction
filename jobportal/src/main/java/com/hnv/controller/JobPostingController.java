package com.hnv.controller;

import com.hnv.pojo.JobPosting;
import com.hnv.service.JobPostingService;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
@ControllerAdvice
public class JobPostingController {

    @Autowired
    private JobPostingService jobPostingService;
//    @Autowired
//    private JobPostingNameValidator jobPostingNameValidator;
//    
//    @InitBinder
//    public void initBinder(WebDataBinder binder) {
//        binder.setValidator(jobPostingNameValidator);
//    }

    @GetMapping("/jobposting")
    public String jobPostingView(Model model) {
        model.addAttribute("posting", new JobPosting());
        return "jobposting";
    }

    @PostMapping("/jobposting")
    public String addPost(Model model, @ModelAttribute(value = "posting") @Valid JobPosting jobPosting,
            BindingResult result) {
        // chua xu ly ngoai le
        if (this.jobPostingService.addPosting(jobPosting) == true) {
            return "redirect:/jobs";
        }

        return "jobposting";
    }

    @GetMapping("/postingDetail/{postingId}")
    public String postingDetail(Model model, @PathVariable(value = "postingId") int postingId) {
        model.addAttribute("posting", this.jobPostingService.getJobPostingById(postingId));
        return "postingDetail";
    }
}
