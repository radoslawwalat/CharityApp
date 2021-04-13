<%--
  Created by IntelliJ IDEA.
  User: radek
  Date: 12/04/2021
  Time: 21:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Document</title>

    <link rel="stylesheet" href="<c:url value="resources/css/style.css"/>"/>
</head>
<body>
<header class="header--main-page">

    <jsp:include page="../common/header.jsp"/>

    <div class="slogan container container--90">
        <div class="slogan--item">
            <h1>
                Panel Administratora!
            </h1>
        </div>
    </div>
</header>

<section>
    <a href="/admin/institutions" class="btn btn--large btn--without-border width-33">Zarządzaj fundacjami</a>
    <a href="/admin/admins" class="btn btn--large btn--without-border width-33">Zarządzaj adminami</a>
    <a href="/admin/users" class="btn btn--large btn--without-border width-33">Zarządzaj użytkownikami</a>
</section>



<jsp:include page="../common/footer.jsp"/>

<script src="<c:url value="resources/js/app.js"/>"></script>
</body>
</html>
