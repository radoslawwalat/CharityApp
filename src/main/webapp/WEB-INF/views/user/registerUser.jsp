<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Document</title>
    <link rel="stylesheet" href="<c:url value="resources/css/style.css"/>"/>
</head>
<body>
<header>

    <jsp:include page="../common/header.jsp"/>

</header>

<section class="login-page">
    <h2>Załóż konto</h2>
    <form:form modelAttribute="user" method="post">
        <h1>Nazwa Użytkownika: </h1>
        <div class="form-group">
            <form:input type="text" placeholder="username" path="username" />
        </div>
        <h1>Imię: </h1>
        <div class="form-group">
            <form:input type="text" placeholder="Imię" path="firstname" />
        </div>
        <h1>Nazwisko: </h1>
        <div class="form-group">
            <form:input type="text" placeholder="Nazwisko" path="lastname" />
        </div>
        <h1>Email: </h1>
        <div class="form-group">
            <form:input type="email" placeholder="Email" path="email" />
        </div>
        <h1>Hasło: </h1>
        <div class="form-group">
            <form:input type="password" placeholder="Hasło" path="password" />
        </div>


        <div class="form-group form-group--buttons">
            <a href="/login" class="btn btn--without-border">Zaloguj się</a>
            <button class="btn" type="submit">Załóż konto</button>
        </div>
    </form:form>
</section>

<jsp:include page="../common/footer.jsp"/>

</body>
</html>