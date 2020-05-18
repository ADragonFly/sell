package com.imooc.sell.service.impl;

import com.imooc.sell.DTO.CartDTO;
import com.imooc.sell.dataobject.ProductInfo;
import com.imooc.sell.dataobject.dao.ProductCategoryDao;
import com.imooc.sell.enums.ProductStatusEnum;
import com.imooc.sell.enums.ResultEnum;
import com.imooc.sell.exception.SellException;
import com.imooc.sell.repository.ProductInfoRepository;
import com.imooc.sell.service.ProductService;
import com.imooc.sell.utils.EnumUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

/** ..
 * @author Administrator
 */
@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductInfoRepository repository;
//    @Autowired
//    private ProductCategoryDao productCategoryDao;

    /**
     * #sellerId  : SPEL表达式
     * @param productId
     * @return
     */
    @Override
//    @Cacheable(value = "product", key = "123")
    public ProductInfo findOne(String productId) {

        return repository.findById(productId).get();
    }

    @Override
    public List<ProductInfo> findUpAll() {
        return repository.findByProductStatus(ProductStatusEnum.UP.getCode());
    }

    @Override
    public Page<ProductInfo> findAll(Pageable pageable) {
        return repository.findAll(pageable);
    }

    @Override
//    @CachePut(value = "product" , key = "123")
    public ProductInfo save(ProductInfo productInfo) {
        return repository.save(productInfo);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void increaseStock(List<CartDTO> cartDTOList) {
        for (CartDTO cartDTO:cartDTOList
             ) {
            Optional<ProductInfo> productInfo = repository.findById(cartDTO.getProductId());
            if (productInfo.isPresent()){
                int result = productInfo.get().getProductStock() + cartDTO.getProductQuantity();
                productInfo.get().setProductStock(result);
            } else {
                throw new SellException(ResultEnum.PRODUCT_NOT_EXIT);
            }
        }

    }

    /**
     * @param cartDTOList
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public void decreaseStock(List<CartDTO> cartDTOList) {

        for (CartDTO cartDTO:cartDTOList){
            Optional<ProductInfo> productInfo = repository.findById(cartDTO.getProductId());
            if (productInfo.isPresent()){
                int result = productInfo.get().getProductStock() - cartDTO.getProductQuantity();
                if (result<0){
                    throw new SellException(ResultEnum.PRODUCT_STOCK_ERROR);
                }
                productInfo.get().setProductStock(result);
                repository.save(productInfo.get());
            }else{
                throw new SellException(ResultEnum.PRODUCT_NOT_EXIT);
            }

        }

    }

    @Override
    public ProductInfo onSale(String productId) {
        Optional<ProductInfo> productInfo = repository.findById(productId);
        if (productInfo.isPresent()) {
            if (productInfo.get().getProductStatusEnum() == ProductStatusEnum.UP){
                throw new SellException(ResultEnum.PRODUCT_STATUS_ERROR);
            }
            //更新
            productInfo.get().setProductStatus(ProductStatusEnum.UP.getCode());
            return repository.save(productInfo.get());
        }else{
            throw new SellException(ResultEnum.PRODUCT_NOT_EXIT);
        }
//        return null;
    }


    @Override
    public ProductInfo offSale(String productId) {

        Optional<ProductInfo> productInfo = repository.findById(productId);
        if (productInfo.isPresent()){
            if (productInfo.get().getProductStatusEnum() == ProductStatusEnum.DOWN){
                throw new SellException(ResultEnum.PRODUCT_STATUS_ERROR);
            }
            //更新
            productInfo.get().setProductStatus(ProductStatusEnum.DOWN.getCode());
            return repository.save(productInfo.get());
        }else {
            throw new SellException(ResultEnum.PRODUCT_STATUS_ERROR);
        }

    }
}
