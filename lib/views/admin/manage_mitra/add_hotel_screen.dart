// lib/views/admin/manage_hotels/add_hotel_screen.dartss

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:get/get.dart';
import 'package:sikilap/controller/admin/manage_mitra/add_mitra_controller.dart';
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

class AddHotelScreen extends StatefulWidget {
  const AddHotelScreen({super.key});

  @override
  State<AddHotelScreen> createState() => _AddHotelScreenState();
}

class _AddHotelScreenState extends State<AddHotelScreen> with UIMixin {
  AddMitraController controller = Get.put(AddMitraController());

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
                      // --- UBAH ISI ---
                      "Tambah Mitra Baru",
                      fontSize: 18,
                      fontWeight: 600,
                    ),
                    MyBreadcrumb(
                      children: [
                        MyBreadcrumbItem(name: 'Admin'),
                        // --- UBAH ISI ---
                        MyBreadcrumbItem(name: 'Tambah Mitra', active: true),
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
                      // --- UBAH ISI ---
                      child: detailInformasiMitra(), // Nama fungsi diubah
                    )),
                    MyFlexItem(
                        child: MyCard(
                      shadow: MyShadow(
                          elevation: 0.2, position: MyShadowPosition.bottom),
                      paddingAll: 24,
                      // --- UBAH ISI ---
                      child: detailLayananMitra(), // Nama fungsi diubah
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

  // Widget untuk mengisi informasi dasar mitra
  Widget detailInformasiMitra() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // --- UBAH ISI ---
        commonTextField("Nama Usaha Mitra", "Contoh: Kilap Abadi Wash"),
        MySpacing.height(24),
        // --- UBAH ISI ---
        MyText.labelMedium('Status Kemitraan'),
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
            // --- UBAH ISI ---
            hintText: "Pilih Status",
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
        // --- UBAH ISI ---
        commonTextField("Alamat Utama Mitra", "Contoh: Jl. Mulyorejo No. 123"),
        MySpacing.height(24),
        MyFlex(
          contentPadding: false,
          children: [
            MyFlexItem(
              sizes: 'md-6',
              // --- UBAH ISI ---
              child: commonTextField("Area Layanan", "Contoh: Surabaya Timur"),
            ),
            MyFlexItem(
              sizes: 'md-6',
              // --- UBAH ISI ---
              child: commonTextField("Kota", "Contoh: Surabaya"),
            ),
            MyFlexItem(
              sizes: 'md-6',
              // --- UBAH ISI ---
              child: commonTextField("Provinsi", "Contoh: Jawa Timur"),
            ),
            MyFlexItem(
              sizes: 'md-6',
              // --- UBAH ISI ---
              child:
                  commonTextField("Kode Pos", "Contoh: 60111", numbered: true),
            ),
          ],
        ),
        MySpacing.height(24),
        // --- UBAH ISI ---
        commonTextField("Nomor Telepon", "Contoh: 081234567890",
            numbered: true),
      ],
    );
  }

  // Widget untuk menambah layanan yang ditawarkan mitra
  Widget detailLayananMitra() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // --- UBAH ISI ---
        MyText.labelMedium('Kategori Layanan'),
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
            // --- UBAH ISI ---
            hintText: "Pilih Kategori",
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
            contentPadding: MySpacing.all(14),
            isCollapsed: true,
            isDense: true,
          ),
          onChanged: controller.basicValidator.onChanged<Object?>('State'),
        ),
        MySpacing.height(24),
        // --- UBAH ISI ---
        commonTextField("Harga Layanan (Rp)", "Contoh: 50000", numbered: true),
        MySpacing.height(24),
        // --- UBAH ISI ---
        MyText.labelMedium("Deskripsi Layanan"),
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
        // --- UBAH ISI ---
        MyText.labelMedium("Unggah Foto Hasil Pengerjaan"),
        MySpacing.height(12),
        uploadFile()
      ],
    );
  }

  Widget commonTextField(String title, String hintText,
      {bool numbered = false}) {
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
                      // --- UBAH ISI ---
                      "Letakkan file di sini atau klik untuk mengunggah.",
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
                      // --- UBAH ISI ---
                      "(Ini hanya demo. File yang dipilih tidak akan diunggah.)",
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

class QuillSimpleToolbarConfigurations {}
