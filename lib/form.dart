import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:praktikum_7/db_provider.dart';
import 'package:praktikum_7/perpustakaan.dart';

class FormPage extends StatefulWidget {
  final Perpustakaan? perpustakaan;

  const FormPage({Key? key, this.perpustakaan}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _alamatController = TextEditingController();
  final TextEditingController _nohpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("DATA BUKU"),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.close,
                size: 20,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextField(
                  controller: _namaController,
                  decoration: InputDecoration(
                    label: const Text('Nama Peminjam'),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          width: 5, color: Color.fromARGB(255, 110, 53, 0)),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                          width: 5, color: Color.fromARGB(255, 110, 53, 0)),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    label: const Text('Judul Buku'),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          width: 5, color: Color.fromARGB(255, 110, 53, 0)),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                          width: 5, color: Color.fromARGB(255, 110, 53, 0)),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: _alamatController,
                  decoration: InputDecoration(
                    label: const Text('Alamat'),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          width: 5, color: Color.fromARGB(255, 110, 53, 0)),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                          width: 5, color: Color.fromARGB(255, 110, 53, 0)),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: _nohpController,
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    label: const Text('No HP'),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          width: 5, color: Color.fromARGB(255, 110, 53, 0)),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                          width: 5, color: Color.fromARGB(255, 110, 53, 0)),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  width: 100,
                  height: 40,
                  child: FloatingActionButton.extended(
                    onPressed: () async {
                      final perpustakaan = Perpustakaan(
                          nama: _namaController.text,
                          judulbuku: _emailController.text,
                          alamat: _alamatController.text,
                          nohp: _nohpController.text);
                      Provider.of<DbProvider>(context, listen: false)
                          .addPerpustakaans(perpustakaan);
                      Navigator.pop(context);
                    },
                    label: const Text("Simpan Data"),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                  ),
                )
              ]),
        ),
      )),
    );
  }
}
