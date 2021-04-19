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
    <h2>Panel zarządzania darami!</h2>
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
        <th>Status</th>
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
            <td><c:choose>
                <c:when test="${dono.fulfilled == 0}">
                    Niedoręczony
                </c:when>
                <c:otherwise>
                    Doręczony
                </c:otherwise>
            </c:choose>
            </td>

            <td>
                <ul class="nav--actions datatableUl">
                <c:choose>
                    <c:when test="${dono.fulfilled == 0}">
                        <li><a href="/profile/donations/fulfill/${dono.id}" class="btn btn--small">Doręczony</a></li>
                    </c:when>
                    <c:otherwise>
                        <li><a href="/profile/donations/fulfill/${dono.id}" class="btn btn--small">Niedoręczony</a></li>
                    </c:otherwise>
                </c:choose>
                </ul>
            </td>

        </tr>
    </c:forEach>
    </tbody>
</table>

    <a href="/donate" class="btn btn--large">Dodaj nowy dar</a>
    <a href="/profile" class="btn btn--large">Powrót do profilu</a>
</section>



<%-- TODO --%>


<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.js"></script>
<script src="<c:url value="/resources/js/app.js"/>"></script>
</body>
</html>
