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
                                <a class="btn btn-danger" href="PaymentStaus?gId=${generalhistorypay.gId}">Payment Update</a>
                            </td>
                        </tr>
                    </c:forEach>
                </c:if>
            </tbody>
        </table>
    </div>
</div>