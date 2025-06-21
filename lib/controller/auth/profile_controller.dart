// lib/controller/profile_controller.dart
import 'package:stay_place/controller/my_controller.dart';
import 'package:stay_place/helpers/services/auth_services.dart';
import 'package:stay_place/model/user.dart';

class ProfileController extends MyController {
  // Ambil data user langsung dari AuthService
  User? user = AuthService.loggedInUser.value;

  // Kamu bisa tambahkan fungsi untuk mengedit profil di sini
  void editProfile() {
    // ... logika untuk membuka halaman edit atau dialog
  }
}
