<?php
require_once("../function/helper.php");
require_once("../function/koneksi.php");

$username = $_POST['username'];
$password = md5($_POST['password']);

$query = mysqli_query($koneksi, "SELECT * FROM t_user WHERE username = '$username' AND password = '$password'");

if (mysqli_num_rows($query) != 0) {
    $row = mysqli_fetch_assoc($query);

    session_start();
    $_SESSION['id'] = $row['id'];
    $_SESSION['level'] = $row['level'];
    if ($row['level'] == 'admin') {
        header("location: " . BASE_URL . "dashboard.php?page=admin");
    } else if($row['level'] == 'anggota') {
        header("location: " . BASE_URL . "dashboard.php?page=anggota");
    } else if($row['level'] == 'petugas') {
        header("location: " . BASE_URL . "dashboard.php?page=petugas");
    } else {
        header("location: " . BASE_URL);
    }
}
?>