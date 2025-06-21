import 'package:get/get.dart';
import 'package:stay_place/controller/my_controller.dart';
import 'package:stay_place/model/guest_model.dart';

class GuestListController extends MyController {
  List<GuestModel> guest = [];

  @override
  void onInit() {
    GuestModel.dummyList.then((value) {
      guest = value;
      update();
    });
    super.onInit();
  }

  void editGuest() {
    Get.toNamed('/admin/guest/edit');
  }

  void addGuest() {
    Get.toNamed('/admin/guest/add');
  }
}
