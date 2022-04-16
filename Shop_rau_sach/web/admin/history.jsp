<%-- 
    Document   : history
    Created on : Jul 19, 2020, 11:42:13 PM
    Author     : vinhhqce140143
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="Header.jsp" %>

<%@include file="Slidebar.jsp" %>
<div class="col-sm-9 padding-right">
    <h2>History</h2>
    <div class="table-responsive cart_info">
        <table class="table table-condensed">
            <thead>

                <tr class="cart_menu">
                    <td class="quantity">HistoryId</td>
                    <td class="quantity">UserId</td>
                    <td class="quantity">User Name</td>
                    <td class="quantity">Total</td>
                    <td class="quantity">ProductId</td>
                    <td class="quantity">Date</td>
                    <td class="quantity">Quantity</td>
                    <td></td>
                </tr>

            </thead>
            <tbody>

                <c:if test="${!empty requestScope.listOfHistorys}">

                    <c:forEach items="${requestScope.listOfHistorys}" var="history">
                        <tr>
                            <td class="cart_quantity">
                                <p>${history.hId}</p>
                            </td>
                            <td class="cart_quantity">
                                <p>${history.uId}</p>
                            </td>
                            <td class="cart_quantity">
                                <p>${history.uName}</p>
                            </td>
                            <td class="cart_quantity">
                                <p>${history.uTotal}</p>
                            </td>
                            <td class="cart_quantity">
                                <p>${history.pId}</p>
                            </td>
                            <td class="cart_quantity">
                                <p>${history.hDate}</p>
                            </td>
                            <td class="cart_quantity">
                                <p>${history.hQuantity}</p>
                            </td>
<!--                            <td class="cart_quantity">
                                <a class="btn btn-danger" href="PaymentStaus?hId=${history.hId}">Payment Update</a>
                            </td>-->
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
            <li><a href="AdminHistoryServlet?page=${currentPage - 1}${stringQuery}">&laquo;</a></li>
            </c:if>

        <c:forEach begin="1" end="${noOfPages}" var="i">
            <c:choose>
                <c:when test="${currentPage == i}">
                    <li class="active"><a href="">${i}</a></li>
                    </c:when>
                    <c:otherwise>
                    <li><a href="AdminHistoryServlet?page=${i}${stringQuery}">${i}</a></li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>

        <c:if test="${currentPage lt noOfPages}">
            <li><a href="AdminHistoryServlet?page=${currentPage + 1}${stringQuery}">&raquo;</a></li>
            </c:if>
    </ul>
</div>
<%@include  file="Footer.jsp" %>

<%@include  file="Notify.jsp" %>
