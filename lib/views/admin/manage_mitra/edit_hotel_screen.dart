import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:get/get.dart';
import 'package:sikilap/controller/admin/manage_mitra/edit_mitra_controller.dart';
import 'package:sikilap/helpers/utils/my_shadow.dart';
import 'package:sikilap/helpers/utils/ui_mixins.dart';
import 'package:sikilap/helpers/utils/utils.dart';
import 'package:sikilap/helpers/widgets/my_breadcrumb.dart';
import 'package:sikilap/helpers/widgets/my_breadcrumb_item.dart';
import 'package:sikilap/helpers/widgets/my_card.dart';
import 'package:sikilap/helpers/widgets/my_container.dart';
import 'package:sikilap/helpers/widgets/my_flex.dart';
import 'package:sikilap/helpers/widgets/my_flex_item.dart';
import 'package:sikilap/helpers/widgets/my_list_extension.dart';
import 'package:sikilap/helpers/widgets/my_spacing.dart';
import 'package:sikilap/helpers/widgets/my_text.dart';
import 'package:sikilap/helpers/widgets/my_text_style.dart';
import 'package:sikilap/helpers/widgets/responsive.dart';
import 'package:sikilap/views/layout/layout.dart';

class EditHotelScreen extends StatefulWidget {
  const EditHotelScreen({super.key});

  @override
  State<EditHotelScreen> createState() => _EditHotelScreenState();
}

