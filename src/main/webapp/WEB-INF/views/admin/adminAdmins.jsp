<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.css">
</head>
<body>
<h1>Panel zarządzania administratorami</h1>

<table id="table_id" class="display">
    <thead>
    <tr>
        <th>Id</th>
        <th>Nazwa Użytkownika</th>
        <th>Imię</th>
        <th>Nazwisko</th>
        <th>Email</th>
        <th>Akcje</th>

    </tr>
    </thead>
    <tbody>
    <c:forEach items="${admins}" var="admin">
        <tr>

            <td>${admin.id}</td>
            <td>${admin.username}</td>
            <td>${admin.firstname}</td>
            <td>${admin.lastname}</td>
            <td>${admin.email}</td>
            <td>
                <a href="/admin/admins/delete/${admin.id}">Usuń</a>
                <a href="/admin/admins/edit/${admin.id}">Edytuj</a>
            </td>

        </tr>
    </c:forEach>
    </tbody>
</table>

<h1>Dodaj nowego Admina</h1>
<form:form modelAttribute="user" method="post" action="/admin/saveAdmin">

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