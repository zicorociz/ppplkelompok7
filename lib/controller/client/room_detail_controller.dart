// lib/controller/client/room_detail_controller.dart

import 'package:stay_place/controller/my_controller.dart';
import 'package:stay_place/model/room_model.dart';

class RoomDetailController extends MyController {
  // Terima RoomModel dari halaman sebelumnya
  final RoomModel? room;

  // Constructor yang menerima data kamar
  RoomDetailController(this.room);

  // Tidak perlu onInit jika semua data sudah diterima dari constructor
  @override
  void onInit() {
    super.onInit();
    // Kamu bisa melakukan sesuatu dengan data `room` di sini jika perlu
  }
}
