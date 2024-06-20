<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Registrar usuario</title>
</head>
<body>
<form method="post" action="sign_in">
    <label>Ingrese su ID: </label>
    <input type="number" name="id_user" >
    <br>
    <label>Ingrese su nombre: </label>
    <input type="text" name="user_first_name" >
    <br>
    <label>Ingrese su apellido: </label>
    <input type="text" name="user_last_name" >
    <br>
    <label>Ingrese su contraseña: </label>
    <input type="password" name="pass1" >
    <br>
    <label>Ingrese su contraseña nuevamente: </label>
    <input type="password" name="pass2" >
    <br>
    <label>Ingrese su correo: </label>
    <input type="email" name="email" >
    <br>
    <label>Ingrese su Rol: </label>
    <input type="number" name="id_user_type" >
    <br>
    <label>Ingrese su grupo: </label>
    <input type="number" name="id_grupo" >
    <br>

    <input type="submit" value="Registrarse">
</form>
</body>
</html>
