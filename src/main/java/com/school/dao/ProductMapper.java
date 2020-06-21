package com.school.dao;

import com.school.base.BaseDao;
import com.school.vo.Product;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ProductMapper extends BaseDao<Product,Integer> {

    List<Product> selectProductAll(Product product);
    //批量删除
    Integer updateMany(@Param("flag") Integer flag,@Param("ids") String[] arr);

    List<Product> selectProductZaiXian(Product product);
}