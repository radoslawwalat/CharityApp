<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Edytujesz Admina o id: ${user.id}, oraz nicku: ${user.username}</h1>
<form:form modelAttribute="user" method="post" action="/admin/updateAdmin">
    <form:hidden path="id"/>
    <form:hidden path="password"/>
    <form:hidden path="role"/>
    <form:input path="username" type="text" placeholder="Nazwa Użytkownika"/>
    <form:input path="firstname" type="text" placeholder="Imię"/>
    <form:input path="lastname" type="text" placeholder="Nazwisko"/>
    <form:input path="email" type="text" placeholder="Email"/>
    <button type="submit">Edytuj</button>
</form:form>

<a href="/admin"><- Panel administratora</a>
</body>
</html>
