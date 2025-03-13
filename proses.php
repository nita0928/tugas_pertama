<?php
// Cek apakah form telah dikirim
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Deklarasi variabel dan mengambil data dari form
    $nama = trim($_POST["nama"]);
    $harga = trim($_POST["harga"]);
    $deskripsi = trim($_POST["deskripsi"]);
    
    // Inisialisasi variabel error
    $error = "";

    // Validasi input: pastikan tidak ada yang kosong
    if (empty($nama) || empty($harga) || empty($deskripsi)) {
        $error = "Semua kolom harus diisi!";
    } elseif (!is_numeric($harga) || $harga <= 0) {
        $error = "Harga harus berupa angka positif!";
    }

    // Jika tidak ada error, simpan ke database (simulasi)
    if (empty($error)) {
        echo "<h2>Produk Berhasil Ditambahkan!</h2>";
        echo "<p><strong>Nama:</strong> $nama</p>";
        echo "<p><strong>Harga:</strong> Rp " . number_format($harga, 0, ',', '.') . "</p>";
        echo "<p><strong>Deskripsi:</strong> $deskripsi</p>";
    } else {
        // Tampilkan pesan error
        echo "<p style='color: red;'>$error</p>";
        echo "<a href='form_produk.php'>Kembali ke Form</a>";
    }
} else {
    // Jika file ini diakses langsung, redirect ke form
    header("Location: form_produk.php");
    exit();
}
?>
