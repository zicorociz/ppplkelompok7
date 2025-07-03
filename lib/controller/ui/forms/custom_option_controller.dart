import 'package:sikilap/helpers/widgets/my_text_utils.dart';
import 'package:sikilap/controller/my_controller.dart';

enum Gender {
  male,
  female,
  none;

  const Gender();
}

//as
class CustomOptionController extends MyController {
  int selectRadioButton = 0;
  int customRadioButton = 0;
  int customImageRadioButton = 0;
  Gender selectedGender = Gender.male;
  List<String> dummyTexts = List.generate(
      12, (index) => MyTextUtils.getDummyText(60, withEmoji: true));

  void onChangeCustomButton(id) {
    customRadioButton = id ?? customRadioButton;
    update();
  }

  void onChangeCustomImageRadioButton(id) {
    customImageRadioButton = id ?? customImageRadioButton;
    update();
  }

  void onSelectButton(id) {
    selectRadioButton = id ?? selectRadioButton;
    update();
  }

  void onChangeGender(Gender? value) {
    selectedGender = value ?? selectedGender;
    update();
  }
}
