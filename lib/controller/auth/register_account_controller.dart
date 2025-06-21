import 'package:flutter/material.dart';
import 'package:stay_place/helpers/services/auth_services.dart';
import 'package:stay_place/helpers/widgets/my_form_validator.dart';
import 'package:stay_place/helpers/widgets/my_validators.dart';
import 'package:get/get.dart';
import 'package:stay_place/controller/my_controller.dart';

class RegisterAccountController extends MyController {
  var greeting = "Good Morning";
  late int currentTime = DateTime.now().hour;
  MyFormValidator basicValidator = MyFormValidator();

  bool showPassword = false;

  @override
  void onInit() {
    basicValidator.addField(
      'email',
      required: true,
      label: "Email",
      validators: [MyEmailValidator()],
      controller: TextEditingController(),
    );
    basicValidator.addField(
      'first_name',
      required: true,
      label: 'First Name',
      controller: TextEditingController(),
    );
    basicValidator.addField(
      'last_name',
      required: true,
      label: 'Last Name',
      controller: TextEditingController(),
    );
    basicValidator.addField(
      'password',
      required: true,
      validators: [MyLengthValidator(min: 6, max: 10)],
      controller: TextEditingController(),
    );
    if ((currentTime < 6) || (currentTime > 21)) {
      greeting = 'Good Night';
    } else if (currentTime < 12) {
      greeting = 'Good Morning';
    } else if (currentTime < 18) {
      greeting = 'Good Afternoon';
    } else if (currentTime < 22) {
      greeting = 'Good Evening';
    }
    super.onInit();
  }

  Future<void> onLogin() async {
    if (basicValidator.validateForm()) {
      update();
      var errors = await AuthService.loginUser(basicValidator.getData());
      if (errors != null) {
        basicValidator.addErrors(errors);
        basicValidator.validateForm();
        basicValidator.clearErrors();
      }
      Get.toNamed('/starter');
      update();
    }
  }

  void onChangeShowPassword() {
    showPassword = !showPassword;
    update();
  }

  void gotoLogin() {
    Get.toNamed('/auth/login');
  }
}
