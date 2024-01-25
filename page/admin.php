<?php
require_once("function/helper.php");

// $_SESSION['last_page'] = $_SERVER['REQUEST_URL'];
if ($_SESSION['level'] !== 'admin') {
  header("location: " . $_SERVER['HTTP_REFERER']);
  exit();
}
?>

