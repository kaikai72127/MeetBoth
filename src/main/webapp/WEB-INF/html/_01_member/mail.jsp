<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>MailVerify</title>
</head>

<body>
    <form action="<%=request.getContextPath()%>/mailVerify.controller" method="post">
        <input type="text" name="value" value='${value}'>
        <input type="submit" value="驗證">
    </form>
</body>

</html>