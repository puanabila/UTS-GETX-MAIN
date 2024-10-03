import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uts_papb/tambah_catatan.dart';
import 'package:uts_papb/financial_controller.dart';

class MainPage extends GetView<FinancialController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aplikasi Keuangan'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20),
            Obx(() => Text('Total Pemasukkan : Rp${controller.totalPemasukan}')),
            SizedBox(height: 20),
            Obx(() => Text('Total Pengeluaran : Rp${controller.totalPengeluaran}')),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Get.to(() => TambahCatatan()),
              child: Text('Tambah Catatan Finansial'),
            ),
            Expanded(
              child: Obx(() => ListView.builder(
                itemCount: controller.catatan.length,
                itemBuilder: (context, index) {
                  final item = controller.catatan[index];
                  return ListTile(
                    title: Text(item['judul']),
                    subtitle: Text('Rp${item['jumlah']}'),
                    leading: Text(
                      item['kategori'] == 'Pemasukkan' ? '💰' : '💸',
                      textScaler: TextScaler.linear(3),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () => controller.hapusCatatan(index),
                    ),
                  );
                },
              )),
            ),
          ],
        ),
      ),
    );
  }
}