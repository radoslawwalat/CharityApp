<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Edytujesz formularz daru dla adresu: ${donation.city}, ${donation.street}, o dacie dostarczenia: ${donation.pickUpDate}</h1>
<form:form modelAttribute="donation" method="post" action="/profile/updateDonation">

    <form:hidden path="id"/>
    <form:hidden path="fulfilled"/>
    <form:hidden path="user"/>
    <div>
        Ilość worków:
    <form:input type="number" step="1" min="1" default="1" path="quantity" cssClass="quantity"/>
    </div>
    <div>
        Miasto:
        <form:input type="text" path="city"/>
    </div>

    <div>
        Ulica:
        <form:input type="text" path="street"/>
    </div>

    <div>
        Kod pocztowy:
        <form:input type="text" path="zipCode"/>
    </div>
    <div>
        Komentarz:
        <form:input type="textarea" path="pickUpComment"/>
    </div>

    <div>
        Data odbioru:
        <form:input type="date" cssClass="pickupdate" path="pickUpDate"/>
    </div>

    <div>
        Data odbioru:
        <form:input type="time" cssClass="pickuptime" path="pickUpTime"/>
    </div>

    <div>
        Fundacja:
        <form:select path="institution" items="${institutions}" itemLabel="name" itemValue="id"/>
    </div>

    <div>
        Kategorie:
        <form:select multiple="true" path="categories" items="${categories}" itemLabel="name" itemValue="id"/>
    </div>
    <button type="submit">Edytuj</button>
</form:form>

<a href="/profile"><- Powrót do porfilu</a>
</body>
</html>
