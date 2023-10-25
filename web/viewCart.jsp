<%-- 
    Document   : viewCart.jsp
    Created on : Oct 16, 2023, 8:04:12 AM
    Author     : PC
--%>

<%@page import="java.util.Map"%>
<%@page import="com.thiennl.cart.CartObject"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Cart Page</title>
</head>
<body>

</body>
<c:set var="cart" value="${sessionScope.CART}" />
<c:if test="${ not empty cart}">
    <c:set var="item" value="${cart.getItem()}" />
    <c:choose>
        <c:when test="${not empty item}">
            <table border="1">
                <thead>
                    <tr>
                        <th>No.</th>
                        <th>Name</th>
                        <th>Quantity</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                <form action="DispatchServlet">
                    <c:forEach items="${item}" var="dto" varStatus="counter">
                        <tr>
                            <td>${counter.count}</td>

                            <td>${dto.key}
                                <input type="hidden" name="ddlBook" 
                                       value="${dto.key}" </td>

                            <td>${dto.value}</td>

                            <td>
                                <input type="submit" value="Remove Item" name="btAction" />
                            </td>

                        </tr>
                    </c:forEach>
                </form>
            </tbody>
        </table>
    </c:when>
    <c:when test="${empty item}">
        <h2 style="color: red"> No Items In Cart !!! </h2>
    </c:when>  
</c:choose>
</c:if>


</body>
<%--
    //1.Customer go to cart place
    if (session != null) {
        //2. Cust take cart
        CartObject cart = (CartObject) session.getAttribute("CART");
        if (cart != null) {
            //3. get all items
            Map<String, Integer> items = cart.getItem();
            if (items != null) {
--%>


<%--
                return;
            }
        }
//            }//end cart place
--%>




