import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:praktikum_7/db_provider.dart';
import 'package:praktikum_7/detail_page.dart';
import 'package:praktikum_7/form.dart';
import 'package:praktikum_7/form_update.dart';

class PerpustakaanListPage extends StatefulWidget {
  const PerpustakaanListPage({super.key});

  @override
  State<PerpustakaanListPage> createState() => _PerpustakaanListPageState();
}

class _PerpustakaanListPageState extends State<PerpustakaanListPage> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("PERPUSTAKAAN SINAR DUNIA"),
        leading: Icon(Icons.book),
        automaticallyImplyLeading: false,
      ),
      body: Consumer<DbProvider>(
        builder: (context, provider, child) {
          final perpustakaans = provider.perpustakaans;
          return ListView.builder(
            itemCount: perpustakaans.length,
            itemBuilder: (context, index) {
              final perpustakaan = perpustakaans[index];
              return Dismissible(
                key: Key(perpustakaan.id.toString()),
                onDismissed: (direction) {},
                child: Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5, top: 3),
                  child: Card(
                    child: ListTile(
                      title: Text(perpustakaan.nama),
                      subtitle: Text(perpustakaan.alamat),
                      onTap: () async {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  DetailPage(perpustakaan: perpustakaan),
                            ));
                      },
                      trailing: Wrap(children: <Widget>[
                        IconButton(
                          color: Color.fromARGB(255, 110, 53, 0),
                          onPressed: () async {
                            Provider.of<DbProvider>(context, listen: false)
                                .deletePerpustakaans(perpustakaan.id!);
                          },
                          icon: const Icon(Icons.delete_outline),
                        ),
                        IconButton(
                          color: Color.fromARGB(255, 110, 53, 0),
                          onPressed: () async {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return UpdatePage(perpustakaan: perpustakaan);
                            }));
                          },
                          icon: const Icon(Icons.edit_outlined),
                        ),
                        IconButton(
                          color: Color.fromARGB(255, 110, 53, 0),
                          onPressed: () async {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return DetailPage(perpustakaan: perpustakaan);
                            }));
                          },
                          icon: const Icon(Icons.book),
                        ),
                      ]),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text('TAMBAH'),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const FormPage(),
              ));
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
