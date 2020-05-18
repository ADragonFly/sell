package com.imooc.sell.dataobject.mapper;

import com.imooc.sell.dataobject.ProductCategory;
import org.apache.ibatis.annotations.*;

import java.util.List;
import java.util.Map;

/**
 * @author Administrator
 */
public interface ProductCategoryMapper {

    /**
     * 插入
     * @param map
     * @return
     */
    @Insert("insert into product_category (category_name, category_type) values (#{category_name,jdbcType=VARCHAR}, #{category_type,jdbcType=Integer})")
    int insertByMap(Map<String , Object> map);

    @Insert("insert into product_category (category_name, category_type) values (#{categoryName,jdbcType=VARCHAR}, #{categoryType,jdbcType=Integer})")
    int insertByObject(ProductCategory productCategory);

    @Select("select * from product_category where categoryType = #{categoryType}")
    @Results(value = {@Result(column = "category_id",property = "categoryId"),
    @Result(column = "category_name",property = "categoryName"),
    @Result(column = "category_type",property = "categoryType")})
    ProductCategory findByCategoryType(Integer categoryType) ;
    List<ProductCategory> findByCategoryName (String CategoryName);
    @Update("update categoryType set category_name = #{categoryName} where category_type = #{categoryType}")
    int updateByCategoryType(@Param("categoryName") String categoryName , @Param("categoryType") Integer categoryType);

    ProductCategory selectByCategoryType(Integer categoryType);



}