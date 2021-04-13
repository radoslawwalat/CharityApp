<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Edytujesz fundację o id: ${institution.id}, oraz nazwie: ${institution.name}</h1>
<form:form modelAttribute="institution" method="post" action="/admin/updateInstitution">
    <form:hidden path="id"/>
    <form:input path="name" type="text" placeholder="Nazwa"/>
    <form:input path="description" type="text" placeholder="Opis"/>
    <button type="submit">Edytuj</button>
</form:form>

<a href="/admin"><- Panel administratora</a>
</body>
</html>
