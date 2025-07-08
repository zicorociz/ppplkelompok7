// lib/controller/client/home_controller.dart

import 'package:get/get.dart';
import 'package:sikilap/controller/my_controller.dart';
import 'package:sikilap/model/mitra_model.dart';
import 'package:sikilap/model/layanan_model.dart';

class HomeController extends MyController {
  List<MitraModel> mitra = []; // Daftar Mitra
  List<LayananModel> allLayanan = []; // Daftar semua Layanan

  final List<String> destinations = [
    'New York',
    'Los Angeles',
    'Paris',
    'Tokyo',
    'London'
  ];
  final List<String> offers = [
    '10% OFF',
    'Free Breakfast',
    'Free Cancellation',
    'Early Check-in',
    'Late Check-out',
    'Free Wi-Fi'
  ];
  final List<String> featuredImages = [
    'assets/images/dummy/mitra/hotel_1.jpg',
    'assets/images/dummy/mitra/hotel_2.jpg',
    'assets/images/dummy/mitra/hotel_3.jpg',
    'assets/images/dummy/mitra/hotel_4.jpg',
    'assets/images/dummy/mitra/hotel_5.jpg',
  ];

  @override
  void onInit() {
    super.onInit();
    MitraModel.dummyList.then((value) {
      mitra = value;
      update();
    });
    LayananModel.dummyList.then((value) {
      allLayanan = value;
      update();
    });
  }

  /// Fungsi ini dipanggil saat pengguna mengklik sebuah MITRA.
  /// Tujuannya adalah langsung membuka detail untuk SATU LAYANAN UNGGULAN dari mitra itu.
  void goToMitraDetail(MitraModel selectedMitra) {
    if (allLayanan.isNotEmpty) {
      // Cari layanan pertama yang dimiliki oleh mitra yang diklik
      LayananModel? layananUnggulan = allLayanan.firstWhereOrNull(
        (layanan) => layanan.mitraId == selectedMitra.id,
      );

      if (layananUnggulan != null) {
        // Jika ditemukan, langsung kirim ke halaman detail layanan
        Get.toNamed('/room_detail', arguments: layananUnggulan);
      } else {
        Get.snackbar("Info", "Mitra ini belum memiliki layanan.",
            snackPosition: SnackPosition.BOTTOM);
      }
    }
  }

  /// Fungsi ini dipanggil saat pengguna mengklik sebuah LAYANAN UNGGULAN.
  /// Tujuannya adalah membuka halaman PILIH LAYANAN untuk mitra yang memiliki layanan itu.
  void goToLayananSelection(LayananModel selectedLayanan) {
    if (this.mitra.isNotEmpty) {
      // Cari mitra yang memiliki layanan ini
      MitraModel? mitraPemilik = this.mitra.firstWhereOrNull(
            (mitra) => mitra.id == selectedLayanan.mitraId,
          );

      if (mitraPemilik != null) {
        // Jika ditemukan, kirim data mitra ke halaman pemilihan layanan
        Get.toNamed('/room_selection', arguments: mitraPemilik);
      } else {
        Get.snackbar("Error", "Data mitra untuk layanan ini tidak ditemukan.",
            snackPosition: SnackPosition.BOTTOM);
      }
    }
  }
}
