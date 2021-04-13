<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.css">
</head>
<body>
<h1>Panel zarządzania użytkownikami</h1>

<table id="table_id" class="display">
    <thead>
    <tr>
        <th>Id</th>
        <th>Nazwa Użytkownika</th>
        <th>Imię</th>
        <th>Nazwisko</th>
        <th>Email</th>
        <th>Status (1 = zablokowany)</th>
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
            <td>${user.blocked}</td>
            <td>
                <a href="/admin/users/delete/${user.id}">Usuń</a>
                <a href="/admin/users/edit/${user.id}">Edytuj</a>
                <c:choose>
                <c:when test="${user.blocked == 0}">
                    <a href="/admin/users/block/${user.id}">Zablokuj</a>
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

<h1>Dodaj nowego Użytkownika</h1>
<form:form modelAttribute="user" method="post" action="/admin/saveUser">

    <form:input path="username" type="text" placeholder="Nazwa Użytkownika"/>
    <form:input path="firstname" type="text" placeholder="Imię"/>
    <form:input path="lastname" type="text" placeholder="Nazwisko"/>
    <form:input path="email" type="text" placeholder="Email"/>
    <form:input path="password" type="text" placeholder="Hasło"/>
    <button type="submit">Dodaj</button>

</form:form>

<a href="/admin"><- Panel administratora</a>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.js"></script>
<script src="<c:url value="/resources/js/app.js"/>"></script>
</body>
</html>
