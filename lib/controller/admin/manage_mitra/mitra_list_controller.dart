import 'package:get/get.dart';
import 'package:sikilap/controller/my_controller.dart';
import 'package:sikilap/model/mitra_model.dart';

class MitraListController extends MyController {
  List<MitraModel> mitra = [];

  @override
  void onInit() {
    MitraModel.dummyList.then((value) {
      mitra = value;
      update();
    });
    super.onInit();
  }

//as
  void addMitra() {
    Get.toNamed('/admin/mitra/add');
  }

  void editMitra() {
    Get.toNamed('/admin/mitra/edit');
  }

  void viewDetail() {
    Get.toNamed('/admin/mitra/detail');
  }
}
