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
    appBarTheme: const AppBarTheme(
      backgroundColor: coffee,
      foregroundColor: Colors.white,
      centerTitle: true,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: darkChoco,
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
  appBar: AppBar(
    title: const Text('⋆｡‧˚ʚ  👩🏻‍🍳  MyRecipeez  👨🏻‍🍳  ɞ˚‧｡⋆'),
  ),
  floatingActionButton: FloatingActionButton(
    onPressed: () {},
    child: const Icon(Icons.add),
  ),
  body: ListView.builder(
    itemCount: daftarResep.length,
    itemBuilder: (context, index) {
      return const SizedBox();
    },
  ),
);
```

**3. AppBar**  

   Digunakan sebagai header di setiap halaman.
   
   🖿: home_page.dart, detail_resep.dart, form_resep.dart

   ```dart
appBar: AppBar(
  title: const Text('⋆｡‧˚ʚ  👩🏻‍🍳  MyRecipeez  👨🏻‍🍳  ɞ˚‧｡⋆'),
),
```

**4. ListView.builder**  

   Digunakan untuk menampilkan daftar resep secara dinamis.
   
   🖿: home_page.dart

   ```dart
ListView.builder(
  itemCount: daftarResep.length,
  itemBuilder: (context, index) {
    final r = daftarResep[index];

    return Card(
      child: ListTile(
        title: Text(r.nama),
      ),
    );
  },
);
```

**5. Card**  

   Digunakan untuk membungkus setiap item resep agar terlihat rapi dan memiliki bayangan.
   
   🖿: home_page.dart

   ```dart
Card(
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(30),
  ),
  elevation: 5,
  child: ListTile(
    title: Text("𐂐 ${r.nama}"),
  ),
)
```

**6. ListTile**

   Digunakan untuk menampilkan nama resep dan tombol hapus dalam satu baris.
   
   🖿: home_page.dart

   ```dart
ListTile(
  title: Text("𐂐 ${r.nama}"),
  subtitle: const Text('Tap untuk lihat detail'),
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailResep(
          resep: r,
          index: index,
          onUpdate: updateResep,
        ),
      ),
    );
  },
);
```

**7. Text**

   Digunakan untuk menampilkan teks seperti nama resep, bahan, dan langkah.

   🖿: home_page.dart, detail_resep.dart, form_resep.dart

   ```dart
Text(
  "𐂐 ${r.nama}",
  style: const TextStyle(
    fontWeight: FontWeight.bold,
  ),
),
```

**8. TextField**  

   Digunakan untuk input data resep (nama, bahan, langkah, URL gambar).

   🖿: form_resep.dart

   ```dart
TextField(
  controller: nameController,
  decoration: InputDecoration(
    labelText: '…',
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(50),
      borderSide: const BorderSide(color: darkChoco),
    ),
  ),
),
```

**9. ElevatedButton**  

   Digunakan untuk tombol Simpan pada form.

   🖿: form_resep.dart

   ```dart
ElevatedButton(
  style: ElevatedButton.styleFrom(
    backgroundColor: darkChoco,
  ),
  onPressed: simpanResep,
  child: const Text('Simpan'),
),
```

**10. FloatingActionButton**  

   Digunakan untuk tombol tambah resep.

   🖿: home_page.dart

   ```dart
FloatingActionButton(
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

**11. IconButton**  

   Digunakan untuk tombol edit dan hapus.

   🖿: home_page.dart, detail_resep.dart

   ```dart
IconButton(
  icon: const Icon(Icons.delete, color: coffee),
  onPressed: () {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Hapus Resep'),
      ),
    );
  },
),
```

**12. Navigator & MaterialPageRoute**  

   Digunakan untuk berpindah halaman (Multi Page Navigation).

   🖿: home_page.dart, detail_resep.dart, form_resep.dart

   ```dart
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => DetailResep(
      resep: r,
      index: index,
      onUpdate: updateResep,
    ),
  ),
);
```

**13. AlertDialog**  

   Digunakan sebagai konfirmasi sebelum menghapus resep.

   🖿: home_page.dart

   ```dart
showDialog(
  context: context,
  builder: (context) {
    return AlertDialog(
      title: const Text('Hapus Resep'),
      content: const Text('Yakin mau hapus resep ini?'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Batal'),
        ),
        TextButton(
          onPressed: () {
            hapusResep(index);
            Navigator.pop(context);
          },
          child: const Text('Hapus'),
        ),
      ],
    );
  },
);
```

**14. Column, Padding, SizedBox**  

   Digunakan untuk mengatur tata letak dan jarak antar elemen.

   🖿: home_page.dart, detail_resep.dart, form_resep.dart

   ```dart
Padding(
  padding: const EdgeInsets.all(25),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text('🥘─── Bahan:'),
      const SizedBox(height: 5),
      Text(resep.bahan),
    ],
  ),
);
```

**15. Container & ClipRRect**  

   Digunakan untuk styling gambar (border dan rounded corner).

   🖿: home_page.dart, detail_resep.dart

   ```dart
Container(
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(30),
    border: Border.all(color: darkChoco, width: 10),
  ),
  child: ClipRRect(
    borderRadius: BorderRadius.circular(20),
    child: Image.network(resep.gambar),
  ),
);
```

**16. Image.network**

   Digunakan untuk menampilkan gambar resep dari URL.

   🖿: home_page.dart, detail_resep.dart

   ```dart
Image.network(
  r.gambar,
  width: double.infinity,
  height: 125,
  fit: BoxFit.cover,
),
```

## ── ⟡ ˙Tampilan Aplikasi

**1. Halaman Utama**  

Halaman ini menampilkan daftar resep dalam bentuk card dengan gambar di bagian atas dan nama resep di bawahnya. Terdapat tombol tambah (+) di pojok kanan bawah untuk menambahkan resep baru. Setiap resep memiliki tombol hapus dan dapat ditekan untuk melihat detailnya.

<img width="250" height="550" alt="image" src="https://github.com/user-attachments/assets/e479ce7f-842b-4394-b9fb-cfeb7875a89e" />

**2. Halaman Detail Resep**  

Halaman ini menampilkan gambar resep yang lebih besar, serta informasi bahan dan langkah memasaknya. Terdapat tombol edit di bagian kanan atas untuk mengubah data resep.

<img width="250" height="550" alt="image" src="https://github.com/user-attachments/assets/f9084c88-f17e-4e5b-b790-845d640a2c16" />

**3. Halaman Form Tambah / Edit Resep**

Halaman ini berisi 4 input field:

- Nama Masakan

- Bahan

- Langkah

- URL Gambar (Opsional)

Terdapat tombol “Simpan” yang digunakan untuk menyimpan data resep.

<img width="250" height="550" alt="image" src="https://github.com/user-attachments/assets/536af0e6-03f7-4142-8c96-9a71bc3aebda" /> <img width="250" height="550" alt="image" src="https://github.com/user-attachments/assets/c09bbca0-878c-4c06-a145-647bdd1890ca" />



