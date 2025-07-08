// lib/controller/client/room_selection_controller.dart

import 'package:get/get.dart';
// Ganti path model dengan yang benar di proyekmu
import 'package:sikilap/model/mitra_model.dart';
import 'package:sikilap/model/layanan_model.dart';
import 'package:sikilap/controller/my_controller.dart';

class LayananSelectionController extends MyController {
  final MitraModel? mitra; // Untuk menyimpan data Mitra yang dipilih
  List<LayananModel> allLayanans = [];
  List<LayananModel> layanan = []; // Kamar yang sudah difilter untuk Mitra ini

  // Constructor yang dimodifikasi untuk menerima data Mitra
  LayananSelectionController(this.mitra);

  @override
  void onInit() {
    super.onInit();
    _loadAndFilterLayanan();
  }

  Future<void> _loadAndFilterLayanan() async {
    // Pastikan kita punya data Mitra
    if (mitra != null) {
      // Ambil semua data layanan
      allLayanans = await LayananModel.dummyList;

      // Filter layanan berdasarkan ID Mitra
      layanan =
          allLayanans.where((layanan) => layanan.mitraId == mitra!.id).toList();

      // Update UI untuk menampilkan layanan yang sudah difilter
      update();
    }
  }

  void onFavouriteToggle(LayananModel layanan) {
    layanan.isFavourite = !layanan.isFavourite;
    update();
  }

  // FUNGSI BARU UNTUK NAVIGASI
  void goToBookingForm(LayananModel selectedLayanan) {
    // Siapkan data Mitra dan Layanan untuk dikirim
    Map<String, dynamic> bookingData = {
      'mitra': mitra,
      'layanan': selectedLayanan,
    };
    // Arahkan ke form pemesanan dengan membawa data
    Get.toNamed('/booking_form', arguments: bookingData);
  }
}
