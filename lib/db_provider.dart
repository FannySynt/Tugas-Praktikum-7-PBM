import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:praktikum_7/db_helper.dart';
import 'package:praktikum_7/perpustakaan.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _selectedTheme = ThemeData.dark().copyWith();
  ThemeProvider() {}

  Future<void> swapTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    notifyListeners();
  }

  ThemeData get getTheme => _selectedTheme;
}

class DbProvider extends ChangeNotifier {
  late DatabaseHelper _dbHelper;

  List<Perpustakaan> _perpustakaans = [];

  List<Perpustakaan> get perpustakaans => _perpustakaans;

  DbProvider() {
    _dbHelper = DatabaseHelper();
    _getAllPerpustakaans();
  }

  void _getAllPerpustakaans() async {
    _perpustakaans = await _dbHelper.getPerpustakaans();
    notifyListeners();
  }

  Future<void> addPerpustakaans(Perpustakaan perpustakaan) async {
    await _dbHelper.insertPerpustakaan(perpustakaan);
    _getAllPerpustakaans();
  }

  Future<void> deletePerpustakaans(int id) async {
    await _dbHelper.deletePerpustakaan(id);
    _getAllPerpustakaans();
  }

  Future<void> updatePerpustakaans(Perpustakaan perpustakaan) async {
    await _dbHelper.updatePerpustakaan(perpustakaan);
    _getAllPerpustakaans();
  }
}
