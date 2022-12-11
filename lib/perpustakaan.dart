class Perpustakaan{
  late int? id;
  late String nama;
  late String judulbuku;
  late String alamat;
  late String nohp;

  Perpustakaan({
    this.id,
    required this.nama,
    required this.judulbuku,
    required this.alamat,
    required this.nohp,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nama': nama,
      'judulbuku': judulbuku,
      'alamat': alamat,
      'nohp': nohp,
    };
  }

  Perpustakaan.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    nama = map['nama'];
    judulbuku = map['judulbuku'];
    alamat = map['alamat'];
    nohp = map['nohp'];
  }
}