<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <spring:url value="/resources/js" var="JS"/>
    <spring:url value="/resources/css" var="CSS"/>
    <script type="text/javascript" src="${JS}/jquery/jquery-3.1.0.min.js"></script>
    <script type="text/javascript" src="${JS}/bootstrap/bootstrap.min.js"></script>
    <script type="text/javascript" src="${JS}/jquery/ui/jquery-ui.min.js"></script>

    <link href="${CSS}/bootstrap/bootstrap.min.css" rel="stylesheet"/>
    <link href="${CSS}/bootstrap/bootstrap-theme.min.css" rel="stylesheet"/>
    <link href="${CSS}/jquery/ui/jquery-ui.min.css" rel="stylesheet"/>
    <style>

        body {
            background: #eee !important;
        }

        .wrapper {
            margin-top: 80px;
            margin-bottom: 80px;
        }

        .form-signin {
            max-width: 30%;
            padding: 15px 35px 45px;
            margin: 0 auto;
            background-color: #fff;
            border: 1px solid rgba(0, 0, 0, 0.1);

        .form-signin-heading,
        .checkbox {
            margin-bottom: 30px;
        }

        .checkbox {
            font-weight: normal;
        }

        .form-control {
            font-size: 16px;
            height: auto;
            padding: 10px;
        @include box-sizing(border-box);
        &
        :focus {
            z-index: 2;
        }
        }

        input[type="text"] {
            margin-bottom: -1px;
            border-bottom-left-radius: 0;
            border-bottom-right-radius: 0;
        }

        input[type="password"] {
            margin-bottom: 20px;
            border-top-left-radius: 0;
            border-top-right-radius: 0;
        }

        }
        @media (max-width: 700px){
            h2{
                font-size: medium;
            }
            .form-signin {
                max-width: 80%;
                padding: 15px 35px 45px;
                margin: 0 auto;
                background-color: #fff;
                border: 1px solid rgba(0, 0, 0, 0.1);

            .form-signin-heading,
            .checkbox {
                margin-bottom: 30px;
            }

            .checkbox {
                font-weight: normal;
            }}
        }

    </style>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Documento sin título</title>
</head>

<body>
<div class="wrapper">
    <form class="form-signin" name='loginForm'
          action="<c:url value='/j_spring_security_check' />" method='POST'>
        <h2 class="form-signin-heading">

            Iniciar Sesión</h2>

        <c:if test="${not empty error}">
            <div class="error">${error}</div>
        </c:if>
        <c:if test="${not empty msg}">
            <div class="msg">${msg}</div>
        </c:if>

        <input type="text" class="form-control" name="username" placeholder="Email Address" required="" autofocus=""/>
        <br/>
        <input type="password" class="form-control" name="password" placeholder="Password" required=""/>
        <br/>
        <input name="submit" type="submit" value="Enviar" class="btn btn-lg btn-primary btn-block"/>
    </form>
</div>

</body>
</html>
