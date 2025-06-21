import 'package:stay_place/helpers/widgets/my_text_utils.dart';
import 'package:stay_place/model/drag_n_drop.dart';
import 'package:stay_place/controller/my_controller.dart';

class TimeLineController extends MyController {
  List<DragNDropModel> timeline = [];
  List<String> dummyTexts = List.generate(12, (index) => MyTextUtils.getDummyText(60));

  @override
  void onInit() {
    DragNDropModel.dummyList.then((value) {
      timeline = value.sublist(0, 6);
      update();
    });
    super.onInit();
  }
}
