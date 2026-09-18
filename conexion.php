
<?php

$host = "localhost";
$usuario = "root";
$clave = "";
$database = "proyecto_novatech";

try {

    // Conexión con MySQL

    $conexion = new PDO(
        "mysql:host=$host;dbname=$database;charset=utf8mb4",
        $usuario,
        $clave
    );

    // Mostrar errores de PDO

    $conexion->setAttribute(
        PDO::ATTR_ERRMODE,
        PDO::ERRMODE_EXCEPTION
    );


    // Verificar que el formulario llegue por POST

    if ($_SERVER["REQUEST_METHOD"] !== "POST") {

        header("Location: login.html?resultado=error");
        exit;
    }


    // Recibir datos

    $nombre = trim($_POST["nombre"] ?? "");
    $identificacion = trim($_POST["identificacion"] ?? "");
    $correo = trim($_POST["correo"] ?? "");
    $estado = trim($_POST["estado"] ?? "");

    $contrasena = $_POST["contrasena"] ?? "";
    $confirmar = $_POST["confirmar"] ?? "";


    // Verificar campos vacíos

    if (
        $nombre === "" ||
        $identificacion === "" ||
        $correo === "" ||
        $estado === "" ||
        $contrasena === "" ||
        $confirmar === ""
    ) {

        header("Location: login.html?resultado=incompleto");
        exit;
    }


    // Verificar contraseñas

    if ($contrasena !== $confirmar) {

        header("Location: login.html?resultado=contrasenas");
        exit;
    }


    // Verificar si la identificación ya existe

    $consulta = $conexion->prepare(
        "SELECT id_ssn FROM usuario WHERE id_ssn = ?"
    );

    $consulta->execute([$identificacion]);


    if ($consulta->fetch()) {

        header("Location: login.html?resultado=duplicado");
        exit;
    }


    // Encriptar contraseña

    $contrasena_hash = password_hash(
        $contrasena,
        PASSWORD_DEFAULT
    );


    // Insertar usuario

    $sql = "INSERT INTO usuario
            (id_ssn, nombre, email, contrasenas, estado)
            VALUES (?, ?, ?, ?, ?)";


    $insertar = $conexion->prepare($sql);


    $insertar->execute([
        $identificacion,
        $nombre,
        $correo,
        $contrasena_hash,
        $estado
    ]);


    // Registro exitoso

    header("Location: login.html?resultado=exitoso");
    exit;


} catch (PDOException $e) {

    // Error de conexión o de SQL

    header("Location: login.html?resultado=error");
    exit;
}

?>


