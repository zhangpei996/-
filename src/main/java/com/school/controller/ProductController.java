package com.school.controller;

import com.school.service.OrdersService;
import com.school.service.ProductService;
import com.school.service.TypeService;
import com.school.utils.BaseResult;
import com.school.vo.Product;
import com.school.vo.ProductOrders;
import com.school.vo.ProductType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
@Controller
public class ProductController {
    @Autowired
    private ProductService productService;
    @Autowired
    private FileController fileController;
    @Resource
    private TypeService typeService;
    @Resource
    private OrdersService ordersService;
    /**
     * 显示商品管理
     */
    @RequestMapping("show")
    public String show(Model model){
        model.addAttribute("changePage","promanage.ftl");
        return "index";
    }
    /**
     * 搜索全部商品
     */
    @ResponseBody
    @RequestMapping("list")
    public BaseResult search(Product product){
        return productService.search(product);
    }
    /**
     * 搜索全部商品
     * @param product
     * @return
     */
    @RequestMapping("selectProductAll")
    public String selectProductAll(Product product, Model model,String changePage){
       List<Product> products = productService.selectProductAll(product);
       model.addAttribute("products",products);
       if (!StringUtils.isEmpty(product.getId())){
           List<ProductType> productlists = typeService.productTypeAll();
           model.addAttribute("type",productlists);
           model.addAttribute("changePage",changePage);
           model.addAttribute("msg","商品信息修改");
       }else {
           model.addAttribute("changePage",changePage);
       }
       return "index";
    }

    /**
     * 添加商品
     * @param product
     * @param request
     * @return
     */
    @RequestMapping("saveProduct")
    public String saveProduct(Product product, HttpServletRequest request){
            String fileName = fileController.uploadFile(request);
            product.setPicture(fileName);
        if (StringUtils.isEmpty(product.getId())){
            Integer flag = productService.saveProduct(product);
        }else {
            Integer flag = productService.updateProduct(product);
        }
        return "redirect:selectProductAll";
    }
    @RequestMapping("test001")
    public String test(HttpServletRequest request){
        String no = request.getParameter("out_trade_no");
        ProductOrders productOrders = new ProductOrders();
        productOrders.setOrderNo(no);
        productOrders.setOrderStatus(0+"");
        ordersService.updatestatus(productOrders);
        System.out.println("同步通知"+no);
        return "forward:order/manage";
    }

    @ResponseBody
    @RequestMapping("test002")
    public String test01(HttpServletRequest request){
        String no = request.getParameter("out_trade_no");
        ProductOrders productOrders = new ProductOrders();
        productOrders.setOrderNo(no);
        productOrders.setOrderStatus(0+"");
        ordersService.updatestatus(productOrders);
        return "success";
    }
    //批量删除
    @ResponseBody
    @RequestMapping("deleteManyPro")
    public String deleteMany(String[] arr,Integer flag){
        return productService.deleteMany(arr,flag);
    }
}
