import 'package:sikilap/controller/ui/forms/custom_option_controller.dart';
import 'package:sikilap/helpers/theme/app_themes.dart';
import 'package:sikilap/helpers/utils/my_shadow.dart';
import 'package:sikilap/helpers/utils/ui_mixins.dart';
import 'package:sikilap/helpers/widgets/my_breadcrumb.dart';
import 'package:sikilap/helpers/widgets/my_breadcrumb_item.dart';
import 'package:sikilap/helpers/widgets/my_card.dart';
import 'package:sikilap/helpers/widgets/my_container.dart';
import 'package:sikilap/helpers/widgets/my_flex.dart';
import 'package:sikilap/helpers/widgets/my_flex_item.dart';
import 'package:sikilap/helpers/widgets/my_spacing.dart';
import 'package:sikilap/helpers/widgets/my_text.dart';
import 'package:sikilap/helpers/widgets/responsive.dart';
import 'package:sikilap/images.dart';
import 'package:flutter/material.dart';
import 'package:sikilap/views/layout/layout.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_utils/src/extensions/string_extensions.dart';
import 'package:flutter_lucide/flutter_lucide.dart';

class CustomOptionScreen extends StatefulWidget {
  const CustomOptionScreen({super.key});

  @override
  State<CustomOptionScreen> createState() => _CustomOptionScreenState();
}

class _CustomOptionScreenState extends State<CustomOptionScreen> with SingleTickerProviderStateMixin, UIMixin {
  late CustomOptionController controller;

