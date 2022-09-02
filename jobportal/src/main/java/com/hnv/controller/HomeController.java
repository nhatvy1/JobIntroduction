
package com.hnv.controller;

import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
    @RequestMapping("/")
    public String index(Model model, HttpSession session) {
        model.addAttribute("msg", "Welcome to website");
        model.addAttribute("currentUser", session.getAttribute("currentUser"));
        return "index";
    }
}
