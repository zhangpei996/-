package com.school.service;

import com.school.dao.PostTypeMapper;
import com.school.dao.ProductMapper;
import com.school.dao.ProductTypeMapper;
import com.school.vo.PostType;
import com.school.vo.ProductType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class TypeService {
    @Autowired
    private ProductTypeMapper productTypeMapper;
    @Autowired
    private PostTypeMapper postTypeMapper;
    public List<ProductType> productTypeAll() {
        List<ProductType> productList = productTypeMapper.selectProductAll();
        return productList;
    }

    public List<PostType> noteTypeAll() {
        List<PostType> productList = postTypeMapper.selectPostTypeAll();
        return productList;
    }
}
