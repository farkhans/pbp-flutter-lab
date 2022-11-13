## Tugas Flutter PBP Gasal 2022/2023
Farkhan Syawal Harahap

2106709125

PBP F

***
### Tugas 1

#### *Stateless Widget* dan *Stateful Widget*
*Stateless Widget* adalah *widget* yang *state*-nya tidak dapat diubah lagi setelah dibuat. *Widget* jenis ini bersifat *immutable* yang berarti perubahan apa pun pada variabel, ikon, tombol, dan data yang diambil tidak akan memengaruhi *state* dari aplikasi.

Sebaliknya, *stateful widget* adalah *widget* yang *state*-nya dapat diubah setelah dibuat. *Widget* jenis ini bersifat *mutable* yang berarti isinya bisa diubah-ubah terus oleh variabel, input, dan/atau data.

#### *Widget* yang Digunakan
-   `MaterialApp`, sebagai *root* dari aplikasi
-   `Scaffold`, implementasi struktur tata letak visual desain material dasar
-   `AppBar`, sebuah baris paling atas yang menampilkan judul
-   `Center`, membuat *layout* dan menyusunnya di tengah
-   `Column`, membuat *layout* dan menyusunnya secara vertikal
-   `Text`, membuat teks
-   `TextStyle`mengatur *style* dari `Text`
-   `Padding`, membuat *padding* agar elemen di dalamnya bisa memiliki jarak dengan bagian tepi layar
-   `EdgeInsets`, untuk menentukan besar *offset* pada `Padding`
-   `Row`, seperti `Column`, tetapi horizontal
-   `Visibility`, membuat *widget* yang bisa diatur terlihat atau tidak
-   `FloatingActionButton`, mengubah *state* ketika ditekan sehingga isinya bisa berubah, bisa dikatakan juga sebagai pemicu *event*
-   `Icon`, memunculkan ikon di `FloatingActionButton`

#### Fungsi `setState()`
Fungsi `setState()` berfungsi untuk mengubah *state* dari *state object*. Ketika fungsi ini dipanggil, fungsi ini akan memberitahu *framework* bahwa *internal state* dari suatu objek telah berubah dan perubahan tersebut bisa saja memengaruhi UI pada suatu *subtree* sehingga membuat *framework* menskedulkan *build* suatu *state object*.

#### `const` dan `final`
Pada dasarnya kedua *keyword* ini memiliki fungsi yang sama, yakni membuat variabel jadi tidak bisa diubah *value*-nya. Variabel dengan *keyword* ini harus diinisialisasi ketika dideklarasikan. Variabel dengan *keyword* `final` memodifikasi variabel. Namun, *value*-nya tidak sepenuhnya final. Jika *value* dari variabel dengan *keyword* `final` adalah *collection*, isinya masih bisa diubah. Berbeda dengan variabel dengan *keyword* `const`, baik *collection* maupun bukan, *value*-nya tidak bisa diubah. Bahkan, isi dari *collection*-nya juga tidak bisa diubah.

#### Cara Implementasi
1.  Membuat aplikasi baru
2.  Masuk ke `main.dart`
3.  Buat fungsi dan variabel yang diperlukan
4.  Membuat *multiple* `FloatingActionButton` serta mengatur fungsionalitasnya masing-masing
5.  Mengatur `Text` untuk ganjil-genap
6.  Coba jalankan dan periksa

***
### Tugas 2

#### `Navigator.push` dan `Navigator.pushReplacement`
Hal yang dilakukan oleh kedua *method* itu sama, yakni mengganti halaman yang sedang kita lihat. Namun, perbedaannya adalah `Navigator.push` menimpa halaman sebelumnya dengan halaman baru dan halaman sebelumnya masih bisa kita akses jika kita ingin kembali. Jika menggunakan `Navigator.push`, terdapat ikon panah kiri di *header* yang jika ditekan akan mengembalikan halaman sebelumnya. Sementara itu, `Navigator.pushReplacement` akan menggantikan halaman yang sudah ada dan menggantinya dengan halaman yang baru. Halaman yang sebelumnya akan dibuang begitu halaman baru sudah siap.

#### *Widget* yang Digunakan
Beberapa *widget* saya gunakan di [Tugas 1](#widget-yang-digunakan) dan saya menambahkan beberapa *widget* yang saya tambahkan di tugas ini
-   `Form`, membuat formulir yang bisa diisi
-   `SizedBox`, membuat sebuah segi empat
-   `ListView`, seperti `Column`, tetapi *scrollable*
-   `ListTile`, membuat elemen di dalam `ListView`
-   `Divider`, garis pembatas antar-`ListTile`
-   `TextFormField`, membuat input teks di `Form`
-   `InputDecoration`, *styling* `TextFormField`
-   `OutlineInputBorder`, *styling border* `TextFormField`
-   `TextEditingController`, modifikasi isi `TextFormField`
-   `DropDownButton`, membuat tombol *dropdown*
-   `DropDownMenuItem`, membuat daftar pilihan di *dropdown*
-   `TextButton`, membuat tombol dengan teks
-   `ButtonStyle`, *styling* tombol
-   `Navigator`, pengatur halaman yang ditampilkan
-   `Drawer`, membuat *sidebar* yang bisa ditampilkan ketika *hamburger icon* ditekan
  
### Jenis *Event* pada Flutter
-   `onPressed`
-   `onChanged`
-   `onSaved`

### Cara Kerja `Navigator`
`Navigator` mengontrol halaman yang dikenal dengan nama *route(s)* dengan menggunakan *stack*. Jadi, *route* yang kita buat itu akan menjadi *stack of routes* setiap kali kita berpindah halaman. Susunannya *stack*-nya juga bergantung metode *push* yang kita gunakan.

### Cara Implementasi
1.  Membuat beberapa file baru untuk beberapa halaman
2.  Membuat `Drawer` dan menambahkannya ke file lain
3.  Membuat `Form`, termasuk input-inputnya
4.  Membuat class `Budget` yang merepresentasikan objek budget
5.  Membuat halaman yang menampilkan budget-budget, termasuk instal `DateFormat`

