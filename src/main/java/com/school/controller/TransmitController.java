package com.school.controller;

import com.school.vo.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.HtmlUtils;

import java.util.Date;

@Controller
public class TransmitController {
    @RequestMapping("details")
    public String details(Model model){
        return "details";
    }
    @ResponseBody
    @RequestMapping("aaa")
    public String aaa(String describlr){
        System.out.println(describlr);
        System.out.println(HtmlUtils.htmlEscape(describlr,"utf-8"));
        describlr = HtmlUtils.htmlEscape(describlr,"utf-8");
        HtmlUtils.htmlEscapeDecimal(HtmlUtils.htmlEscapeDecimal(describlr,"utf-8"));
        return describlr;
    }
}
