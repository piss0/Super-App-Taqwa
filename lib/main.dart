import 'dart:io';

import 'package:bitaqwa/pages/detail_kajian_page.dart';
import 'package:bitaqwa/pages/doa_page.dart';
import 'package:bitaqwa/pages/homePage.dart';
import 'package:bitaqwa/pages/kajian_page.dart';
import 'package:bitaqwa/pages/sholat_page.dart';
import 'package:bitaqwa/pages/zakat_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  /// 🔹 Pastikan Flutter sudah siap sebelum menjalankan async
  WidgetsFlutterBinding.ensureInitialized();
 
  /// 🔹 Inisialisasi format tanggal bahasa Indonesia
  /// Contoh hasil: “Senin, 6 November 2025”
  await initializeDateFormatting('id_ID', null);
 
  /// 🔹 Override SSL supaya koneksi HTTP/HTTPS yang self-signed tetap bisa jalan
  HttpOverrides.global = MyHttpOverrides();
 
  /// 🔹 Jalankan aplikasi utama
  runApp(const MyApp());
}
 
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (cert, host, port) => true;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context) => HomePage (),
        '/doa-harian' : (context) => DoaPage(),
        '/zakat' : (context) => ZakatPage(),
        '/sholat' : (context) => SholatPage(),
        '/kajian' : (context) => KajianPage()
      },
    );
  }
}
