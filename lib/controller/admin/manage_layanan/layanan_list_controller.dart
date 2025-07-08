import 'package:get/get.dart';
import 'package:sikilap/controller/my_controller.dart';
import 'package:sikilap/model/layanan_model.dart';

class LayananListController extends MyController {
  List<LayananModel> layanan = [];

  @override
  void onInit() {
    LayananModel.dummyList.then((value) {
      layanan = value;
      update();
    });
    super.onInit();
  }

//as
  void gotoAddLayanan() {
    Get.toNamed('/admin/layanan/add');
  }

  void layananDetail() {
    Get.toNamed('/admin/layanan/detail');
  }

  void editLayanan() {
    Get.toNamed('/admin/layanan/edit');
  }
}
