<?php
$id = $_GET['id'];
$query = mysqli_query($koneksi, "DELETE FROM t_buku WHERE bukuID=$id");

if ($query) {
    echo "<script>alert('Hapus Buku Berhasil'); location.href='?page=buku'</script>";
} else {
    echo "<script>alert('Hapus Buku Gagal'); location.href='?page=buku'</script>";
}
?>