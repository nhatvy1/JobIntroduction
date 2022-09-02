package com.hnv.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ProfileController {
    
    @GetMapping("/profile")
    public String profile(Model model) {
        return "profile";
    }
    
    @GetMapping("/editprofile")
    public String editProfile() {
        return "editprofile";
    }
}
