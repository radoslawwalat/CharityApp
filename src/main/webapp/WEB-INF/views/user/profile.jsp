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
                Twój profil!
            </h1>
        </div>
    </div>
</header>

<section>
    <a href="/profile/editInfo" class="btn btn--large btn--without-border">Edytuj Dane</a>
    <a href="/profile/editPassword" class="btn btn--large btn--without-border">Edytuj Hasło</a>
    <a href="/profile/donations" class="btn btn--large btn--without-border">Edytuj Dary</a>
</section>



<jsp:include page="../common/footer.jsp"/>

<script src="<c:url value="resources/js/app.js"/>"></script>
</body>
</html>
