import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uts_papb/financial_controller.dart';

class TambahCatatan extends GetView<FinancialController> {
  final TextEditingController _judulController = TextEditingController();
  final TextEditingController _jumlahController = TextEditingController();
  final RxString _selectedCategory = ''.obs;

  @override
  Widget build(BuildContext context) {
    final List<String> _categories = ['Pemasukkan', 'Pengeluaran'];

    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Catatan Finansial'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextField(
                controller: _judulController,
                decoration: InputDecoration(
                  labelText: 'Judul Catatan',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              Obx(() => DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Kategori',
                  border: OutlineInputBorder(),
                ),
                value: _selectedCategory.value.isEmpty ? null : _selectedCategory.value,
                items: _categories.map((String category) {
                  return DropdownMenuItem<String>(
                    value: category,
                    child: Text(category),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  _selectedCategory.value = newValue!;
                },
              )),
              SizedBox(height: 20),
              TextField(
                controller: _jumlahController,
                decoration: InputDecoration(
                  labelText: 'Jumlah Uang',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_judulController.text.isNotEmpty &&
                      _selectedCategory.value.isNotEmpty &&
                      _jumlahController.text.isNotEmpty) {
                    controller.tambahCatatan({
                      'judul': _judulController.text,
                      'kategori': _selectedCategory.value,
                      'jumlah': int.parse(_jumlahController.text),
                    });
                    Get.back();
                  } else {
                    Get.snackbar(
                      'Error',
                      'Mohon isi semua field',
                      snackPosition: SnackPosition.BOTTOM,
                    );
                  }
                },
                child: Text('Simpan Catatan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}