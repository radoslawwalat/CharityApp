<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Edytuj swoje hasło</h1>

<form:form modelAttribute="ChangePasswordForm" method="post" action="/profile/editPassword">
    <form:input path="oldPassword" type="text" placeholder="Stare Hasło"/>
    <form:input path="password" type="text" placeholder="Hasło"/>
    <form:input path="rePassword" type="text" placeholder="Powtórz hasło"/>
    <button type="submit">Edytuj</button>
</form:form>

</body>
</html>
