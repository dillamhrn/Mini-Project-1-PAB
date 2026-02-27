import 'package:flutter/material.dart';
import '../models/resep.dart';
import '../theme/color_palette.dart';
import 'form_resep.dart';
import 'detail_resep.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Resep> daftarResep = [
    Resep(
      nama: 'Nasi Goreng',
      bahan: 'Nasi, telur, bawang, kecap, garam',
      langkah: '1) Tumis bawang\n2) Masukkan telur\n3) Masukkan nasi + kecap',
      gambar: 'https://assets.telkomsel.com/public/2024-09/4432.png',
    ),
    Resep(
      nama: 'Ayam Bakar',
      bahan: 'Dada ayam\nKecap manis\nBawang putih\nGaram\nNasi putih',
      langkah: '1) Marinasi ayam dengan bumbu\n2) Panggang hingga matang\n3) Sajikan dengan nasi hangat',
      gambar: 'https://buckets.sasa.co.id/v1/AUTH_Assets/Assets/p/website/medias/page_medias/Screen_Shot_2023-01-09_at_17_40_36_(1)_(1)_(1)_(1)_(1)_(1)_(1)_(1).png',
    ),
    Resep(
      nama: 'Mie Goreng Pedas',
      bahan: 'Mie telur\nCabe rawit\nBawang putih\nKecap asin\nTelur',
      langkah: '1) Rebus mie\n2) Tumis bawang & cabe\n3) Masukkan telur\n4) Tambahkan mie & kecap\n5) Aduk rata',
      gambar: 'https://cdn0-production-images-kly.akamaized.net/qtg-fG4Tc5AfsTKqdVEDz01g82Y=/1x65:1000x628/673x378/filters:quality(75):strip_icc():format(webp)/kly-media-production/medias/3543281/original/069457500_1629258934-shutterstock_1546959563.jpg',
    ),
    Resep(
      nama: 'Ayam Geprek',
      bahan: 'Ayam goreng\nCabe rawit\nBawang putih\nGaram\nMinyak panas',
      langkah: '1) Goreng ayam hingga crispy\n2) Haluskan cabe & bawang\n3) Geprek ayam bersama sambal\n4) Sajikan',
      gambar: 'https://assets.unileversolutions.com/recipes-v2/257353.jpg',
    ),
      Resep(
      nama: 'Spaghetti Aglio Olio',
      bahan: 'Spaghetti\nBawang putih\nCabai kering\nMinyak zaitun\nGaram',
      langkah: '1) Rebus spaghetti\n2) Tumis bawang & cabai\n3) Masukkan spaghetti\n4) Aduk rata dan sajikan',
      gambar: 'https://assets.unileversolutions.com/recipes-v2/258467.jpg',
    ),
      Resep(
      nama: 'Tahu Isi Goreng',
      bahan: 'Tahu putih\nWortel\nKol\nTepung\nMinyak goreng',
      langkah: '1) Campur isian sayur\n2) Isi ke dalam tahu\n3) Balur tepung\n4) Goreng hingga keemasan',
      gambar: 'https://asset.kompas.com/crops/r7t6Ib8XNUEVtmBZ-VQ0vHgd0fk=/0x0:698x465/1200x800/data/photo/2021/03/16/6050217084fc5.jpg',
    ),
  ];

  void tambahResep(Resep resepBaru) {
    setState(() {
      daftarResep.add(resepBaru);
    });
  }

  void hapusResep(int index) {
    setState(() {
      daftarResep.removeAt(index);
    });
  }

  void updateResep(int index, Resep resepBaru) {
    setState(() {
      daftarResep[index] = resepBaru;
    });
  }

  @override
  Widget build(BuildContext context) {
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

      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView.builder(
          itemCount: daftarResep.length,
          itemBuilder: (context, index) {
            final r = daftarResep[index];

            return Card(
              margin: const EdgeInsets.all(9),
              color: const Color.fromARGB(255, 255, 255, 255),
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(30),
                    ),
                    child: Image.network(
                      r.gambar,
                      width: double.infinity,
                      height: 125,
                      fit: BoxFit.cover,
                    ),
                  ),

                  ListTile(
                    title: Text(
                      "𐂐 ${r.nama}",
                      style: const TextStyle(
                        color: coffee,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: const Text(
                      'Tap untuk lihat detail',
                      style: TextStyle(color: mediumBrown),
                    ),
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

                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: coffee),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              backgroundColor: Colors.white,
                              title: const Text('Hapus Resep'),
                              content: const Text('Yakin mau hapus resep ini?🤔'),
                              actions: [
                                TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: breadCream
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context); 
                                  },
                                  child: const Text('Batal', style: TextStyle(color: darkChoco)),),
                                
                                TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: darkChoco
                                  ),
                                  onPressed: () {
                                    hapusResep(index);
                                    Navigator.pop(context); 
                                  },
                                  child: const Text(
                                    'Hapus',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}