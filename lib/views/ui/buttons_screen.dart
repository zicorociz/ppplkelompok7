import 'package:flutter/material.dart';
import 'package:sikilap/controller/ui/buttons_controller.dart';
import 'package:sikilap/helpers/utils/my_shadow.dart';
import 'package:sikilap/helpers/utils/ui_mixins.dart';
import 'package:sikilap/helpers/widgets/my_breadcrumb.dart';
import 'package:sikilap/helpers/widgets/my_breadcrumb_item.dart';
import 'package:sikilap/helpers/widgets/my_button.dart';
import 'package:sikilap/helpers/widgets/my_card.dart';
import 'package:sikilap/helpers/widgets/my_container.dart';
import 'package:sikilap/helpers/widgets/my_flex.dart';
import 'package:sikilap/helpers/widgets/my_flex_item.dart';
import 'package:sikilap/helpers/widgets/my_spacing.dart';
import 'package:sikilap/helpers/widgets/my_text.dart';
import 'package:sikilap/helpers/widgets/responsive.dart';
import 'package:sikilap/views/layout/layout.dart';
import 'package:get/get.dart';

class ButtonsScreen extends StatefulWidget {
  const ButtonsScreen({super.key});

  @override
  State<ButtonsScreen> createState() => _ButtonsScreenState();
}

class _ButtonsScreenState extends State<ButtonsScreen> with SingleTickerProviderStateMixin, UIMixin {
  late ButtonsController controller;

