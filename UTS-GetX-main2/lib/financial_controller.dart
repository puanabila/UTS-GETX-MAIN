import 'package:get/get.dart';

class FinancialController extends GetxController {
  var catatan = <Map<String, dynamic>>[].obs;
  var totalPemasukan = 0.obs;
  var totalPengeluaran = 0.obs;

  void tambahCatatan(Map<String, dynamic> baru) {
    catatan.add(baru);
    hitungTotal();
  }

  void hapusCatatan(int index) {
    catatan.removeAt(index);
    hitungTotal();
  }

  void hitungTotal() {
    totalPemasukan.value = 0;
    totalPengeluaran.value = 0;
    for (var item in catatan) {
      if (item['kategori'] == 'Pemasukkan') {
        totalPemasukan += item['jumlah'] as int;
      } else {
        totalPengeluaran += item['jumlah'] as int;
      }
    }
  }
}