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
    <h2>Panel zarządzania fundacjami!</h2>
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
                    <ul class="nav--actions datatableUl">
                        <li><a href="/admin/institutions/delete/${inst.id}" class="btn btn--small">Usuń</a></li>
                        <li><a href="/admin/institutions/edit/${inst.id}" class="btn btn--small">Edytuj</a></li>
                    </ul>

                </td>

            </tr>
        </c:forEach>
        </tbody>
    </table>

    <a href="/donate" class="btn btn--large">Dodaj nowy dar</a>
    <a href="/admin" class="btn btn--large">Powrót do panelu Administratora</a>
</section>

<section class="steps">
    <div>
        <h2>Dodaj nową fundację</h2>
        <form:form modelAttribute="institution" method="post">
        <div class="form-section form-section--columns steps--container">
            <div class="form-section--column steps--item">
                <h4>Nazwa</h4>
                <div class="form-group form-group--inline">
                    <label class="steps--item"> <form:input path="name" type="text" placeholder="Nazwa"/> </label>
                </div>

            </div>

            <div class="form-section--column">
                <h4>Opis</h4>
                <div class="form-group form-group--inline steps--item">
                    <label class="steps--item"> <form:input path="description" type="text" placeholder="Opis"/> </label>
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