  @override
  void initState() {
    controller = ButtonsController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: GetBuilder(
        init: controller,
        tag: 'buttons_controller',
        builder: (controller) {
          return Column(
            children: [
              Padding(
                padding: MySpacing.x(flexSpacing),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText.titleMedium("buttons", fontSize: 18, fontWeight: 600),
                    MyBreadcrumb(
                      children: [MyBreadcrumbItem(name: 'Widgets'), MyBreadcrumbItem(name: 'buttons', active: true)],
                    ),
                  ],
                ),
              ),
              MySpacing.height(flexSpacing),
              Padding(
                padding: MySpacing.x(flexSpacing / 2),
                child: MyFlex(
                  wrapAlignment: WrapAlignment.start,
                  wrapCrossAlignment: WrapCrossAlignment.start,
                  children: [
                    commonComponent(title: 'Elevation Button', buttonsList: [
                      elevatedBtn("Primary", contentTheme.primary),
                      elevatedBtn("Secondary", contentTheme.secondary),
                      elevatedBtn("Success", contentTheme.success),
                      elevatedBtn("Warning", contentTheme.warning),
                      elevatedBtn("Info", contentTheme.info),
                      elevatedBtn("Danger", contentTheme.danger),
                    ]),
                    commonComponent(title: "Elevated Rounded Button", buttonsList: [
                      elevatedRoundedBtn("Primary", contentTheme.primary),
                      elevatedRoundedBtn("Secondary", contentTheme.secondary),
                      elevatedRoundedBtn("Success", contentTheme.success),
                      elevatedRoundedBtn("Warning", contentTheme.warning),
                      elevatedRoundedBtn("Info", contentTheme.info),
                      elevatedRoundedBtn("Danger", contentTheme.danger),
                    ]),
                    commonComponent(title: 'Flat Button', buttonsList: [
                      buildFlatButton("Primary", contentTheme.primary),
                      buildFlatButton("Secondary", contentTheme.secondary),
                      buildFlatButton("Success", contentTheme.success),
                      buildFlatButton("Warning", contentTheme.warning),
                      buildFlatButton("Info", contentTheme.info),
                      buildFlatButton("Danger", contentTheme.danger),
                    ]),
                    commonComponent(title: "Rounded Button", buttonsList: [
                      roundedBtn("Primary", contentTheme.primary),
                      roundedBtn("Secondary", contentTheme.secondary),
                      roundedBtn("Success", contentTheme.success),
                      roundedBtn("Warning", contentTheme.warning),
                      roundedBtn("Info", contentTheme.info),
                      roundedBtn("Danger", contentTheme.danger),
                    ]),
                    commonComponent(title: 'Outline Button', buttonsList: [
                      outLinedBtn("Primary", contentTheme.primary),
                      outLinedBtn("Secondary", contentTheme.secondary),
                      outLinedBtn("Success", contentTheme.success),
                      outLinedBtn("Warning", contentTheme.warning),
                      outLinedBtn("Info", contentTheme.info),
                      outLinedBtn("Danger", contentTheme.danger),
                    ]),
                    commonComponent(title: 'Outline Rounded Button', buttonsList: [
                      outlinedRoundedBtn('Primary', contentTheme.primary),
                      outlinedRoundedBtn('Secondary', contentTheme.secondary),
                      outlinedRoundedBtn('Success', contentTheme.success),
                      outlinedRoundedBtn('Warning', contentTheme.warning),
                      outlinedRoundedBtn('Info', contentTheme.info),
                      outlinedRoundedBtn('Danger', contentTheme.danger),
                    ]),
                    commonComponent(title: 'Soft Button', buttonsList: [
                      softBtn("Primary", contentTheme.primary),
                      softBtn("Secondary", contentTheme.secondary),
                      softBtn("Success", contentTheme.success),
                      softBtn("Warning", contentTheme.warning),
                      softBtn("Info", contentTheme.info),
                      softBtn("Danger", contentTheme.danger),
                    ]),
                    commonComponent(title: 'Soft Rounded Button', buttonsList: [
                      softRoundedBtn("Primary", contentTheme.primary),
                      softRoundedBtn("Secondary", contentTheme.secondary),
                      softRoundedBtn("Success", contentTheme.success),
                      softRoundedBtn("Warning", contentTheme.warning),
                      softRoundedBtn("Info", contentTheme.info),
                      softRoundedBtn("Danger", contentTheme.danger),
                    ]),
                    commonComponent(title: 'Text Button', buttonsList: [
                      textBtn("Primary", contentTheme.primary),
                      textBtn("Secondary", contentTheme.secondary),
                      textBtn("Success", contentTheme.success),
                      textBtn("Warning", contentTheme.warning),
                      textBtn("Info", contentTheme.info),
                      textBtn("Danger", contentTheme.danger),
                    ]),
                    commonComponent(title: 'Text Rounded Button', buttonsList: [
                      textRoundedBtn("Primary", contentTheme.primary),
                      textRoundedBtn("Secondary", contentTheme.secondary),
                      textRoundedBtn("Success", contentTheme.success),
                      textRoundedBtn("Warning", contentTheme.warning),
                      textRoundedBtn("Info", contentTheme.info),
                      textRoundedBtn("Danger", contentTheme.danger),
                    ]),
                    commonComponent(title: 'Sized Button', buttonsList: [
                      MyButton(
                        onPressed: () {},
                        elevation: 0,
                        backgroundColor: contentTheme.primary,
                        child: MyText.labelSmall('Small', color: contentTheme.onPrimary, fontWeight: 600),
                      ),
                      MyButton(
                        onPressed: () {},
                        elevation: 0,
                        padding: MySpacing.xy(20, 16),
                        backgroundColor: contentTheme.primary,
                        child: MyText.bodySmall('Medium', color: contentTheme.onPrimary, fontWeight: 600),
                      ),
                      MyButton(
                        onPressed: () {},
                        elevation: 0,
                        padding: MySpacing.xy(40, 24),
                        backgroundColor: contentTheme.primary,
                        child: MyText.bodySmall('Large', color: contentTheme.onPrimary, fontWeight: 600),
                      ),
                    ]),
                    MyFlexItem(
                      sizes: "lg-6 md-12",
                      child: MyContainer(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        paddingAll: 0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: MySpacing.only(left: 23, top: 20),
                              child: MyText.titleMedium('Button Group', fontWeight: 600),
                            ),
                            Divider(height: 44),
                            Padding(
                              padding: MySpacing.only(left: 23, bottom: 20),
                              child: ToggleButtons(
                                splashColor: contentTheme.primary.withAlpha(48),
                                color: contentTheme.onBackground,
                                fillColor: contentTheme.primary.withAlpha(32),
                                selectedBorderColor: contentTheme.primary.withAlpha(48),
                                isSelected: controller.selected,
                                onPressed: controller.onSelect,
                                children: <Widget>[
                                  Icon(Icons.wb_sunny_outlined, color: contentTheme.primary, size: 24),
                                  Icon(Icons.dark_mode_outlined, color: contentTheme.primary, size: 24),
                                  Icon(Icons.brightness_6_outlined, color: contentTheme.primary, size: 24),
                                ],
                              ),
                            ),
                            Padding(
                              padding: MySpacing.only(left: 23, bottom: 20),
                              child: ToggleButtons(
                                splashColor: contentTheme.primary.withAlpha(48),
                                color: contentTheme.onBackground,
                                fillColor: contentTheme.primary.withAlpha(32),
                                selectedBorderColor: contentTheme.primary.withAlpha(48),
                                isSelected: controller.selected,
                                onPressed: controller.onSelect,
                                children: <Widget>[
                                  Padding(
                                    padding: MySpacing.x(16),
                                    child: Row(
                                      children: [
                                        Icon(Icons.wb_sunny_outlined, color: contentTheme.primary, size: 24),
                                        MySpacing.width(12),
                                        MyText.labelLarge('light', color: contentTheme.primary, fontWeight: 600)
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: MySpacing.x(16),
                                    child: Row(
                                      children: [
                                        Icon(Icons.dark_mode_outlined, color: contentTheme.primary, size: 24),
                                        MySpacing.width(12),
                                        MyText.labelLarge('dark', color: contentTheme.primary, fontWeight: 600)
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: MySpacing.x(16),
                                    child: Row(
                                      children: [
                                        Icon(Icons.brightness_6_outlined, color: contentTheme.primary, size: 24),
                                        MySpacing.width(12),
                                        MyText.labelLarge('system', color: contentTheme.primary, fontWeight: 600)
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  MyFlexItem commonComponent({String? title, List<Widget> buttonsList = const []}) {
    return MyFlexItem(
      sizes: "lg-6 md-12",
      child: MyCard(
        shadow: MyShadow(elevation: 0.2, position: MyShadowPosition.bottom),
        paddingAll: 0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: MySpacing.only(left: 23, top: 20),
              child: MyText.titleMedium(title ?? '', fontWeight: 600),
            ),
            Divider(height: 32),
            Padding(
              padding: MySpacing.only(left: 23, bottom: 20),
              child: Wrap(
                spacing: 24,
                runSpacing: 24,
                children: buttonsList,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget elevatedBtn(String btnName, Color color) {
    return MyButton(
      onPressed: () {},
      elevation: 2,
      padding: MySpacing.xy(20, 16),
      backgroundColor: color,
      child: MyText.bodySmall(btnName, color: contentTheme.onPrimary, fontWeight: 600),
    );
  }

  Widget elevatedRoundedBtn(String btnName, Color color) {
    return MyButton(
      onPressed: () {},
      elevation: 2,
      padding: MySpacing.xy(20, 16),
      backgroundColor: color,
      borderRadiusAll: 20,
      child: MyText.bodySmall(btnName, color: contentTheme.onPrimary, fontWeight: 600),
    );
  }

  Widget buildFlatButton(String btnName, Color color) {
    return MyButton(
      onPressed: () {},
      elevation: 0,
      padding: MySpacing.xy(20, 16),
      backgroundColor: color,
      child: MyText.bodySmall(btnName, color: contentTheme.onPrimary, fontWeight: 600),
    );
  }

  Widget roundedBtn(String btnName, Color color) {
    return MyButton(
      onPressed: () {},
      elevation: 0,
      padding: MySpacing.xy(20, 16),
      backgroundColor: color,
      borderRadiusAll: 20,
      child: MyText.bodySmall(btnName, color: contentTheme.onPrimary, fontWeight: 600),
    );
  }

  Widget outLinedBtn(String btnName, Color color) {
    return MyButton.outlined(
      onPressed: () {},
      elevation: 0,
      padding: MySpacing.xy(20, 16),
      borderColor: color,
      splashColor: color.withValues(alpha: 0.1),
      child: MyText.bodySmall(btnName, color: color, fontWeight: 600),
    );
  }

  Widget outlinedRoundedBtn(String btnName, Color color) {
    return MyButton.outlined(
      onPressed: () {},
      elevation: 0,
      padding: MySpacing.xy(20, 16),
      borderColor: color,
      splashColor: color.withValues(alpha: 0.1),
      borderRadiusAll: 20,
      child: MyText.bodySmall(btnName, color: color, fontWeight: 600),
    );
  }

  Widget softBtn(String btnName, Color color) {
    return MyButton(
      onPressed: () {},
      elevation: 0,
      padding: MySpacing.xy(20, 16),
      borderColor: color,
      backgroundColor: color.withValues(alpha: 0.12),
      splashColor: color.withValues(alpha: 0.2),
      child: MyText.bodySmall(btnName, color: color, fontWeight: 600),
    );
  }

  Widget softRoundedBtn(String btnName, Color color) {
    return MyButton(
      onPressed: () {},
      elevation: 0,
      padding: MySpacing.xy(20, 16),
      borderColor: color,
      backgroundColor: color.withValues(alpha: 0.12),
      splashColor: color.withValues(alpha: 0.2),
      borderRadiusAll: 20,
      child: MyText.bodySmall(btnName, color: color, fontWeight: 600),
    );
  }

  Widget textBtn(String btnName, Color color) {
    return MyButton.text(
      onPressed: () {},
      padding: MySpacing.xy(20, 16),
      splashColor: color.withValues(alpha: 0.1),
      child: MyText.bodySmall(btnName, color: color, fontWeight: 600),
    );
  }

  Widget textRoundedBtn(String btnName, Color color) {
    return MyButton.text(
      onPressed: () {},
      elevation: 0,
      padding: MySpacing.xy(20, 16),
      splashColor: color.withValues(alpha: 0.1),
      borderRadiusAll: 20,
      child: MyText.bodySmall(btnName, color: color, fontWeight: 600),
    );
  }
}
