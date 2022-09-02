package com.hnv.service.impl;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.hnv.pojo.Comment;
import com.hnv.pojo.JobPosting;
import com.hnv.repository.JobPostingRepository;
import com.hnv.service.JobPostingService;
import com.hnv.service.UserService;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

@Service
public class JobPostingServiceImpl implements JobPostingService {
    
    @Autowired
    private JobPostingRepository jobPostingRepository;
    @Autowired
    private Cloudinary cloudinary;
    @Autowired
    private UserService userService;
    
    @Override
    public Long countPosting() {
        return this.jobPostingRepository.countPosting();
    }
    
    @Override
    public List<JobPosting> getJobPosting(Map<String, String> params, int page) {
        return this.jobPostingRepository.getJobPosting(params, page);
    }
    
    @Override
    public boolean addPosting(JobPosting jobPosting) {
        jobPosting.setCreatedDate(new Date());
        
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        jobPosting.setUserId(this.userService.getUsers(authentication.getName()).get(0));
        
        try {
            Map res = this.cloudinary.uploader().upload(jobPosting.getFile().getBytes(),
                        ObjectUtils.asMap("resource_type", "auto"));
            jobPosting.setImage(res.get("secure_url").toString());
            
            return this.jobPostingRepository.addPosting(jobPosting);
        }catch(IOException e) {
            System.out.println("add posting");
                        System.out.println("add posting");
            System.out.println("add posting");
            System.out.println("add posting");
            System.out.println("add posting");
            System.out.println("add posting");

            System.out.println("add posting" + e.getMessage());
        }
            
        return false;
    }
    
    @Override
    public JobPosting getJobPostingById(int postingId) {
        return this.jobPostingRepository.getJobPostingById(postingId);
    }

    @Override
    public List<Comment> getComments(int jobPostingId) {
        return this.jobPostingRepository.getComments(jobPostingId);
    }
}
