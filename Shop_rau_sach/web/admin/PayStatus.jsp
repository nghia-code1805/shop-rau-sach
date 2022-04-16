<%-- 
    Document   : PayStatus
    Created on : Apr 16, 2022, 10:46:23 AM
    Author     : NhaBaoViec
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include  file="Header.jsp" %>

<%@include  file="Slidebar.jsp" %>
    
<div class="col-sm-9 padding-right">
    <div class="col-sm-8">
        <div class="product-information">
            <form action="PayStatus" method="post" enctype="multipart/form-data">
                <h2>Customer's product has been successfully paid for tamfood</h2>
                <a name="gId">${generalHistoryPay.gId}</a>
                <a name="uId">${generalHistoryPay.uId}</a>
                <a name="uName">${generalHistoryPay.uName}</a>
                <a name="gTotal">${generalHistoryPay.gTotal}</a>
                <a name="gPaymentStatus">${generalHistoryPay.gPaymentStatus}</a>
                <a name="gGrossProduct">${generalHistoryPay.gGrossProduct}</a>
                <button type="submit" class="btn btn-success">Pay</button>
            </form>
        </div>
    </div>
</div>
<%@include  file="Footer.jsp" %>
