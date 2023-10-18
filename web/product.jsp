<%-- 
    Document   : product
    Created on : Oct 12, 2023, 3:23:28 PM
    Author     : PC
--%>

<%@page import="com.thiennl.product.ProductDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product</title>
    </head>
    <body>
        <form action="DispatchServlet">
            <input type="submit" value="Show" name="btAction" />
        </form>
        
        <%
            List<ProductDTO> result = (List<ProductDTO>) request.getAttribute("PRODUCT_LIST");
            if (result != null) { // has one or more records

        %>

        <table border="1" align="center">
            <thead>
                <tr>
                    <th>No.</th>
                    <th>Name</th>
                    <th>Description</th>
                    <th>Price</th>
                    <th>Action</th>

                </tr>
            </thead>
            <tbody>
                <%                    int count = 0;
                    for (ProductDTO dto : result) {
                %>
            <form action="DispatchServlet" method="POST">
                <tr>
                    <td><%=++count%></td>
                
                    <td><%=dto.getName() %></td>
                
                
                    <td><%=dto.getDescription() %></td>
                
                
                    <td><%=dto.getUnitPrice() %></td>
                
                
                    <td><input type="submit" value="AddToCart" name="btAction" /> </td>
                </tr>
            </form>    
    <%
        }
    %>
        </tbody>
    </table>





    <%
    } else {
    %>
    <h2>No Record is matched !!!</h2>
    <%
        }
    %>
</body>
</html>
