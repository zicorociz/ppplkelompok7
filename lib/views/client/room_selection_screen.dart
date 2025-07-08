// lib/views/client/room_selection_screen.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sikilap/controller/client/layanan_selection_controller.dart';
import 'package:sikilap/helpers/utils/my_shadow.dart';
import 'package:sikilap/helpers/utils/ui_mixins.dart';
import 'package:sikilap/helpers/widgets/my_breadcrumb.dart';
import 'package:sikilap/helpers/widgets/my_breadcrumb_item.dart';
import 'package:sikilap/helpers/widgets/my_button.dart'; // <-- IMPORT BARU
import 'package:sikilap/helpers/widgets/my_card.dart';
import 'package:sikilap/helpers/widgets/my_container.dart';
import 'package:sikilap/helpers/widgets/my_spacing.dart';
import 'package:sikilap/helpers/widgets/my_text.dart';
import 'package:sikilap/helpers/widgets/responsive.dart';
import 'package:sikilap/model/layanan_model.dart';
import 'package:sikilap/views/layout/layout.dart';

class RoomSelectionScreen extends StatefulWidget {
  const RoomSelectionScreen({super.key});

  @override
  State<RoomSelectionScreen> createState() => _RoomSelectionScreenState();
}

class _RoomSelectionScreenState extends State<RoomSelectionScreen>
    with UIMixin {
  // Ubah cara inisialisasi controller agar sesuai dengan alur yang benar
  late final LayananSelectionController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(LayananSelectionController(Get.arguments));
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: GetBuilder<LayananSelectionController>(
        init: controller,
        builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: MySpacing.x(flexSpacing),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText.titleMedium("Pilih Layanan",
                        fontSize: 18, fontWeight: 600),
                    MyBreadcrumb(
                      children: [
                        MyBreadcrumbItem(name: 'Mitra'),
                        MyBreadcrumbItem(name: 'Pilih Layanan', active: true),
                      ],
                    ),
                  ],
                ),
              ),
              MySpacing.height(flexSpacing),
              Padding(
                padding: MySpacing.x(flexSpacing),
                // Tampilkan loading atau pesan jika belum ada layanan
                child: controller.layanan.isEmpty
                    ? Center(
                        child: MyText.bodyLarge(
                            "Tidak ada layanan yang tersedia untuk mitra ini."))
                    : GridView.builder(
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 400,
                          crossAxisSpacing: 24,
                          mainAxisSpacing: 24,
                          mainAxisExtent: 450,
                        ),
                        itemCount: controller.layanan.length,
                        itemBuilder: (context, index) {
                          LayananModel layanan = controller.layanan[index];
                          return MyCard(
                            shadow: MyShadow(
                                elevation: 0.2,
                                position: MyShadowPosition.bottom),
                            paddingAll: 24,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    MyContainer(
                                      paddingAll: 0,
                                      height: 200,
                                      width: double.infinity,
                                      child: Image.asset(layanan.image,
                                          fit: BoxFit.cover),
                                    ),
                                    Positioned(
                                      right: 12,
                                      top: 12,
                                      child: MyContainer.rounded(
                                        onTap: () => controller
                                            .onFavouriteToggle(layanan),
                                        paddingAll: 12,
                                        child: Icon(
                                            layanan.isFavourite
                                                ? Icons.favorite_rounded
                                                : Icons
                                                    .favorite_outline_rounded,
                                            size: 16,
                                            color: layanan.isFavourite
                                                ? contentTheme.danger
                                                : null,
                                            fill: 0),
                                      ),
                                    )
                                  ],
                                ),
                                // ... (Kode Stack untuk gambar tetap sama)
                                MySpacing.height(24),
                                Expanded(
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            MyText.bodyMedium(
                                                layanan.layananType,
                                                fontWeight: 600,
                                                maxLines: 1,
                                                overflow:
                                                    TextOverflow.ellipsis),
                                            MyText.labelMedium(
                                                "Kategori: ${layanan.kategori}"),
                                            MyText.labelMedium(
                                                "Jenis Mobil: ${layanan.jenisMobil}"),
                                            MyText.labelMedium(
                                                "Estimasi: ${layanan.estimasiMenit} menit"),
                                            MyText.labelMedium(
                                                "Mulai dari: Rp ${layanan.harga.toInt()}"),
                                          ],
                                        ),
                                      ),
                                      // ========== UBAH MyContainer MENJADI MyButton ==========
                                      MyButton(
                                        onPressed: () =>
                                            controller.goToBookingForm(layanan),
                                        padding: MySpacing.xy(8, 4),
                                        backgroundColor: contentTheme.primary,
                                        elevation: 0,
                                        child: MyText.labelSmall("Pesan",
                                            fontWeight: 600,
                                            color: contentTheme.onPrimary),
                                      ),
                                      // =======================================================
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
              ),
            ],
          );
        },
      ),
    );
  }
}
