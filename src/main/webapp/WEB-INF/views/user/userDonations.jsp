<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.css">
</head>
<body>
<h1>Panel zarządzania darami</h1>

<table id="table_id" class="display">
    <thead>
    <tr>
        <th>Id</th>
        <th>Data Odbioru</th>
        <th>Godzina Odbioru</th>
        <th>Fundacja</th>
        <th>Kategorie</th>
        <th>Ilość Worków</th>
        <th>Miasto</th>
        <th>Ulica</th>
        <th>Kod Pocztowy</th>
        <th>Komentarz</th>
        <th>Doręczony(1 = tak)</th>
        <th>Akcje</th>

    </tr>
    </thead>
    <tbody>
    <c:forEach items="${donations}" var="dono">
        <tr>

            <td>${dono.id}</td>
            <td>${dono.pickUpDate}</td>
            <td>${dono.pickUpTime}</td>
            <td>${dono.institution.name}</td>
            <td>
                <c:forEach items="${dono.categories}" var="cat" varStatus="stat">
                    ${cat.name} <c:if test="${!stat.last}"> | </c:if>
                </c:forEach>
            </td>
            <td>${dono.quantity}</td>
            <td>${dono.city}</td>
            <td>${dono.street}</td>
            <td>${dono.zipCode}</td>
            <td>${dono.pickUpComment}</td>
            <td>${dono.fulfilled}</td>

            <td>
                <a href="/profile/donations/delete/${dono.id}">Usuń</a>
                <a href="/profile/donations/edit/${dono.id}">Edytuj</a>
                <a href="/profile/donations/fulfill/${dono.id}">Odebrany</a>
            </td>

        </tr>
    </c:forEach>
    </tbody>
</table>

<h1><a href="/donate"> Dodaj nowy dar</a></h1> <br>

<a href="/profile"><- Profil</a>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.js"></script>
<script src="<c:url value="/resources/js/app.js"/>"></script>
</body>
</html>
