<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <head>
        <title>Title</title>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">

    </head>
</head>
<body>

<div class="container">

    <div class="card o-hidden border-0 shadow-lg my-5">
        <div class="card-body p-0">
            <!-- Nested Row within Card Body -->
            <div class="p-5">
                <div class="text-center">
                    <h1 class="h4 text-gray-900 mb-4">Edytujesz fundację o id: ${institution.id}, oraz nazwie: ${institution.name}</h1>
                </div>
                    <form:form modelAttribute="institution" method="post" action="/admin/updateInstitution">
                        <form:hidden path="id"/>


                        <div class="form-group ">
                            <div class="mb-3 mb-sm-0">
                                <label>Nazwa:</label>
                                <form:input path="name" type="text" placeholder="Nazwa" cssClass="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="mb-3 mb-sm-0">
                                <label>Opis:</label>
                                <form:input path="description" type="text" placeholder="Opis" cssClass="form-control"/>
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
