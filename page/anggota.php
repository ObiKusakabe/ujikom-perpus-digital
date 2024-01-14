<?php
require_once("function/helper.php");

if ($_SESSION['level'] !== 'anggota') {
  header("location: " . $_SERVER['HTTP_REFERER']);
  exit();
}
?>