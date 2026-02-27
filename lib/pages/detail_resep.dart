import 'package:flutter/material.dart';
import '../models/resep.dart';
import '../theme/color_palette.dart';
import 'form_resep.dart';

class DetailResep extends StatelessWidget {
  final Resep resep;
  final int index;
  final Function(int, Resep) onUpdate;

  const DetailResep({
    super.key,
    required this.resep,
    required this.index,
    required this.onUpdate,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(resep.nama),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () async {
              final hasil = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FormResep(resep: resep),
                ),
              );
              if (hasil != null) {
                onUpdate(index, hasil);
                // ignore: use_build_context_synchronously
                Navigator.pop(context);
              }
            },
          )
        ],
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: darkChoco,   
                    width: 10,       
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    resep.gambar,
                    width: double.infinity,
                    height: 220,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                '🥘─── Bahan:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: coffee,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                resep.bahan,
                style: const TextStyle(color: mediumBrown, fontSize: 15),
              ),
              const SizedBox(height: 20),
              const Text(
                '🥘─── Langkah:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: coffee,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                resep.langkah,
                style: const TextStyle(color: mediumBrown),
              ),
            ],
          ),
        ),
      ),
    );
  }
}