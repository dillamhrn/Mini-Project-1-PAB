# 👩🏻‍🍳 MyRecipeez 🍽

Nama    : Dilla Maharani

NIM     : 2409116023

Kelas   : Sistem Informasi A'24

## ── ⟡ ˙Deskripsi Aplikasi
MyRecipeez adalah aplikasi catatan resep masakan sederhana berbasis Flutter.
User dapat menambahkan resep, melihat detail resep, mengedit resep, dan menghapus resep.
Selain itu, user juga dapat memberi gambar resep menggunakan URL (link).

## ── ⟡ ˙Fitur Aplikasi
- Create: Tambah resep (nama, bahan, langkah, URL gambar)
- Read: Menampilkan daftar resep & detail resep
- Delete: Hapus resep + konfirmasi dialog
- Update: Edit resep
- Multi Page Navigation

## ── ⟡ ˙Widget yang Digunakan
**1. MaterialApp**  

   🖿: main.dart
   
   Digunakan sebagai root aplikasi.
      
    ```dart
      return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'MyRecipeez',
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: const AppBarTheme(
                backgroundColor: coffee,
                foregroundColor: Colors.white,
                centerTitle: true,
              ),
              floatingActionButtonTheme: const     FloatingActionButtonThemeData(
                backgroundColor: darkChoco,
                foregroundColor: Colors.white,
              ),
            ),
            home: const HomePage(),
          );
    ```
    
**2. Scaffold**  

   🖿: home_page.dart, detail_resep.dart, form_resep.dart

   Digunakan sebagai struktur dasar halaman.
      
    ```dart
          return Scaffold(
      appBar: AppBar(title: const Text('⋆｡‧˚ʚ  👩🏻‍🍳  MyRecipeez  👨🏻‍🍳  ɞ˚‧｡⋆')),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () async {
          final hasil = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const FormResep()),
          );

          if (hasil != null) {
            tambahResep(hasil);
          }
        },
        child: const Icon(Icons.add),
      ),
    ```

**3. AppBar**  

   Digunakan sebagai header di setiap halaman.
   
   🖿: home_page.dart, detail_resep.dart, form_resep.dart

**4. ListView.builder**  

   Digunakan untuk menampilkan daftar resep secara dinamis.
   
   🖿: home_page.dart

**5. Card**  

   Digunakan untuk membungkus setiap item resep agar terlihat rapi dan memiliki bayangan.
   
   🖿: home_page.dart

**6. ListTile**

   Digunakan untuk menampilkan nama resep dan tombol hapus dalam satu baris.
   
   🖿: home_page.dart

**7. Text**

   Digunakan untuk menampilkan teks seperti nama resep, bahan, dan langkah.

   🖿: home_page.dart, detail_resep.dart, form_resep.dart

**8. TextField**  

   Digunakan untuk input data resep (nama, bahan, langkah, URL gambar).

   🖿: form_resep.dart

**9. ElevatedButton**  

   Digunakan untuk tombol Simpan pada form.

   🖿: form_resep.dart

**10. FloatingActionButton**  

   Digunakan untuk tombol tambah resep.

   🖿: home_page.dart

**11. IconButton**  

   Digunakan untuk tombol edit dan hapus.

   🖿: home_page.dart, detail_resep.dart

**12. Navigator & MaterialPageRoute**  

   Digunakan untuk berpindah halaman (Multi Page Navigation).

   🖿: home_page.dart, detail_resep.dart, form_resep.dart

**13. AlertDialog**  

   Digunakan sebagai konfirmasi sebelum menghapus resep.

   🖿: home_page.dart

**14. Column, Padding, SizedBox**  

   Digunakan untuk mengatur tata letak dan jarak antar elemen.

   🖿: home_page.dart, detail_resep.dart, form_resep.dart

**15. Container & ClipRRect**  

   Digunakan untuk styling gambar (border dan rounded corner).

   🖿: home_page.dart, detail_resep.dart

**16. Image.network**

   Digunakan untuk menampilkan gambar resep dari URL.

   🖿: home_page.dart, detail_resep.dart

