import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:get/get.dart';
import 'package:stay_place/controller/admin/guest/add_guest_controller.dart';
import 'package:stay_place/helpers/utils/my_shadow.dart';
import 'package:stay_place/helpers/utils/ui_mixins.dart';
import 'package:stay_place/helpers/widgets/my_breadcrumb.dart';
import 'package:stay_place/helpers/widgets/my_breadcrumb_item.dart';
import 'package:stay_place/helpers/widgets/my_card.dart';
import 'package:stay_place/helpers/widgets/my_container.dart';
import 'package:stay_place/helpers/widgets/my_spacing.dart';
import 'package:stay_place/helpers/widgets/my_text.dart';
import 'package:stay_place/helpers/widgets/my_text_style.dart';
import 'package:stay_place/helpers/widgets/responsive.dart';
import 'package:stay_place/views/layout/layout.dart';

class AddGuestScreen extends StatefulWidget {
  const AddGuestScreen({super.key});

  @override
  State<AddGuestScreen> createState() => _AddGuestScreenState();
}

class _AddGuestScreenState extends State<AddGuestScreen> with UIMixin {
  AddGuestController controller = Get.put(AddGuestController());

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: GetBuilder(
        init: controller,
        tag: 'add_guest_controller',
        builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: MySpacing.x(flexSpacing),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText.titleMedium(
                      "Add Guest",
                      fontSize: 18,
                      fontWeight: 600,
                    ),
                    MyBreadcrumb(
                      children: [
                        MyBreadcrumbItem(name: 'Admin'),
                        MyBreadcrumbItem(name: 'Add Guest', active: true),
                      ],
                    ),
                  ],
                ),
              ),
              MySpacing.height(flexSpacing),
              Padding(
                padding: MySpacing.x(flexSpacing),
                child: MyCard(
                  shadow: MyShadow(elevation: 0.2, position: MyShadowPosition.bottom),
                  paddingAll: 24,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      uploadProfileImage(),
                      MySpacing.height(24),
                      commonTextField("Name", "Name"),
                      MySpacing.height(24),
                      commonTextField("Email", "Email Address"),
                      MySpacing.height(24),
                      commonTextField("Contact Number", "Contact Number", numbered: true),
                      MySpacing.height(24),
                      commonTextField("Email", "Email Address"),
                      MySpacing.height(24),
                      commonTextField("Address", "Address"),
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }

  Widget commonTextField(String title, String hintText, {bool numbered = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText.labelMedium(title),
        MySpacing.height(12),
        TextField(
          style: MyTextStyle.labelMedium(),
          inputFormatters: numbered
              ? <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                ]
              : null,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: MyTextStyle.labelMedium(xMuted: true),
            border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
            focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
            errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
            disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
            contentPadding: MySpacing.all(14),
            isCollapsed: true,
            isDense: true,
          ),
        )
      ],
    );
  }

  Widget uploadProfileImage() {
    return MyContainer.bordered(
      height: 202,
      width: 202,
      paddingAll: 0,
      onTap: controller.pickImage,
      child: controller.fileName != null
          ? controller.fileBytes != null
              ? Image.memory(controller.fileBytes!, height: 200, width: 200, fit: BoxFit.cover)
              : controller.filePath != null
                  ? Image.file(File(controller.filePath!), fit: BoxFit.cover, height: 200, width: 200)
                  : SizedBox()
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(LucideIcons.image_up, size: 20),
                MySpacing.height(8),
                MyText.bodySmall("Upload Image", fontWeight: 600),
              ],
            ),
    );
  }
}
