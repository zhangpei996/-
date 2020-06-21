package com.school.dao;

import com.school.base.BaseDao;
import com.school.vo.ProductType;

import java.util.List;

public interface ProductTypeMapper extends BaseDao<ProductType,Integer> {


    List<ProductType> selectProductAll();
}