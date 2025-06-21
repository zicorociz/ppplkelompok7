import 'package:get/get.dart';
import 'package:stay_place/controller/my_controller.dart';
import 'package:stay_place/model/hotel_model.dart';
import 'package:stay_place/model/room_model.dart';

class HomeController extends MyController {
  List<HotelModel> hotel = [];
  List<RoomModel> room = [];
  final List<String> destinations = ['New York', 'Los Angeles', 'Paris', 'Tokyo', 'London'];
  final List<String> offers = ['10% OFF', 'Free Breakfast', 'Free Cancellation', 'Early Check-in', 'Late Check-out', 'Free Wi-Fi'];

  final List<String> featuredImages = [
    'assets/images/dummy/hotel/hotel_1.jpg',
    'assets/images/dummy/hotel/hotel_2.jpg',
    'assets/images/dummy/hotel/hotel_3.jpg',
    'assets/images/dummy/hotel/hotel_4.jpg',
    'assets/images/dummy/hotel/hotel_5.jpg',
  ];

  @override
  void onInit() {
    HotelModel.dummyList.then((value) {
      hotel = value;
      update();
    });

    RoomModel.dummyList.then((value) {
      room = value;
      update();
    });
    super.onInit();
  }

  void goToHotelDetail() {
    Get.toNamed('/admin/hotel/detail');
  }

  void goToRoomDetail() {
    Get.toNamed('/admin/room/detail');
  }
}
