<%-- 
    Document   : viewCart.jsp
    Created on : Oct 16, 2023, 8:04:12 AM
    Author     : PC
--%>

<%@page import="java.util.Map"%>
<%@page import="com.thiennl.cart.CartObject"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart Page</title>
    </head>
    <body>
        <%
        //1.Customer go to cart place
            if(session != null ){
                //2. Cust take cart
                CartObject cart = (CartObject)session.getAttribute("CART");
                if(cart != null){
                    //3. get all items
                    Map<String, Integer> items =  cart.getItem();
                    if(items != null){
                        %>
        
                        <table border="1">
                            <thead>
                                <tr>
                                    <th>No.</th>
                                    <th>Name</th>
                                    <th>Quantity</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                int count = 0;
                                for (String key : items.keySet()) {
                                        %>
                                <tr>
                                    <td><%= ++count%></td>
                                    
                                    <td><%= key %></td>
                                    
                                    <td><%= items.get(key) %></td>
                                </tr>
                                <%
                                    }
                                %>
                                
                                
                            </tbody>
                        </table>

        
        
        <%
                        
                        return ;
                    }
                }
            }//end cart place
        %>
        
        <h2>NO Cart !!!</h2>
    </body>
</html>
