<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Document</title>

    <link rel="stylesheet" href="<c:url value="resources/css/style.css"/>"/>
</head>
<body>
<header class="header--main-page">

    <jsp:include page="common/header.jsp"/>

    <div class="slogan container container--90">
        <div class="slogan--item">
            <h1>
                Zacznij pomagać!<br/>
                Oddaj niechciane rzeczy w zaufane ręce
            </h1>
        </div>
    </div>
</header>


<section class="stats">
    <div class="container container--85">
        <div class="stats--item">
            <em>${quantityOfDonation}</em>

            <h3>Oddanych worków</h3>
            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Eius est beatae, quod accusamus illum
                tempora!</p>
        </div>

        <div class="stats--item">
            <em>${quantityOfGoods}</em>
            <h3>Przekazanych darów</h3>
            <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Laboriosam magnam, sint nihil cupiditate quas
                quam.</p>
        </div>

    </div>
</section>

<section class="steps">
    <h2>Wystarczą 4 proste kroki</h2>

    <div class="steps--container">
        <div class="steps--item">
            <span class="icon icon--hands"></span>
            <h3>Wybierz rzeczy</h3>
            <p>ubrania, zabawki, sprzęt i inne</p>
        </div>
        <div class="steps--item">
            <span class="icon icon--arrow">
            </span>
            <h3>Spakuj je</h3>
            <p>skorzystaj z worków na śmieci</p>
        </div>
        <div class="steps--item">
            <span class="icon icon--glasses">
            </span>
            <h3>Zdecyduj komu chcesz pomóc</h3>
            <p>wybierz zaufane miejsce</p>
        </div>
        <div class="steps--item">
            <span class="icon icon--courier"></span>
            <h3>Zamów kuriera</h3>
            <p>kurier przyjedzie w dogodnym terminie</p>
        </div>
    </div>

    <a href="#" class="btn btn--large">Załóż konto</a>
</section>

<section class="about-us">
    <div class="about-us--text">
        <h2>O nas</h2>
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptas vitae animi rem pariatur incidunt libero
            optio esse quisquam illo omnis.</p>
        <img src="<c:url value="resources/images/signature.svg"/>" class="about-us--text-signature" alt="Signature"/>
    </div>
    <div class="about-us--image"><img src="<c:url value="resources/images/about-us.jpg"/>" alt="People in circle"/>
    </div>
</section>

<section class="help">
    <h2>Komu pomagamy?</h2>

    <!-- SLIDE 1 -->
    <div class="help--slides active" data-id="1">
        <p>W naszej bazie znajdziesz listę zweryfikowanych Fundacji, z którymi współpracujemy.
            Możesz sprawdzić czym się zajmują.</p>

        <ul class="help--slides-items">
            <c:forEach items="${institutions}" begin="0" end="${fn:length(institutions)}" step="2" varStatus="status">
                <li>
                    <div class="col">
                        <div class="title">${institutions[status.index].name}</div>
                        <div class="subtitle">${institutions[status.index].description}</div>
                    </div>
                    <c:choose>
                        <c:when test="${status.index < (fn:length(institutions)/2 + 1)}">
                    <div class="col">
                        <div class="title">${institutions[status.index+1].name}</div>
                        <div class="subtitle">${institutions[status.index+1].description}</div>
                    </div>
                        </c:when>
                        <c:otherwise>
<%--                             TODO klasa css bugfix class="col-blank"--%>
                            <div>

                            </div>
                        </c:otherwise>

                    </c:choose>
                </li>
            </c:forEach>
<%--            <li>--%>
<%--                <c:forEach items="${InstitutionsColOne}" var="institution">--%>
<%--                <div class="col">--%>
<%--                    <div class="title">Fundacja "${institution.name}"</div>--%>
<%--                    <div class="subtitle">Cel i misja: ${institution.description}.</div>--%>
<%--                </div>--%>

<%--                </c:forEach>--%>


<%--            </li>--%>

<%--            <li>--%>
<%--                <c:forEach items="${InstitutionsColTwo}" var="item">--%>
<%--                    <div class="col">--%>
<%--                        <div class="title">Fundacja "${item.name}"</div>--%>
<%--                        <div class="subtitle">Cel i misja: ${item.description}.</div>--%>
<%--                    </div>--%>
<%--                </c:forEach>--%>

<%--            </li>--%>

        </ul>
    </div>

</section>

<jsp:include page="common/footer.jsp"/>

<script src="<c:url value="resources/js/app.js"/>"></script>
</body>
</html>
