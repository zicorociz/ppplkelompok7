// lib/views/client/room_detail_screen.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sikilap/controller/client/layanan_detail_controller.dart'; // <-- CONTROLLER CLIENT BARU
import 'package:sikilap/helpers/utils/my_shadow.dart';
import 'package:sikilap/helpers/utils/ui_mixins.dart';
import 'package:sikilap/helpers/widgets/my_breadcrumb.dart';
import 'package:sikilap/helpers/widgets/my_breadcrumb_item.dart';
import 'package:sikilap/helpers/widgets/my_card.dart';
import 'package:sikilap/helpers/widgets/my_flex.dart';
import 'package:sikilap/helpers/widgets/my_flex_item.dart';
import 'package:sikilap/helpers/widgets/my_spacing.dart';
import 'package:sikilap/helpers/widgets/my_text.dart';
import 'package:sikilap/helpers/widgets/responsive.dart';
import 'package:sikilap/views/layout/layout.dart';
import 'package:sikilap/helpers/widgets/my_button.dart';

class RoomDetailScreen extends StatefulWidget {
  const RoomDetailScreen({super.key});

  @override
  State<RoomDetailScreen> createState() => _RoomDetailScreenState();
}

class _RoomDetailScreenState extends State<RoomDetailScreen> with UIMixin {
  late final LayananDetailController controller;

  @override
  void initState() {
    super.initState();
    // Ambil data RoomModel yang dikirim dan buat controller
    controller = Get.put(LayananDetailController(Get.arguments));
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: GetBuilder<LayananDetailController>(
        init: controller,
        builder: (controller) {
          if (controller.layanan == null) {
            return Center(child: CircularProgressIndicator());
          }
          // Ambil data kamar dari controller untuk kemudahan akses
          final layanan = controller.layanan!;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: MySpacing.x(flexSpacing),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText.titleMedium(layanan.layananType,
                        fontSize: 18, fontWeight: 600), // Judul dinamis
                    MyBreadcrumb(
                      children: [
                        MyBreadcrumbItem(name: 'Home'),
                        MyBreadcrumbItem(name: 'Room Detail', active: true),
                      ],
                    ),
                  ],
                ),
              ),
              MySpacing.height(flexSpacing),
              Padding(
                padding: MySpacing.x(flexSpacing / 2),
                child: MyFlex(
                  children: [
                    MyFlexItem(
                        sizes: 'lg-4',
                        child: MyCard(
                            paddingAll: 0,
                            child: Image.asset(layanan.image,
                                height: 250, fit: BoxFit.cover))),
                    // Tampilkan gambar dummy atau gambar lain dari kamar jika ada
                    MyFlexItem(
                        sizes: 'lg-4',
                        child: MyCard(
                            paddingAll: 0,
                            child: Image.asset(
                                'assets/images/dummy/layanan/hotel_room_2.jpg',
                                height: 250,
                                fit: BoxFit.cover))),
                    MyFlexItem(
                        sizes: 'lg-4',
                        child: MyCard(
                            paddingAll: 0,
                            child: Image.asset(
                                'assets/images/dummy/layanan/hotel_room_3.jpg',
                                height: 250,
                                fit: BoxFit.cover))),

                    MyFlexItem(sizes: 'lg-8', child: masterSuiteRoom()),
                    MyFlexItem(sizes: 'lg-4', child: price()),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget masterSuiteRoom() {
    final layanan = controller.layanan!;
    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      paddingAll: 24,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText.titleMedium(layanan.layananType,
              fontWeight: 600), // Judul dinamis
          MySpacing.height(16),
          MyText.labelMedium("Bed Type: ${layanan.kategori}"),
          MySpacing.height(8),
          MyText.labelMedium("Capacity: ${layanan.capacity} Guests"),
          MySpacing.height(8),
          MyText.labelMedium("Floor: ${layanan.estimasiMenit}"),
          MySpacing.height(16),
          MyText.labelMedium("Amenities: ${layanan.amenities.join(', ')}"),
        ],
      ),
    );
  }

  Widget price() {
    final layanan = controller.layanan!;
    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      paddingAll: 24,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText.bodyMedium("Harga Mulai Dari", fontWeight: 600),
          MySpacing.height(12),
          Row(
            children: [
              MyText.titleLarge("\$${layanan.harga}",
                  fontWeight: 600, color: contentTheme.primary),
              MySpacing.width(4),
              MyText.bodyMedium("per night", color: contentTheme.primary),
            ],
          ),
          MySpacing.height(24),
          MyButton.rounded(
            onPressed: controller
                .goToLayananSelection, // <-- PANGGIL FUNGSI DARI CONTROLLER
            elevation: 0,
            padding: MySpacing.xy(20, 16),
            backgroundColor: contentTheme.primary,
            child: MyText.bodyMedium("Pilih Layanan",
                fontWeight: 600, color: contentTheme.onPrimary),
          )
        ],
      ),
    );
  }
}
