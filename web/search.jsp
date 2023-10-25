<%-- 
    Document   : search
    Created on : Oct 5, 2023, 7:17:25 AM
    Author     : PC
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.thiennl.registration.RegistrationDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search</title>
    </head>
    <body>
        Welcome, ${sessionScope.USER_INFO.fullname}
        <form action="DispatchServlet">
            Search value <input type="text" name="txtSearchValue" value="${param.txtSearchValue}" />

            <input type="submit" value="Logout" name="btAction" />
        </form></br>
        <c:set var="searchValue" value="${param.txtSearchValue}"/>
        <c:if test="${not empty searchValue }">
            <c:set var="result" value="${requestScope.SEARCH_RESULT}"/>
            <c:if test="${not empty result}">
                <table border="1">
                    <thead>
                        <tr>
                            <th>No.</th>
                            <th>Username</th>
                            <th>Password</th>
                            <th>Full name</th>
                            <th>Role</th>
                            <th>Delete</th>
                            <th>Update</th>
                        </tr>
                    </thead>
                    <tbody>
                    <form action="DispatchServlet" method="POST">
                        <c:forEach items="${result}" var="dto" varStatus="counter">
                            <tr>
                                <td>
                                    ${counter.count}
                                </td>
                                <td>
                                    ${dto.username}
                                    <input type="hidden" name="txtUsername" value="${dto.username}" />
                                </td>
                                <td>
                                    ${dto.password}
                                    <input type="text" name="txtPassword" value="${dto.password}" />
                                </td>
                                <td>
                                    ${dto.fullname}
                                    <input type="text   " name="txtFullname" value="${dto.fullname}" />
                                </td>
                                <td>
                                    ${dto.role}
                                    <input type="checkbox" name="chkAdmin" value="ON" />
                                    <c:if test="">
                                        checked="checked"
                                    </c:if>
                                </td>
                                <td>
                                    <c:url var="urlRewriting" value="DispatchServlet">
                                        <c:param name="btAction" value="delete"/>
                                        <c:param name="pk" value="${dto.username}"/>
                                        <c:param name="lastSearchValue" value="${searchValue}"/>
                                    </c:url>
                                    <a href="${urlRewriting}">Delete</a>
                                </td>
                                <td>
                                    <input type="hidden" name="lastSearchValue" value="${searchValue}" />
                                    <input type="submit" value="Update" name="btAction" />
                                </td>
                            </tr>
                        </c:forEach>
                    </form>

                </tbody>
            </table>
        </c:if>
    </c:if>>
</body>
</html>
<%-- <%
Cookie[] cookie = request.getCookies();
if(cookie != null ){
    Cookie newestCookie = cookie[cookie.length-1];
    String username = newestCookie.getName();
    
%>
<font color =" red">
    Welcome, <%= username %>
</font>
<%    
}

%>

<h1>Search Page</h1>
<form action="DispatchServlet">
    Search value <input type="text" name="txtSearchValue" value="<%= request.getParameter("txtSearchValue")%>" />
    <input type="submit" value="Search" name="btAction" />
    <input type="submit" value="Logout" name="btAction" />
</form>
<%
    String searchValue = request.getParameter("txtSearchValue");
    if (searchValue != null) { //first time
        List<RegistrationDTO> result = (List<RegistrationDTO>) request.getAttribute("SEARCH_RESULT");
        if (result != null) { // has one or more records
%>

<table border="1">
    <thead>
        <tr>
            <th>No.</th>
            <th>Username</th>
            <th>Password</th>
            <th>Full Name</th>
            <th>Role</th>
            <th>Delete</th>
            <th>Update</th>
        </tr>
    </thead>
    <tbody>
        <%
            int count = 0;
            for (RegistrationDTO dto : result) {
                String urlRewriting = "DispatchServlet"
                        + "?btAction=delete"
                        + "&pk=" + dto.getUsername()
                        + "&lastSearchValue=" + searchValue;
        %>
    <form action="DispatchServlet" method="POST">
        <tr>

                    <td>
                        <%= ++count%>
                    </td>
                    <td>
                        <%= dto.getUsername()%>
                        <input type="hidden" name="txtUsername" 
                               value="<%= dto.getUsername() %>" />
                    </td>
                    <td>
                        <%= dto.getPassword()%>
                        <input type="text" name="txtPassword"
                               value="<%= dto.getPassword()%>">
                    </td>
                    <td>
                        <%= dto.getFullname()%>
                        <input type="text" name="txtFullname" 
                               value="<%= dto.getFullname()%>" />
                    </td>
                    <td>
                        <input type="checkbox" name="chkAdmin" value="ON"
                               <% if (dto.isRole()) {
                               %>
                               checked ="checked"
                               <%
                                       //user is admin
                                   }
                               %>
                               />
                    </td>
                    <td>
                        <a href="<%=urlRewriting%>">Delete</a>
                    </td>
                        
                    <td>
                        <input type="hidden" name="lastSearchValue"
                               value="<%= searchValue%>">
                        <input type="submit" value="Update" name="btAction" />
                    </td>
                </tr>
            </form>
            <%
                }//end travel dto
            %>
        </tbody>
    </table>

    <%
    } else { // has no records
    %>
    <h2>No Record is matched !!!</h2>
    <%
            }
        }//end search Value has valid value
    %>
</body>
</html>
--%>