import 'package:get/get.dart';
import 'package:stay_place/controller/my_controller.dart';
import 'package:stay_place/model/hotel_model.dart';

class HotelListController extends MyController {
  List<HotelModel> hotel = [];

  @override
  void onInit() {
    HotelModel.dummyList.then((value) {
      hotel = value;
      update();
    });
    super.onInit();
  }

  void addHotel() {
    Get.toNamed('/admin/hotel/add');
  }

  void editHotel() {
    Get.toNamed('/admin/hotel/edit');
  }

  void viewDetail() {
    Get.toNamed('/admin/hotel/detail');
  }
}
