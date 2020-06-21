package com.school.dao;

import com.school.base.BaseDao;
import com.school.vo.ProductOrders;

import java.util.List;

public interface ProductOrdersMapper extends BaseDao<ProductOrders,Integer> {
    List<ProductOrders> selectOrderPage(ProductOrders productOrders);
    List<ProductOrders> selectALLPage(ProductOrders productOrders);
    int updateByPrimaryKeySelective(ProductOrders productOrders);
    int updateGoodsFlag(ProductOrders productOrders);

}