import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:stay_place/controller/my_controller.dart';
import 'package:stay_place/helpers/widgets/my_text_utils.dart';

class RoomDetailController extends MyController {
  List<String> dummyTexts = List.generate(12, (index) => MyTextUtils.getDummyText(60));

  List amenities = [
    {"icon": LucideIcons.wifi, "name": "High speed WiFi"},
    {"icon": LucideIcons.lock, "name": "Saving Safe"},
    {"icon": LucideIcons.user, "name": "Hair Dryer"},
    {"icon": LucideIcons.tv, "name": "Cable TV"},
    {"icon": LucideIcons.refresh_ccw, "name": "Laundry"},
  ];
}
