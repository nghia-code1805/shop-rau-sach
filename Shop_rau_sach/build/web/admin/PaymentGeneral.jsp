<%-- 
    Document   : PaymentGeneral
    Created on : Apr 14, 2022, 5:28:36 PM
    Author     : NhaBaoViec
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="Header.jsp" %>

<%@include file="Slidebar.jsp" %>
<div class="col-sm-9 padding-right">
    <h2>Payment General</h2>
    <div class="table-responsive cart_info">
        <table class="table table-condensed">
            <thead>

                <tr class="cart_menu">
                    <td class="quantity">Payment General Id</td>
                    <td class="quantity">User Id</td>
                    <td class="quantity">User Name</td>
                    <td class="quantity">Total</td>
                    <td class="quantity">Payment Status</td>
                    <td class="quantity">Gross Product</td>
                    <td></td>
                </tr>

            </thead>

            <tbody>

                <c:if test="${!empty requestScope.listOfPayment}">

                    <c:forEach items="${requestScope.listOfPayment}" var="generalhistorypay">
                        <tr>
                            <td class="cart_quantity">
                                <p>${generalhistorypay.gId}</p>
                            </td>
                            <td class="cart_quantity">
                                <p>${generalhistorypay.uId}</p>
                            </td>
                            <td class="cart_quantity">
                                <p>${generalhistorypay.uName}</p>
                            </td>
                            <td class="cart_quantity">
                                <p>${generalhistorypay.gTotal}</p>
                            </td>
                            <td class="cart_quantity">
                                <p>${generalhistorypay.gPaymentStatus}</p>
                            </td>
                            <td class="cart_quantity">
                                <p>${generalhistorypay.gGrossProduct}</p>
                            </td>

                            <td class="cart_quantity">
                                <a class="btn btn-danger" href="PayStatus?gId=${generalhistorypay.gId}">Payment Update</a>
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
            <li><a href="AdminPaymentGeneralServlet?page=${currentPage - 1}${stringQuery}">&laquo;</a></li>
            </c:if>

        <c:forEach begin="1" end="${noOfPages}" var="i">
            <c:choose>
                <c:when test="${currentPage == i}">
                    <li class="active"><a href="">${i}</a></li>
                    </c:when>
                    <c:otherwise>
                    <li><a href="AdminPaymentGeneralServlet?page=${i}${stringQuery}">${i}</a></li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>

        <c:if test="${currentPage lt noOfPages}">
            <li><a href="AdminPaymentGeneralServlet?page=${currentPage + 1}${stringQuery}">&raquo;</a></li>
            </c:if>
    </ul>
</div>

<%@include file="Footer.jsp" %>

<%@include file="Notify.jsp" %>