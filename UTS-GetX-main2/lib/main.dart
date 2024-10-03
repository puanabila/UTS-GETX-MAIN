import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uts_papb/main_page.dart';
import 'package:uts_papb/financial_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Aplikasi Keuangan',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialBinding: BindingsBuilder(() {
        Get.put(FinancialController());
      }),
      home: MainPage(),
    );
  }
}