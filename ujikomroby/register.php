<?php
include 'koneksi.php';
?>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Register Perpus Digital</title>
        <link href="css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    </head>
    <body class="bg-primary">
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-5">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">Register Perpus Digital</h3></div>
                                    <div class="card-body">
                                        <?php
                                        if (isset($_POST['register'])) {
                                            $username =  $_POST['username'];
                                            $password =  md5($_POST['password']);
                                            $email =  $_POST['email'];
                                            $telp =  $_POST['telp'];
                                            $nama =  $_POST['nama'];
                                            $alamat =  $_POST['alamat'];
                                            $level =  $_POST['level'];
                                            
                                            $duplicateCheck = mysqli_fetch_array(mysqli_query($koneksi, "SELECT username FROM t_user WHERE username = '$username'"));
                                            if ($duplicateCheck > 0) {
                                                echo "<script>alert('Username tidak tersedia, silahkan coba username lain.'); location.href='register.php'</script>";
                                            } else {
                                                $insert = mysqli_query($koneksi, "INSERT INTO t_user(username, password, email, telp, namaLengkap, alamat, level) VALUES ('$username', '$password', '$email', '$telp', '$nama', '$alamat', '$level')");
                                                echo "<script>alert('Selamat registrasi berhasil, silahkan untuk login.'); location.href='login.php'</script>";
                                            }
                                            
                                        }
                                        ?>
                                        <form method="post">
                                            <div class="form-floating mb-3">
                                                <input class="form-control" type="text" name="username" placeholder="Masukkan username" required autofocus/>
                                                <label>Username</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" type="password" name="password" placeholder="Masukkan kata sandi" required/>
                                                <label>Password</label>
                                            </div>
                                            <div class="input-group mb-3">
                                                <span class="input-group-text">@</span>
                                                <div class="form-floating">
                                                    <input class="form-control" type="email" name="email" id="floatingInputGroup1" placeholder="Email" required>
                                                    <label for="floatingInputGroup1">Email</label>
                                                </div>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" type="text" name="telp" placeholder="Masukkan no telepon" required/>
                                                <label>No. telepon</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" type="text" name="nama" placeholder="Masukkan nama lengkap" required/>
                                                <label>Nama Lengkap</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <textarea class="form-control" name="alamat" placeholder="" id="floatingTextarea2" style="height: 100px" required></textarea>
                                                <label for="floatingTextarea2">Alamat</label>
                                            </div>
                                            <div class="form-floating">
                                                <select class="form-select" name="level" id="floatingSelect" aria-label="Floating label select example">
                                                    <!-- <option disabled selected></option> -->
                                                    <option value="admin">Admin</option>
                                                    <option value="anggota" selected>Peminjam</option>
                                                </select>
                                                <label for="floatingSelect">Register sebagai</label>
                                            </div>
                                            <div class="d-flex align-items-center justify-content-between mt-4 mb-0">
                                                <button class="btn btn-primary" type="submit" name="register" value="register">Register</button>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="card-footer text-center py-3">
                                        <div class="small"><a href="login.php">Sudah punya akun? silahkan Login</a> </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
            <br><br>
            <div id="layoutAuthentication_footer">
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">&copy; 2024 Perpus Digital</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
    </body>
</html>
