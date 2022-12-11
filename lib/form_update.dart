import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:praktikum_7/db_provider.dart';
import 'package:praktikum_7/perpustakaan.dart';

class UpdatePage extends StatefulWidget {
  final Perpustakaan? perpustakaan;

  const UpdatePage({Key? key, this.perpustakaan}) : super(key: key);

  @override
  State<UpdatePage> createState() => _FormPageState();
}

class _FormPageState extends State<UpdatePage> {
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _judulbukuController = TextEditingController();
  final TextEditingController _alamatController = TextEditingController();
  final TextEditingController _nohpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print(widget.perpustakaan!.id);
    _namaController.text = widget.perpustakaan!.nama;
    _judulbukuController.text = widget.perpustakaan!.judulbuku;
    _alamatController.text = widget.perpustakaan!.alamat;
    _nohpController.text = widget.perpustakaan!.nohp;

    return Scaffold(
      appBar: AppBar(
        title: const Text("EDIT"),
        leading: Icon(Icons.edit_note),
        automaticallyImplyLeading: false,
        elevation: 0,
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
                  controller: _judulbukuController,
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
                    width: 150,
                    height: 40,
                    child: FloatingActionButton.extended(
                      onPressed: () async {
                        final perpustakaan = Perpustakaan(
                            id: widget.perpustakaan!.id!,
                            nama: _namaController.text,
                            judulbuku: _judulbukuController.text,
                            alamat: _alamatController.text,
                            nohp: _nohpController.text);
                        Provider.of<DbProvider>(context, listen: false)
                            .updatePerpustakaans(perpustakaan);
                        Navigator.pop(context);
                      },
                      label: const Text("Simpan Perubahan"),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ))
              ]),
        ),
      )),
    );
  }
}
