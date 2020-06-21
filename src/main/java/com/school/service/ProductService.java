package com.school.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.school.dao.ProductMapper;
import com.school.utils.BaseResult;
import com.school.vo.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.util.HtmlUtils;

import java.util.Date;
import java.util.List;

@Service
public class ProductService {
    @Autowired
    private ProductMapper productMapper;
    //查询商品
    public List<Product> selectProductAll(Product product) {
        List<Product> products = productMapper.selectProductZaiXian(product);
/*        products.forEach(t->{
            if (!StringUtils.isEmpty(t.getDescribes())){
                t.setDescribes(HtmlUtils.htmlUnescape(t.getDescribes()));
            }
        });*/
        return products;
    }
    //商品管理 分页
    public BaseResult search(Product product){
        //开启分页
        if (product.getUid()==1){
            product.setUid(null);
        }
        PageHelper.startPage(product.pageNum,product.pageSize);
        List<Product> products = productMapper.selectProductAll(product);
        PageInfo<Product> pageInfo = new PageInfo<>(products);
        return BaseResult.success(pageInfo);
    }
    //保存商品
    public Integer saveProduct(Product product) {
        product.setCreateTime(new Date());
        product.setFlag(1);
        return productMapper.insertSelective(product);
    }
    //商品更新
    public Integer updateProduct(Product product){
        return productMapper.updateByPrimaryKeySelective(product);
    }

    //批量删除
    public String deleteMany(String[] arr,Integer flag){
        if (productMapper.updateMany(flag,arr)==arr.length){
            return "success";
        }
        return "error";
    }

}

