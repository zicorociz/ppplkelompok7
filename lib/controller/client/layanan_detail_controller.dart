// lib/controller/client/room_detail_controller.dart

import 'package:get/get.dart';
import 'package:sikilap/controller/my_controller.dart';
import 'package:sikilap/model/mitra_model.dart'; // <-- IMPORT BARU
import 'package:sikilap/model/layanan_model.dart';

class LayananDetailController extends MyController {
  final LayananModel? layanan;

  // Kita akan butuh data mitra juga, jadi kita cari dulu
  MitraModel? mitra;

  LayananDetailController(this.layanan);

  @override
  void onInit() {
    super.onInit();
    _findMitraForThisLayanan();
  }

  Future<void> _findMitraForThisLayanan() async {
    if (layanan != null) {
      // Ambil semua data mitra
      List<MitraModel> allMitra = await MitraModel.dummyList;
      // Cari mitra yang ID-nya cocok dengan hotelId di kamar
      mitra = allMitra.cast<MitraModel?>().firstWhere(
            (h) => h != null && h.id == layanan!.mitraId,
            orElse: () => null,
          );
      update();
    }
  }

  // FUNGSI BARU UNTUK NAVIGASI
  void goToLayananSelection() {
    // Pastikan kita punya data Mitra sebelum navigasi
    if (mitra != null) {
      // Arahkan ke halaman pemilihan layanan dan kirim data Mitra
      Get.toNamed('/room_selection', arguments: mitra);
    } else {
      Get.snackbar("Error", "Informasi mitra tidak ditemukan.");
    }
  }
}
