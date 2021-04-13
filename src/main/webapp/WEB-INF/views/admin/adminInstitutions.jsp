<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.css">
</head>
<body>
<h1>Panel zarządzania fundacjami</h1>

<table id="table_id" class="display">
    <thead>
    <tr>
        <th>Id</th>
        <th>Nazwa</th>
        <th>Opis</th>
        <th>Akcje</th>

    </tr>
    </thead>
    <tbody>
    <c:forEach items="${institutions}" var="inst">
    <tr>

        <td>${inst.id}</td>
        <td>${inst.name}</td>
        <td>${inst.description}</td>
        <td>
            <a href="/admin/institutions/delete/${inst.id}">Usuń</a>
            <a href="/admin/institutions/edit/${inst.id}">Edytuj</a>
        </td>

    </tr>
    </c:forEach>
    </tbody>
</table>

<h1>Dodaj nową fundacje</h1>
<form:form modelAttribute="institution" method="post">

    <form:input path="name" type="text" placeholder="Nazwa"/>
    <form:input path="description" type="text" placeholder="Opis"/>
    <button type="submit">Dodaj</button>

</form:form>

<a href="/admin"><- Panel administratora</a>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.js"></script>
<script src="<c:url value="/resources/js/app.js"/>"></script>
</body>
</html>