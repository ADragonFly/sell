<#--<h1>1111111111111111</h1>-->

<#--<#list orderDTOPage.document as orderDTO>-->
<#--    ${orderDTO.orderId} <br>-->
<#--</#list>-->


<html>
        <#include "../common/header.ftl">
        <body>


        <div id="wrapper" class="toggled">

<#--            边栏sidebar-->
            <#include "../common/nav.ftl">

<#--            主要内容区-->
            <div id="page-content-wrapper">

                <div class="container-fluid">

                        <div class="row clearfix">
                            <div class="col-md-12 column">
                                <form role="form" method="post" action="/sell/seller/product/save">
                                    <div class="form-group">
                                        <label >名称</label><input name="productId" type="text" class="form-control" value="${(productInfo.productName)!" "}"/>
                                    </div>

                                    <div class="form-group">
                                        <label >价格</label><input name="productPrice" type="text" class="form-control" value="${(productInfo.productPrice)!" "}"/>
                                    </div>
                                    <div class="form-group">
                                        <label >库存</label><input name="productStock" type="number" class="form-control" value="${(productInfo.productStock)!" "}"/>
                                    </div>
                                    <div class="form-group">
                                        <label >描述</label><input name="productDescription" type="text" class="form-control" value="${(productInfo.productDescription)!" "}"/>
                                    </div>
                                    <div class="form-group">
                                        <img height="100" width="100" src="${productInfo.productIcon!" "}" alt="">
                                        <label >图片</label><input name="productIcon" type="text" class="form-control" value="${(productInfo.productIcon)!" "}"/>
                                    </div>
                                    <div class="form-group">
                                        <label >类目</label>
                                        <select name="productCategory" class="form-control">
                                            <#list categoryList as category>
                                                <option value="${category.categoryType}"
                                                        <#if (productInfo.categoryType)?? && productInfo.categoryType == category.categoryType>
                                                            selected
                                                        </#if>
                                                >
                                                    ${category.categoryName}
                                                </option>
                                            </#list>
                                        </select>
                                        <input name="productCategory" type="text" class="form-control" value="${(proudctInfo.productCategory)!" "}"/>

                                    </div>

                                    <input hidden type="text" name="productId" value="${(productInfo.productId)!' '}">
                                     <button type="submit" class="btn btn-default">提交</button>
                                </form>
                            </div>
                        </div>


                </div>
            </div>

        </div>
        </body>
</html>



