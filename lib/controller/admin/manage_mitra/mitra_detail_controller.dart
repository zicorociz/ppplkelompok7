import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sikilap/controller/my_controller.dart';
import 'package:sikilap/helpers/widgets/my_text_utils.dart';
import 'package:sikilap/model/layanan_model.dart';

class MitraDetailController extends MyController {
  List<LayananModel> layanan = [];
  int isSelectedTab = 0;

  late GoogleMapController mapController;

  LatLng center = LatLng(37.7749, -122.4194);

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

//as
  List<String> dummyTexts =
      List.generate(12, (index) => MyTextUtils.getDummyText(60));

  List mitraImage = [
    "assets/images/dummy/mitra/hotel_1.jpg",
    "assets/images/dummy/mitra/hotel_2.jpg",
    "assets/images/dummy/mitra/hotel_3.jpg",
    "assets/images/dummy/mitra/hotel_4.jpg",
    "assets/images/dummy/mitra/hotel_5.jpg",
    "assets/images/dummy/mitra/hotel_6.jpg",
    "assets/images/dummy/mitra/hotel_7.jpg",
  ];

  List basicFacility = [
    "Free Wi-Fi",
    "Room Service",
    "Elevator Lift",
    "Laundry Service",
    "Power Backup",
    "Free Parking"
  ];

  List paymentMode = [
    "Visa Card",
    "Master Card",
    "American express",
    "Debit Card",
    "Cash",
    "Online Banking"
  ];

  List security = [
    "Security Guard",
    "CCTV",
    "Emergency Exit",
    "Doctor On Call"
  ];

  List foodAndDrinks = ["Restaurant", "Bar"];

  List activities = ["GYM", "Game Zon", "Swimming Pool"];

  List<String> tabTitles = ["Rooms", "About", "Facility", "Location"];

  @override
  void onInit() {
    LayananModel.dummyList.then((value) {
      layanan = value.sublist(0, 4);
      update();
    });
    super.onInit();
  }

  void onSelectTab(int id) {
    isSelectedTab = id;
    update();
  }
}
