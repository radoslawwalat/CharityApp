<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Edytujesz swoje dane ${user.username}</h1>
<form:form modelAttribute="user" method="post" action="/profile/updateInfo">
    <form:hidden path="id"/>
    <form:hidden path="password"/>
    <form:hidden path="role"/>
    <form:hidden path="blocked"/>
    <form:input path="username" type="text" placeholder="Nazwa Użytkownika"/>
    <form:input path="firstname" type="text" placeholder="Imię"/>
    <form:input path="lastname" type="text" placeholder="Nazwisko"/>
    <form:input path="email" type="text" placeholder="Email"/>
    <button type="submit">Edytuj</button>
</form:form>

<a href="/profile"><- Panel profilu</a>
</body>
</html>