class _EditHotelScreenState extends State<EditHotelScreen> with UIMixin {
  EditMitraController controller = Get.put(EditMitraController());

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: GetBuilder(
        init: controller,
        tag: 'add_hotel_controller',
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
                      "Hotel Edit",
                      fontSize: 18,
                      fontWeight: 600,
                    ),
                    MyBreadcrumb(
                      children: [
                        MyBreadcrumbItem(name: 'Admin'),
                        MyBreadcrumbItem(name: 'Hotel Edit', active: true),
                      ],
                    ),
                  ],
                ),
              ),
              MySpacing.height(flexSpacing),
              Padding(
                padding: MySpacing.x(flexSpacing),
                child: MyFlex(
                  contentPadding: false,
                  children: [
                    MyFlexItem(
                        child: MyCard(
                      shadow: MyShadow(
                          elevation: 0.2, position: MyShadowPosition.bottom),
                      paddingAll: 24,
                      child: addHotelDetail(),
                    )),
                    MyFlexItem(
                        child: MyCard(
                      shadow: MyShadow(
                          elevation: 0.2, position: MyShadowPosition.bottom),
                      paddingAll: 24,
                      child: roomDetail(),
                    )),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }

//as
  Widget addHotelDetail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonTextField("Hotel Name", "Hotel Name",
            controller: controller.MitraNameController),
        MySpacing.height(24),
        MyText.labelMedium('Hotel Category'),
        MySpacing.height(12),
        DropdownButtonFormField<MitraCategory>(
          dropdownColor: contentTheme.background,
          items: MitraCategory.values
              .map(
                (category) => DropdownMenuItem<MitraCategory>(
                    value: category,
                    child: MyText.labelMedium(category.name.capitalize!)),
              )
              .toList(),
          icon: Icon(LucideIcons.chevron_down, size: 20),
          style: MyTextStyle.bodySmall(),
          decoration: InputDecoration(
            hintText: "Select State",
            hintStyle: MyTextStyle.bodySmall(),
            border:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
            focusedErrorBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
            enabledBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
            errorBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
            focusedBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
            disabledBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
            contentPadding: MySpacing.all(12),
            isCollapsed: true,
            isDense: true,
          ),
          onChanged: controller.basicValidator.onChanged<Object?>('State'),
        ),
        MySpacing.height(24),
        commonTextField("Address", "Address",
            controller: controller.addressController),
        MySpacing.height(24),
        MyFlex(
          contentPadding: false,
          children: [
            MyFlexItem(
              sizes: 'md-6',
              child: commonTextField("Country", "Country",
                  controller: controller.countryController),
            ),
            MyFlexItem(
              sizes: 'md-6',
              child: commonTextField("State", "State",
                  controller: controller.stateController),
            ),
            MyFlexItem(
              sizes: 'md-6',
              child: commonTextField("City", "City",
                  controller: controller.cityController),
            ),
            MyFlexItem(
              sizes: 'md-6',
              child: commonTextField("Zip", "Zip",
                  numbered: true, controller: controller.zipController),
            ),
          ],
        ),
        MySpacing.height(24),
        commonTextField("Contact Number", "Contact Number",
            numbered: true, controller: controller.contactNumberController),
      ],
    );
  }

  Widget roomDetail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText.labelMedium('Hotel Category'),
        MySpacing.height(12),
        DropdownButtonFormField<LayananCategory>(
          dropdownColor: contentTheme.background,
          items: LayananCategory.values
              .map(
                (category) => DropdownMenuItem<LayananCategory>(
                    value: category,
                    child: MyText.labelMedium(category.name.capitalize!)),
              )
              .toList(),
          icon: Icon(LucideIcons.chevron_down, size: 20),
          style: MyTextStyle.bodySmall(),
          decoration: InputDecoration(
            hintText: "Select State",
            hintStyle: MyTextStyle.bodySmall(),
            border:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
            focusedErrorBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
            enabledBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
            errorBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
            focusedBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
            disabledBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
            contentPadding: MySpacing.all(12),
            isCollapsed: true,
            isDense: true,
          ),
          onChanged: controller.basicValidator.onChanged<Object?>('State'),
        ),
        MySpacing.height(24),
        commonTextField("Price", "Price",
            numbered: true, controller: controller.layananPriceController),
        MySpacing.height(24),
        MyText.labelMedium("Room Description"),
        MySpacing.height(12),
        MyCard(
          paddingAll: 0,
          child: Column(
            children: [
              QuillSimpleToolbar(
                controller: controller.quillController,
              ),
              Divider(),
              Padding(
                padding: MySpacing.all(24),
                child: QuillEditor.basic(
                  controller: controller.quillController,
                ),
              )
            ],
          ),
        ),
        MySpacing.height(24),
        MyText.labelMedium("Upload Room Image here"),
        MySpacing.height(12),
        uploadFile()
      ],
    );
  }

  Widget commonTextField(String title, String hintText,
      {bool numbered = false, TextEditingController? controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText.labelMedium(title),
        MySpacing.height(12),
        TextField(
          controller: controller,
          style: MyTextStyle.labelMedium(),
          inputFormatters: numbered
              ? <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                ]
              : null,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: MyTextStyle.labelMedium(xMuted: true),
            border:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
            focusedErrorBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
            enabledBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
            errorBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
            focusedBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
            disabledBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
            contentPadding: MySpacing.all(14),
            isCollapsed: true,
            isDense: true,
          ),
        )
      ],
    );
  }

  Widget uploadFile() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MyContainer.bordered(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          onTap: controller.pickFiles,
          paddingAll: 24,
          child: Center(
            heightFactor: 1.5,
            child: Padding(
              padding: MySpacing.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(LucideIcons.folder_up),
                  MySpacing.height(12),
                  MyContainer(
                    width: 340,
                    alignment: Alignment.center,
                    paddingAll: 0,
                    child: MyText.titleMedium(
                      "Drop files here or click to upload.",
                      fontWeight: 600,
                      muted: true,
                      fontSize: 18,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  MyContainer(
                    alignment: Alignment.center,
                    width: 610,
                    child: MyText.titleMedium(
                      "(This is just a demo dropzone. Selected files are not actually uploaded.)",
                      muted: true,
                      fontWeight: 500,
                      fontSize: 16,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        if (controller.files.isNotEmpty) ...[
          MySpacing.height(16),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            children: controller.files
                .mapIndexed((index, file) => MyContainer.bordered(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      paddingAll: 8,
                      child: SizedBox(
                        width: 100,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Stack(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              alignment: Alignment.topRight,
                              children: [
                                MyContainer(
                                  height: 100,
                                  width: 100,
                                  borderRadiusAll: 8,
                                  color:
                                      contentTheme.onBackground.withAlpha(28),
                                  paddingAll: 0,
                                  child: Icon(LucideIcons.file, size: 20),
                                ),
                                MyContainer.transparent(
                                    onTap: () => controller.removeFile(file),
                                    paddingAll: 4,
                                    child: Icon(LucideIcons.circle_x,
                                        color: contentTheme.danger)),
                              ],
                            ),
                            MySpacing.height(8),
                            MyText.bodyMedium(file.name, fontWeight: 600),
                            MySpacing.height(4),
                            MyText.bodySmall(
                                Utils.getStorageStringFromByte(
                                    file.bytes?.length ?? 0),
                                fontWeight: 600),
                          ],
                        ),
                      ),
                    ))
                .toList(),
          )
        ],
      ],
    );
  }
}

class QuillEditorConfigurations {}
