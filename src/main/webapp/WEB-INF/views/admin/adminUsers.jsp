<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.css">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Document</title>
    <link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>"/>
</head>
<body>
<header>

    <jsp:include page="../common/header.jsp"/>

</header>

<section class="steps">
    <h2>Panel zarządzania użytkownikami!</h2>
    <table id="table_id" class="display">
        <thead>
        <tr>
            <th>Id</th>
            <th>Nazwa Użytkownika</th>
            <th>Imię</th>
            <th>Nazwisko</th>
            <th>Email</th>
            <th>Status</th>
            <th>Akcje</th>

        </tr>
        </thead>
        <tbody>
        <c:forEach items="${users}" var="user">
            <tr>

                <td>${user.id}</td>
                <td>${user.username}</td>
                <td>${user.firstname}</td>
                <td>${user.lastname}</td>
                <td>${user.email}</td>
                <td><c:choose>
                    <c:when test="${user.blocked == 0}">
                        Odblokowany
                    </c:when>
                    <c:otherwise>
                        Zablokowany
                    </c:otherwise>
                </c:choose>

                </td>
                <td>
                    <a href="/admin/users/delete/${user.id}">Usuń</a>
                    <a href="/admin/users/edit/${user.id}">Edytuj</a>
                    <c:choose>
                        <c:when test="${user.blocked == 0}">
                            <a href="/admin/users/block/${user.id}" >Zablokuj</a>
                        </c:when>
                        <c:otherwise>
                            <a href="/admin/users/block/${user.id}">Odblokuj</a>
                        </c:otherwise>
                    </c:choose>
                </td>

            </tr>
        </c:forEach>
        </tbody>
    </table>

    <a href="/admin" class="btn btn--large">Powrót do panelu Administratora</a>
</section>

<section class="steps">
    <div>
        <h2>Dodaj nowego Użytkownika</h2>
        <form:form modelAttribute="user" method="post" action="/admin/saveUser">
            <div class="form-section form-section--columns steps--container">
                <div class="form-section--column steps--item">
                    <h4>Nazwa użytkownika</h4>
                    <div class="form-group form-group--inline">
                        <label class="steps--item"> <form:input path="username" type="text" placeholder="Nazwa Użytkownika"/> </label>
                    </div>

                </div>

                <div class="form-section--column">
                    <h4>Imię</h4>
                    <div class="form-group form-group--inline steps--item">
                        <label class="steps--item"> <form:input path="firstname" type="text" placeholder="Imię"/> </label>
                    </div>

                </div>

                <div class="form-section--column">
                    <h4>Nazwisko</h4>
                    <div class="form-group form-group--inline steps--item">
                        <label class="steps--item"> <form:input path="lastname" type="text" placeholder="Nazwisko"/> </label>
                    </div>

                </div>
                <div class="form-section--column">
                    <h4>Nazwisko</h4>
                    <div class="form-group form-group--inline steps--item">
                        <label class="steps--item"> <form:input path="email" type="text" placeholder="Email"/> </label>
                    </div>

                </div>
                <div class="form-section--column">
                    <h4>Hasło</h4>
                    <div class="form-group form-group--inline steps--item">
                        <label class="steps--item"> <form:input path="password" type="text" placeholder="Hasło"/> </label>
                    </div>

                </div>


            </div>

            <div class="steps--container">
                <label class="steps--item">
                    <button type="submit" class="btn--small steps--item">Dodaj</button>
                </label>
            </div>
        </form:form>
    </div>

</section>


<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.js"></script>
<script src="<c:url value="/resources/js/app.js"/>"></script>
</body>
</html>
