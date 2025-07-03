import 'package:sikilap/controller/ui/dialogs_controller.dart';
import 'package:sikilap/helpers/utils/my_shadow.dart';
import 'package:sikilap/helpers/utils/ui_mixins.dart';
import 'package:sikilap/helpers/widgets/my_breadcrumb.dart';
import 'package:sikilap/helpers/widgets/my_breadcrumb_item.dart';
import 'package:sikilap/helpers/widgets/my_button.dart';
import 'package:sikilap/helpers/widgets/my_card.dart';
import 'package:sikilap/helpers/widgets/my_flex.dart';
import 'package:sikilap/helpers/widgets/my_flex_item.dart';
import 'package:sikilap/helpers/widgets/my_spacing.dart';
import 'package:sikilap/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:sikilap/helpers/widgets/responsive.dart';
import 'package:sikilap/views/layout/layout.dart';
import 'package:get/get.dart';
import 'package:flutter_lucide/flutter_lucide.dart';

class DialogsScreen extends StatefulWidget {
  const DialogsScreen({super.key});

  @override
  State<DialogsScreen> createState() => _DialogsScreenState();
}

class _DialogsScreenState extends State<DialogsScreen> with SingleTickerProviderStateMixin, UIMixin {
  late DialogsController controller;

  @override
  void initState() {
    controller = DialogsController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: GetBuilder(
        init: controller,
        tag: 'dialogs_controller',
        builder: (controller) {
          return Column(
            children: [
              Padding(
                padding: MySpacing.x(flexSpacing),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText.titleMedium(
                      "Dialogs",
                      fontSize: 18,
                      fontWeight: 600,
                    ),
                    MyBreadcrumb(
                      children: [
                        MyBreadcrumbItem(name: 'Widgets'),
                        MyBreadcrumbItem(name: 'Dialogs', active: true),
                      ],
                    ),
                  ],
                ),
              ),
              MySpacing.height(flexSpacing),
              Padding(
                  padding: MySpacing.x(flexSpacing / 2),
                  child: MyFlex(children: [
                    MyFlexItem(sizes: 'lg-3 md-6', child: alertBox()),
                    MyFlexItem(sizes: 'lg-3 md-6', child: standardBox()),
                    MyFlexItem(sizes: 'lg-3 md-6', child: fullWidget()),
                    MyFlexItem(sizes: 'lg-3 md-6', child: leftPosition()),
                    MyFlexItem(sizes: 'lg-3 md-6', child: rightPosition()),
                    MyFlexItem(sizes: 'lg-3 md-6', child: topPosition()),
                    MyFlexItem(sizes: 'lg-3 md-6', child: bottomPosition()),
                    MyFlexItem(sizes: 'lg-3 md-6', child: staticBox()),
                  ])),
            ],
          );
        },
      ),
    );
  }

  Widget alertBox() {
    return MyCard(
      shadow: MyShadow(elevation: 0.2, position: MyShadowPosition.bottom),
      height: 180,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      paddingAll: 24,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MyText.titleMedium("Alert Box", fontWeight: 600),
          MySpacing.height(12),
          MyText.bodySmall("Simple default Alert Example", fontWeight: 600),
          MySpacing.height(12),
          MyButton(
            onPressed: _showAlertDialog,
            elevation: 0,
            padding: MySpacing.xy(24, 20),
            backgroundColor: contentTheme.primary,
            child: MyText.bodySmall('Alert', fontWeight: 600, color: contentTheme.onPrimary),
          ),
        ],
      ),
    );
  }

  Widget standardBox() {
    return MyCard(
      shadow: MyShadow(elevation: 0.2, position: MyShadowPosition.bottom),
      height: 180,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      paddingAll: 24,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          MyText.titleMedium("Standard Box", fontWeight: 600),
          MyText.bodySmall("Alert with Header and Footer buttons", fontWeight: 600),
          MyButton(
            onPressed: _showStandardDialog,
            elevation: 0,
            padding: MySpacing.xy(24, 20),
            backgroundColor: contentTheme.success,
            child: MyText.bodySmall('Standard', fontWeight: 600, color: contentTheme.onSuccess),
          ),
        ],
      ),
    );
  }

  Widget fullWidget() {
    return MyCard(
      shadow: MyShadow(elevation: 0.2, position: MyShadowPosition.bottom),
      height: 180,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      paddingAll: 24,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          MyText.titleMedium("Full Widget", fontWeight: 600),
          MyText.bodySmall("Alert with full width covers most of the screen", fontWeight: 600),
          MyButton(
            onPressed: _showFullWidthDialog,
            elevation: 0,
            padding: MySpacing.xy(24, 20),
            backgroundColor: contentTheme.warning,
            child: MyText.bodySmall('Full Width', fontWeight: 600, color: contentTheme.onWarning),
          ),
        ],
      ),
    );
  }

  Widget leftPosition() {
    return MyCard(
      shadow: MyShadow(elevation: 0.2, position: MyShadowPosition.bottom),
      height: 180,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      paddingAll: 24,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          MyText.titleMedium("Left Position", fontWeight: 600),
          MyText.bodySmall("Left Positioned Alert", fontWeight: 600),
          MyButton(
            onPressed: _showLeftDialog,
            elevation: 0,
            padding: MySpacing.xy(24, 20),
            backgroundColor: contentTheme.primary,
            child: MyText.bodySmall('Left', fontWeight: 600, color: contentTheme.onPrimary),
          ),
        ],
      ),
    );
  }

  Widget rightPosition() {
    return MyCard(
      shadow: MyShadow(elevation: 0.2, position: MyShadowPosition.bottom),
      height: 180,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      paddingAll: 24,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          MyText.titleMedium("Right Position", fontWeight: 600),
          MyText.bodySmall("Right Positioned Alert", fontWeight: 600),
          MyButton(
            onPressed: _showRightDialog,
            elevation: 0,
            padding: MySpacing.xy(24, 20),
            backgroundColor: contentTheme.warning,
            child: MyText.bodySmall('Right', fontWeight: 600, color: contentTheme.onWarning),
          ),
        ],
      ),
    );
  }

  Widget topPosition() {
    return MyCard(
      shadow: MyShadow(elevation: 0.2, position: MyShadowPosition.bottom),
      height: 180,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      paddingAll: 24,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          MyText.titleMedium("Top Position", fontWeight: 600),
          MyText.bodySmall("Top Positioned Alert", fontWeight: 600),
          MyButton(
            onPressed: _showTopDialog,
            elevation: 0,
            padding: MySpacing.xy(24, 20),
            backgroundColor: contentTheme.success,
            child: MyText.bodySmall('Top', fontWeight: 600, color: contentTheme.onSuccess),
          ),
        ],
      ),
    );
  }

  Widget bottomPosition() {
    return MyCard(
      shadow: MyShadow(elevation: 0.2, position: MyShadowPosition.bottom),
      height: 180,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      paddingAll: 24,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          MyText.titleMedium("Bottom Position", fontWeight: 600),
          MyText.bodySmall("Bottom Positioned Alert", fontWeight: 600),
          MyButton(
            onPressed: _showBottomDialog,
            elevation: 0,
            padding: MySpacing.xy(24, 20),
            backgroundColor: contentTheme.info,
            child: MyText.bodySmall(
              'Bottom',
              fontWeight: 600,
              color: contentTheme.onInfo,
            ),
          ),
        ],
      ),
    );
  }

  Widget staticBox() {
    return MyCard(
      shadow: MyShadow(elevation: 0.2, position: MyShadowPosition.bottom),
      height: 180,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      paddingAll: 24,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          MyText.titleMedium("Static", fontWeight: 600),
          MyText.bodySmall("Static Positioned Alert which doesn't close when backdrop is tapped/clicked", fontWeight: 600, textAlign: TextAlign.center),
          MyButton(
            onPressed: _showStaticDialog,
            elevation: 0,
            padding: MySpacing.xy(24, 20),
            backgroundColor: contentTheme.primary,
            child: MyText.bodySmall('Static', fontWeight: 600, color: contentTheme.onPrimary),
          ),
        ],
      ),
    );
  }

  void _showAlertDialog() {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            actionsPadding: MySpacing.only(bottom: 16, right: 23),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            title: MyText.labelLarge("confirmation?"),
            content: MyText.bodySmall("Are you sure, you want to delete history?", fontWeight: 600),
            actions: [
              MyButton(
                onPressed: () => Get.back(),
                elevation: 0,
                padding: MySpacing.xy(20, 16),
                backgroundColor: colorScheme.secondaryContainer,
                child: MyText.labelMedium(
                  "Close",
                  fontWeight: 600,
                  color: colorScheme.onSecondaryContainer,
                ),
              ),
              MySpacing.width(12),
              MyButton(
                onPressed: () => Get.back(),
                elevation: 0,
                padding: MySpacing.xy(20, 16),
                backgroundColor: colorScheme.primary,
                child: MyText.labelMedium(
                  "Save",
                  fontWeight: 600,
                  color: colorScheme.onPrimary,
                ),
              ),
            ],
          );
        });
  }

  void _showStandardDialog() {
    showDialog(
        context: context,
        builder: (_) {
          return Dialog(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: SizedBox(
              width: 400,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: MySpacing.all(16),
                    child: MyText.labelLarge('Dialog Title', fontWeight: 600),
                  ),
                  Divider(height: 0, thickness: 1),
                  Padding(
                    padding: MySpacing.all(16),
                    child: MyText.bodySmall(controller.dummyTexts[0], fontWeight: 600),
                  ),
                  Divider(height: 0, thickness: 1),
                  Padding(
                    padding: MySpacing.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        MyButton(
                          onPressed: () => Get.back(),
                          elevation: 0,
                          padding: MySpacing.xy(20, 16),
                          backgroundColor: colorScheme.secondaryContainer,
                          child: MyText.labelMedium(
                            "Close",
                            fontWeight: 600,
                            color: colorScheme.onSecondaryContainer,
                          ),
                        ),
                        MySpacing.width(24),
                        MyButton(
                          onPressed: () => Get.back(),
                          elevation: 0,
                          padding: MySpacing.xy(20, 16),
                          backgroundColor: colorScheme.primary,
                          child: MyText.labelMedium(
                            "Save",
                            fontWeight: 600,
                            color: colorScheme.onPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  void _showFullWidthDialog() {
    showDialog(
        context: context,
        builder: (_) {
          return Dialog(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: MySpacing.all(16),
                  child: MyText.labelLarge('Dialog Title', fontWeight: 600),
                ),
                Divider(height: 0, thickness: 1),
                Padding(
                  padding: MySpacing.all(16),
                  child: MyText.bodySmall(controller.dummyTexts[1], fontWeight: 600),
                ),
                Divider(height: 0, thickness: 1),
                Padding(
                  padding: MySpacing.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      MyButton(
                        onPressed: () => Get.back(),
                        elevation: 0,
                        padding: MySpacing.xy(20, 16),
                        backgroundColor: colorScheme.secondaryContainer,
                        child: MyText.labelMedium(
                          "Close",
                          fontWeight: 600,
                          color: colorScheme.onSecondaryContainer,
                        ),
                      ),
                      MySpacing.width(24),
                      MyButton(
                        onPressed: () => Get.back(),
                        elevation: 0,
                        padding: MySpacing.xy(20, 16),
                        backgroundColor: colorScheme.primary,
                        child: MyText.labelMedium(
                          "Save",
                          fontWeight: 600,
                          color: colorScheme.onPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  void _showRightDialog() {
    showDialog(
        context: context,
        builder: (_) {
          return Dialog(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            insetPadding: MySpacing.fromLTRB(MediaQuery.of(context).size.width - 350, 0, 0, 0),
            child: SizedBox(
              width: 300,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: MySpacing.all(16),
                    child: MyText.labelLarge('Right Dialog', fontWeight: 600),
                  ),
                  Divider(height: 0, thickness: 1),
                  Padding(
                    padding: MySpacing.all(16),
                    child: MyText.bodySmall(
                      controller.dummyTexts[2],
                      fontWeight: 600,
                      maxLines: 6,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Divider(height: 0, thickness: 1),
                  Padding(
                    padding: MySpacing.only(right: 20, bottom: 12, top: 14),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        MyButton(
                          onPressed: () => Get.back(),
                          elevation: 0,
                          padding: MySpacing.xy(20, 16),
                          backgroundColor: colorScheme.secondaryContainer,
                          child: MyText.labelMedium(
                            "Close",
                            fontWeight: 600,
                            color: colorScheme.onSecondaryContainer,
                          ),
                        ),
                        MySpacing.width(24),
                        MyButton(
                          onPressed: () => Get.back(),
                          elevation: 0,
                          padding: MySpacing.xy(20, 16),
                          backgroundColor: colorScheme.primary,
                          child: MyText.labelMedium(
                            "Save",
                            fontWeight: 600,
                            color: colorScheme.onPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  void _showBottomDialog() {
    showDialog(
        context: context,
        builder: (_) {
          return Dialog(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            insetPadding: MySpacing.fromLTRB(0, MediaQuery.of(context).size.height - 350, 0, 0),
            child: SizedBox(
              width: 300,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: MySpacing.all(16),
                    child: MyText.labelLarge('Bottom Dialog', fontWeight: 600),
                  ),
                  Divider(height: 0, thickness: 1),
                  Padding(
                    padding: MySpacing.all(16),
                    child: MyText.bodySmall(
                      controller.dummyTexts[3],
                      maxLines: 6,
                      fontWeight: 600,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Divider(height: 0, thickness: 1),
                  Padding(
                    padding: MySpacing.only(right: 20, bottom: 12, top: 14),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        MyButton(
                          onPressed: () => Get.back(),
                          elevation: 0,
                          padding: MySpacing.xy(20, 16),
                          backgroundColor: colorScheme.secondaryContainer,
                          child: MyText.labelMedium(
                            "Close",
                            fontWeight: 600,
                            color: colorScheme.onSecondaryContainer,
                          ),
                        ),
                        MySpacing.width(24),
                        MyButton(
                          onPressed: () => Get.back(),
                          elevation: 0,
                          padding: MySpacing.xy(20, 16),
                          backgroundColor: colorScheme.primary,
                          child: MyText.labelMedium(
                            "Save",
                            fontWeight: 600,
                            color: colorScheme.onPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  void _showTopDialog() {
    showDialog(
        context: context,
        builder: (_) {
          return Dialog(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            insetPadding: MySpacing.fromLTRB(0, 0, 0, MediaQuery.of(context).size.height - 350),
            child: SizedBox(
              width: 300,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: MySpacing.all(16),
                    child: MyText.labelLarge('Top Dialog', fontWeight: 600),
                  ),
                  Divider(height: 0, thickness: 1),
                  Padding(
                    padding: MySpacing.all(16),
                    child: MyText.bodySmall(
                      controller.dummyTexts[4],
                      fontWeight: 600,
                      maxLines: 6,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Divider(height: 0, thickness: 1),
                  Padding(
                    padding: MySpacing.only(right: 20, bottom: 12, top: 14),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        MyButton(
                          onPressed: () => Get.back(),
                          elevation: 0,
                          padding: MySpacing.xy(20, 16),
                          backgroundColor: colorScheme.secondaryContainer,
                          child: MyText.labelMedium(
                            "Close",
                            fontWeight: 600,
                            color: colorScheme.onSecondaryContainer,
                          ),
                        ),
                        MySpacing.width(24),
                        MyButton(
                          onPressed: () => Get.back(),
                          elevation: 0,
                          padding: MySpacing.xy(20, 16),
                          backgroundColor: colorScheme.primary,
                          child: MyText.labelMedium(
                            "Save",
                            fontWeight: 600,
                            color: colorScheme.onPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  void _showLeftDialog() {
    showDialog(
        context: context,
        builder: (_) {
          return Dialog(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            insetPadding: MySpacing.fromLTRB(0, 0, MediaQuery.of(context).size.width - 350, 0),
            child: SizedBox(
              width: 300,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: MySpacing.all(16),
                    child: MyText.labelLarge('Left Dialog', fontWeight: 600),
                  ),
                  Divider(height: 0, thickness: 1),
                  Padding(
                    padding: MySpacing.all(16),
                    child: MyText.bodySmall(
                      controller.dummyTexts[5],
                      fontWeight: 600,
                      maxLines: 6,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Divider(height: 0, thickness: 1),
                  Padding(
                    padding: MySpacing.only(right: 20, bottom: 12, top: 14),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        MyButton(
                          onPressed: () => Get.back(),
                          elevation: 0,
                          padding: MySpacing.xy(20, 16),
                          backgroundColor: colorScheme.secondaryContainer,
                          child: MyText.labelMedium(
                            "Close",
                            fontWeight: 600,
                            color: colorScheme.onSecondaryContainer,
                          ),
                        ),
                        MySpacing.width(24),
                        MyButton(
                          onPressed: () => Get.back(),
                          elevation: 0,
                          padding: MySpacing.xy(20, 16),
                          backgroundColor: colorScheme.primary,
                          child: MyText.labelMedium(
                            "Save",
                            fontWeight: 600,
                            color: colorScheme.onPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  void _showStaticDialog() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) {
          return Dialog(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: SizedBox(
              width: 400,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: MySpacing.all(16),
                    child: Row(
                      children: [
                        Expanded(child: MyText.labelLarge('Static Dialog', fontWeight: 600)),
                        InkWell(
                            onTap: () => Navigator.pop(context),
                            child: Icon(
                              LucideIcons.x,
                              size: 20,
                              color: colorScheme.onSurface.withValues(alpha: 0.5),
                            ))
                      ],
                    ),
                  ),
                  Divider(height: 0, thickness: 1),
                  Padding(
                    padding: MySpacing.all(16),
                    child: MyText.bodySmall(controller.dummyTexts[0], fontWeight: 600),
                  ),
                  Divider(height: 0, thickness: 1),
                  Padding(
                    padding: MySpacing.only(right: 20, bottom: 12, top: 14),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        MyButton(
                          onPressed: () => Get.back(),
                          elevation: 0,
                          padding: MySpacing.xy(20, 16),
                          backgroundColor: colorScheme.secondaryContainer,
                          child: MyText.labelMedium(
                            "Close",
                            fontWeight: 600,
                            color: colorScheme.onSecondaryContainer,
                          ),
                        ),
                        MySpacing.width(24),
                        MyButton(
                          onPressed: () => Get.back(),
                          elevation: 0,
                          padding: MySpacing.xy(20, 16),
                          backgroundColor: colorScheme.primary,
                          child: MyText.labelMedium(
                            "Save",
                            fontWeight: 600,
                            color: colorScheme.onPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
