//package com.hnv.validator;
//
//import com.hnv.pojo.JobPosting;
//import org.springframework.stereotype.Component;
//import org.springframework.validation.Errors;
//import org.springframework.validation.Validator;
//
//@Component
//public class JobPostingNameValidator implements Validator{
//
//    @Override
//    public boolean supports(Class<?> type) {
//        return JobPosting.class.isAssignableFrom(type);
//    }
//
//    @Override
//    public void validate(Object target, Errors errors) {
//        JobPosting jobPosting = (JobPosting) target;
//        if (!jobPosting.getName().contains("Company"))
//            errors.rejectValue("name", "posting.name.error");
//    }
//    
//}