  @override
  void initState() {
    controller = CustomOptionController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: GetBuilder(
        init: controller,
        builder: (controller) {
          return Column(
            children: [
              Padding(
                padding: MySpacing.x(flexSpacing),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText.titleMedium("Custom Option", fontSize: 18, fontWeight: 600),
                    MyBreadcrumb(
                      children: [MyBreadcrumbItem(name: 'Form'), MyBreadcrumbItem(name: 'Custom Option', active: true)],
                    ),
                  ],
                ),
              ),
              MySpacing.height(flexSpacing),
              Padding(
                padding: MySpacing.x(flexSpacing / 2),
                child: MyFlex(
                  children: [
                    MyFlexItem(sizes: 'lg-6', child: _basicRadioButton()),
                    MyFlexItem(sizes: 'lg-6', child: _customBasicRadio()),
                    MyFlexItem(sizes: 'lg-6', child: _customOptionRadiosWithIcons()),
                    MyFlexItem(sizes: 'lg-6', child: _customOptionsRadioWithImages()),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _customOptionsRadioWithImages() {
    Widget imageData(String image, int id) {
      return Stack(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        alignment: Alignment.topRight,
        children: [
          MyContainer(
            onTap: () => controller.onChangeCustomImageRadioButton(id),
            height: 160,
            width: 200,
            paddingAll: 0,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Image.asset(image, fit: BoxFit.cover),
          ),
          Positioned(
            top: 12,
            right: 12,
            child: id == controller.customImageRadioButton
                ? MyContainer.rounded(
                    height: 24,
                    width: 24,
                    paddingAll: 0,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Icon(LucideIcons.check, size: 16),
                  )
                : SizedBox(),
          )
        ],
      );
    }

    return MyCard(
      shadow: MyShadow(elevation: 0.2, position: MyShadowPosition.bottom),
      paddingAll: 24,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText.titleMedium("Custom Options Radio With Images", fontWeight: 600),
          MySpacing.height(24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              imageData(Images.dummy[0], 0),
              MySpacing.width(24),
              imageData(Images.dummy[1], 1),
              MySpacing.width(24),
              imageData(Images.dummy[2], 2),
            ],
          ),
        ],
      ),
    );
  }

  Widget _customOptionRadiosWithIcons() {
    Widget customData(IconData icon, String name, des, int id) {
      return Expanded(
        child: MyContainer.bordered(
          onTap: () => controller.onChangeCustomButton(id),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          height: 160,
          borderColor: id == controller.customRadioButton ? contentTheme.primary : null,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(icon),
              MyText.bodyMedium(name, fontWeight: 600),
              MyText.bodySmall(des, maxLines: 3, textAlign: TextAlign.center, overflow: TextOverflow.visible),
              MyContainer.roundBordered(
                paddingAll: 4,
                borderColor: id == controller.customRadioButton ? contentTheme.primary : null,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: MyContainer.rounded(
                  paddingAll: 4,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  color: id == controller.customRadioButton ? contentTheme.primary : null,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return MyCard(
      shadow: MyShadow(elevation: 0.2, position: MyShadowPosition.bottom),
      paddingAll: 24,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText.titleMedium("Custom Option Radios With Icons", fontWeight: 600),
          MySpacing.height(24),
          Row(
            children: [
              customData(LucideIcons.accessibility, "Basic", controller.dummyTexts[3], 0),
              MySpacing.width(24),
              customData(LucideIcons.activity, "Premium", controller.dummyTexts[4], 1),
              MySpacing.width(24),
              customData(LucideIcons.alarm_clock, "Advance", controller.dummyTexts[8], 2),
            ],
          )
        ],
      ),
    );
  }

  Widget _basicRadioButton() {
    return MyCard(
      shadow: MyShadow(elevation: 0.2, position: MyShadowPosition.bottom),
      paddingAll: 24,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText.titleMedium("Radio Button", fontWeight: 600),
          MySpacing.height(24),
          Row(
            children: [
              MyText.labelLarge("Gender"),
              MySpacing.width(16),
              Expanded(
                child: Wrap(
                    spacing: 24,
                    runSpacing: 24,
                    children: Gender.values
                        .map(
                          (gender) => MyContainer.bordered(
                            onTap: () => controller.onChangeGender(gender),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Radio<Gender>(
                                  value: gender,
                                  activeColor: theme.colorScheme.primary,
                                  groupValue: controller.selectedGender,
                                  onChanged: controller.onChangeGender,
                                  visualDensity: getCompactDensity,
                                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                ),
                                MySpacing.width(8),
                                MyText.labelMedium(gender.name.capitalize!)
                              ],
                            ),
                          ),
                        )
                        .toList()),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _customBasicRadio() {
    Widget basicRadioButtonData(String title, IconData icon, int id) {
      return Expanded(
        child: MyContainer.bordered(
          splashColor: Colors.cyanAccent,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          onTap: () => controller.onSelectButton(id),
          borderColor: id == controller.selectRadioButton ? contentTheme.primary : null,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyContainer.roundBordered(
                paddingAll: 4,
                borderColor: id == controller.selectRadioButton ? contentTheme.primary : null,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: MyContainer.rounded(
                  paddingAll: 4,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  color: id == controller.selectRadioButton ? contentTheme.primary : null,
                ),
              ),
              MyText.bodyMedium(
                title,
                fontWeight: 600,
                color: id == controller.selectRadioButton ? contentTheme.primary : null,
              ),
              Icon(
                icon,
                color: id == controller.selectRadioButton ? contentTheme.primary : null,
              ),
            ],
          ),
        ),
      );
    }

    return MyCard(
      shadow: MyShadow(elevation: 0.2, position: MyShadowPosition.bottom),
      paddingAll: 24,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText.titleMedium(
            "Custom Basic Radio Button",
            fontWeight: 600,
          ),
          MySpacing.height(24),
          Row(
            children: [
              basicRadioButtonData("Basic", LucideIcons.air_vent, 0),
              MySpacing.width(12),
              basicRadioButtonData("Premium", LucideIcons.air_vent, 1),
              MySpacing.width(12),
              basicRadioButtonData("Advanced", LucideIcons.air_vent, 2),
            ],
          )
        ],
      ),
    );
  }
}
