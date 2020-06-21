package com.school.controller;

import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.school.alipay.AlipayConfig;
import com.school.service.OrdersService;
import com.school.utils.BaseResult;
import com.school.vo.ProductOrders;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.UnsupportedEncodingException;

//订单模块
@Controller

@RequestMapping("order")
public class OrdersController {
    @Autowired
    private OrdersService ordersService;

    //显示订单
    @RequestMapping("show")
    public String show(ProductOrders productOrders, Model model) {
        model.addAttribute("order", productOrders);
        return "pay";
    }

    //添加订单
    @RequestMapping(value = "save",produces ="text/html; charset=utf-8")
    @ResponseBody
    public String saveOrder(ProductOrders productOrders, Model model) {

          ordersService.saveOrder(productOrders);
        String result = pay(productOrders.getOrderNo(),productOrders.getGoodsMoney(),productOrders.getTitle());
          return result;
    }
/*    @RequestMapping(value = "save",produces ="text/html; charset=utf-8")
    @ResponseBody
    public String saveOrder() {
        return pay();
    }*/
    public String pay(String out_trade_no,double total_amount,String subject) {
/*    public String pay() {*/
        try {
            //获得初始化的AlipayClient
            AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id, AlipayConfig.merchant_private_key, "json", AlipayConfig.charset, AlipayConfig.alipay_public_key, AlipayConfig.sign_type);

            //设置请求参数
            AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
            alipayRequest.setReturnUrl(AlipayConfig.return_url);
            alipayRequest.setNotifyUrl(AlipayConfig.notify_url);
            //商户订单号，商户网站订单系统中唯一订单号，必填
//            String out_trade_no
            //付款金额，必填
//            int total_amount
            //订单名称，必填
//            String subject
            //商品描述，可空
            String body = "bbbbbbbbbbb";

            alipayRequest.setBizContent("{\"out_trade_no\":\"" + out_trade_no + "\","
                    + "\"total_amount\":\"" + total_amount + "\","
                    + "\"subject\":\"" + subject + "\","
                    + "\"body\":\"" + body + "\","
                    + "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");
            //请求

            String result = alipayClient.pageExecute(alipayRequest).getBody();
            return result;
        } catch (AlipayApiException e) {
            e.printStackTrace();
            return null;
        }
    }
    @ResponseBody
    @RequestMapping("list")
    public BaseResult search(ProductOrders productOrder){
        if (productOrder.getUid()==1){
            productOrder.setUid(null);
        }
        return ordersService.search(productOrder);
    }
    @RequestMapping("manage")
    public String show(Model model){
        model.addAttribute("changePage","ordermanage.ftl");
        return "index";
    }
    @RequestMapping("manages")
    public String showss(Model model){
        model.addAttribute("changePage","ordermanage2.ftl");
        return "index";
    }
    @ResponseBody
    @RequestMapping("update")
    public String update(ProductOrders productOrders){
        return ordersService.updatestatus(productOrders);
    }

    @ResponseBody
    @RequestMapping("allorder")
    public BaseResult allorder(ProductOrders productOrder){
        if (productOrder.getUid()==1){
            productOrder.setUid(null);
        }
        return ordersService.allorder(productOrder);
    }
}