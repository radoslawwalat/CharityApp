<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">

</head>
<body>

<div class="container">

    <div class="card o-hidden border-0 shadow-lg my-5">
        <div class="card-body p-0">
            <!-- Nested Row within Card Body -->
            <div class="p-5">
                <div class="text-center">
                    <h1 class="h4 text-gray-900 mb-4">Edytujesz Admina o id: ${user.id}, oraz nicku: ${user.username}</h1>
                </div>
                <form:form modelAttribute="user" method="post" action="/admin/updateAdmin">
                    <form:hidden path="id"/>
                    <form:hidden path="password"/>
                    <form:hidden path="role"/>
                    <form:hidden path="blocked"/>


                    <div class="form-group ">
                        <div class="mb-3 mb-sm-0">
                            <label>Nazwa Użytkownika:</label>
                            <form:input path="username" type="text" placeholder="Nazwa Użytkownika" cssClass="form-control"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="mb-3 mb-sm-0">
                            <label>Imię:</label>
                            <form:input path="firstname" type="text" placeholder="Imię" cssClass="form-control"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="mb-3 mb-sm-0">
                            <label>Nazwisko:</label>
                            <form:input path="lastname" type="text" placeholder="Nazwisko" cssClass="form-control"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="mb-3 mb-sm-0">
                            <label>Email:</label>
                            <form:input path="email" type="text" placeholder="Email" cssClass="form-control"/>
                        </div>
                    </div>


                    <button type="submit" class="btn btn-primary btn-user btn-block" style="background-color: #FFC300; border-color: #FFC300">
                        Edytuj
                    </button>



                </form:form>
                <hr>
                <div class="text-center">
                    <a href="/admin"> Powrót do panelu panelu admina </a>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
