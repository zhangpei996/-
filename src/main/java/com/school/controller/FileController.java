package com.school.controller;

import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

@Controller
public class FileController {
    public String uploadFile(HttpServletRequest request){
        MultipartHttpServletRequest mr = (MultipartHttpServletRequest) request;
        MultipartFile file = mr.getFile("file");
        String path = request.getSession().getServletContext().getRealPath("/");
        File file1 = new File(path+"\\static\\upload");
        if (!file1.exists()){
            file1.mkdir();
        }

        String name = file.getOriginalFilename().substring( file.getOriginalFilename().lastIndexOf("."));
        String filename = UUID.randomUUID().toString()+name;
        try {
            file.transferTo(new File(file1,filename));
        } catch (IOException e) {
            e.printStackTrace();
        }
        /*file.getOriginalFilename().s(".");*/

        return  filename;
    }
    @RequestMapping("test")
    public String test(HttpServletRequest request){
        String path = request.getSession().getServletContext().getRealPath("/");
        System.out.println(path);
        return "aa";
    }

}
