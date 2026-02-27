import 'package:flutter/material.dart';
import 'package:my_recipeez/theme/color_palette.dart';
import '../models/resep.dart';

class FormResep extends StatefulWidget {
  final Resep? resep; 
  const FormResep({super.key, this.resep});

  @override
  State<FormResep> createState() => _FormResepState();
}

class _FormResepState extends State<FormResep> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ingredientsController = TextEditingController();
  final TextEditingController stepsController = TextEditingController();
  final TextEditingController imageController = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (widget.resep != null) {
      nameController.text = widget.resep!.nama;
      ingredientsController.text = widget.resep!.bahan;
      stepsController.text = widget.resep!.langkah;
      imageController.text = widget.resep!.gambar;
    }
  }

  void simpanResep() {
    if (nameController.text.isEmpty ||
        ingredientsController.text.isEmpty ||
        stepsController.text.isEmpty) {
      return;
    }

    final resepBaru = Resep(
      nama: nameController.text,
      bahan: ingredientsController.text,
      langkah: stepsController.text,
      gambar: imageController.text.isEmpty
          ? 'https://via.placeholder.com/150'
          : imageController.text,
    );

    Navigator.pop(context, resepBaru);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.resep == null ? 'Tambah Resep' : 'Edit Resep'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Nama Masakan:', style: TextStyle(color: coffee)), 
              const SizedBox(height: 7),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: '…',
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  filled: false,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: const BorderSide (color: darkChoco),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: const BorderSide(
                      color: darkChoco,
                      width: 2,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              const Text('Bahan:', style: TextStyle(color: mediumBrown)), 
              const SizedBox(height: 7),
              TextField(
                controller: ingredientsController,
                maxLines: 4,
                decoration: InputDecoration(
                  labelText: '…',
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  filled: false,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: const BorderSide (color: darkChoco),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: const BorderSide(
                      color: darkChoco,
                      width: 2,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              const Text('Langkah:', style: TextStyle(color: coffee)), 
              const SizedBox(height: 7),
              TextField(
                controller: stepsController,
                maxLines: 4,
                decoration: InputDecoration(
                  labelText: '…',
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  filled: false,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: const BorderSide (color: darkChoco),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: const BorderSide(
                      color: darkChoco,
                      width: 2,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              const Text('URL Gambar (Opsional):', style: TextStyle(color: mediumBrown)), 
              const SizedBox(height: 7),
              TextField(
                controller: imageController,
                decoration: InputDecoration(
                  labelText: '…',
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  filled: false,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: const BorderSide (color: darkChoco),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: const BorderSide(
                      color: darkChoco,
                      width: 2,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: darkChoco,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                onPressed: simpanResep,
                child: const Text('Simpan', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}