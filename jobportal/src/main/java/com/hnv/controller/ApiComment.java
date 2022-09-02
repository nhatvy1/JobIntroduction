package com.hnv.controller;

import com.hnv.pojo.Comment;
import com.hnv.service.JobPostingService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
public class ApiComment {
    @Autowired
    private JobPostingService jobPostingService;
    
    @GetMapping("/postingDetail/{postingId}/comments")
    public ResponseEntity<List<Comment>> getComments(@PathVariable(value = "postingId") int postingId) {
        return new ResponseEntity<>(this.jobPostingService.getComments(postingId), HttpStatus.OK);
    }
}
