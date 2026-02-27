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

3. **AppBar**
   
   🖿: home_page.dart, detail_resep.dart, form_resep.dart

   Digunakan sebagai struktur dasar halaman.
      
    ```dart

    ```
5. **ListView.builder**  
6. **Card**  
7. **ListTile**  
8. **Text**  
9. **TextField**  
10. **ElevatedButton**  
11. **FloatingActionButton**  
12. **IconButton**  
13. **Navigator & MaterialPageRoute**  
14. **AlertDialog**  
15. **Column, Padding, SizedBox**  
16. **Container & ClipRRect**  
17. **Image.network**
