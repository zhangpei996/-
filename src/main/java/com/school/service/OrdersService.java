package com.school.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.school.dao.ProductOrdersMapper;
import com.school.enums.StateStatus;
import com.school.utils.BaseResult;
import com.school.vo.Product;
import com.school.vo.ProductOrders;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;

@Service
public class OrdersService {
    @Autowired
    private ProductOrdersMapper productOrdersMapper;
    //更新订单状态
    public String updatestatus(ProductOrders productOrders) {
        productOrdersMapper.updateGoodsFlag(productOrders);
        if (productOrdersMapper.updateByPrimaryKeySelective(productOrders)>0){
            return "success";
        }else {
            return "error";
        }
    }

    //添加订单
    public ProductOrders saveOrder(ProductOrders productOrders) {
        productOrders.setCreateTime(new Date());
        productOrders.setFlag("1");
        productOrders.setOrderStatus(String.valueOf(StateStatus.UNPAID.getType()));
/*        productOrders.setOrderNo(orderNO());*/
        productOrdersMapper.insertSelective(productOrders);
        return productOrders;
    }
/*    //订单产生
    public String orderNO() {
        return LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMddHHmmss"));
    }*/

    //订单管理 分页
    public BaseResult search(ProductOrders productOrders){
        //开启分页
        PageHelper.startPage(productOrders.pageNum,productOrders.pageSize);
        List<ProductOrders> productOrder = productOrdersMapper.selectOrderPage(productOrders);
        PageInfo<ProductOrders> pageInfo = new PageInfo<>(productOrder);
        return BaseResult.success(pageInfo);
    }
    //订单管理 分页
    public BaseResult allorder(ProductOrders productOrders){
        //开启分页
        PageHelper.startPage(productOrders.pageNum,productOrders.pageSize);
        List<ProductOrders> productOrder = productOrdersMapper.selectALLPage(productOrders);
        PageInfo<ProductOrders> pageInfo = new PageInfo<>(productOrder);
        return BaseResult.success(pageInfo);
    }
}
