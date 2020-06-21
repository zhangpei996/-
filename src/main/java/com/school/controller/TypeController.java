package com.school.controller;

import com.school.service.TypeService;
import com.school.vo.PostType;
import com.school.vo.Product;
import com.school.vo.ProductType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.Arrays;
import java.util.List;

@Controller
public class TypeController {
    @Resource
    private TypeService typeService;
    @RequestMapping("productTypeAll/{flag}")
    public String productTypeAll(@PathVariable Integer flag, Model model){
        if (flag == 1){
            List<ProductType> productlists = typeService.productTypeAll();
            model.addAttribute("type",productlists);
            model.addAttribute("changePage","upload.ftl");
            model.addAttribute("msg","发布商品");
            Product product = new Product();
            product.setGoodTypeId(10);
            model.addAttribute("products", Arrays.asList(product));
        }else if (flag ==2 ){
            List<PostType> notelists = typeService.noteTypeAll();
            model.addAttribute("type", notelists);
            model.addAttribute("changePage", "uploadnote.ftl");
            model.addAttribute("msg", "发布帖子");
        }
        return "index";
    }
}
