<%-- 
    Document   : Products
    Created on : Jul 17, 2020, 1:03:57 PM
    Author     : vinhhqce140143
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include  file="Header.jsp" %>

<%@include  file="Slidebar.jsp" %>
<div class="col-sm-9 padding-right">
    <h2>
        Products
        <a class="btn tbn-default" style="float: right" href="AddProduct.jsp">New Product</a>
    </h2>
    <div class="table-responsive cart_info">
        <table class="table table-condensed">
            <thead>
                <tr class="cart_menu">
                    <td class="image">Item</td>
                    <td class="description">Name</td>
                    <td class="price">Price</td>
                    <td class="quantity">Quantity</td>
                    <td></td>
                </tr>
            </thead>
            <tbody>
                <c:if test="${!empty requestScope.listOfProducts}">
                    <c:forEach items="${requestScope.listOfProducts}" var="product">
                        <tr>
                            <td class="cart_product">
                                <a href=""><img src="../${product.pImage}" alt=""/></a>
                            </td>
                            <td class="cart_description">
                                <p>${product.pName}</p>
                            </td>
                            <td class="cart_price">
                                <h4>$${product.pPrice}</h4>
                            </td>
                            <td class="cart_quantity">
                                <p>${product.pQuantity}</p>
                            </td>
                            <td class="cart_delete">
                                <a class="cart_quantity_delete" href="DeleteProduct?pId=${product.pId}"><i class="fa fa-times"></i></a>
                                <a class="cart_quantity_delete" href="AdminProduct?pId=${product.pId}"><i class="fa fa-pencil"></i></a>
                                <a class="cart_quantity_delete" href="AddSlider?pId=${product.pId}"><i class="fa fa-star"></i></a>
                            </td>
                        </tr>
                    </c:forEach>
                </c:if>
            </tbody>
        </table>
    </div>
    <ul class="pagination">
        <c:if test="${not empty query}">
            <c:set var="stringQuery" value="&cate=${query}"/>
        </c:if>

        <c:if test="${currentPage != 1}">
            <li><a href="AdminProductServlet?page=${currentPage - 1}${stringQuery}">&laquo;</a></li>
            </c:if>

        <c:forEach begin="1" end="${noOfPages}" var="i">
            <c:choose>
                <c:when test="${currentPage == i}">
                    <li class="active"><a href="">${i}</a></li>
                    </c:when>
                    <c:otherwise>
                    <li><a href="AdminProductServlet?page=${i}${stringQuery}">${i}</a></li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>

        <c:if test="${currentPage lt noOfPages}">
            <li><a href="AdminProductServlet?page=${currentPage + 1}${stringQuery}">&raquo;</a></li>
            </c:if>
    </ul>
</div>
<%@include file="Footer.jsp" %>
<%@include file="Notify.jsp" %>
