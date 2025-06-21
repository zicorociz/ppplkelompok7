import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:get/get.dart';
import 'package:stay_place/controller/client/booking_form_controller.dart';
import 'package:stay_place/helpers/extention/string.dart';
import 'package:stay_place/helpers/theme/app_themes.dart';
import 'package:stay_place/helpers/utils/my_shadow.dart';
import 'package:stay_place/helpers/utils/ui_mixins.dart';
import 'package:stay_place/helpers/utils/utils.dart';
import 'package:stay_place/helpers/widgets/my_breadcrumb.dart';
import 'package:stay_place/helpers/widgets/my_breadcrumb_item.dart';
import 'package:stay_place/helpers/widgets/my_button.dart';
import 'package:stay_place/helpers/widgets/my_card.dart';
import 'package:stay_place/helpers/widgets/my_flex.dart';
import 'package:stay_place/helpers/widgets/my_flex_item.dart';
import 'package:stay_place/helpers/widgets/my_spacing.dart';
import 'package:stay_place/helpers/widgets/my_text.dart';
import 'package:stay_place/helpers/widgets/my_text_style.dart';
import 'package:stay_place/helpers/widgets/responsive.dart';
import 'package:stay_place/views/layout/layout.dart';

class BookingFormScreen extends StatefulWidget {
  const BookingFormScreen({super.key});

  @override
  State<BookingFormScreen> createState() => _BookingFormScreenState();
}

class _BookingFormScreenState extends State<BookingFormScreen> with UIMixin {
  BookingFormController controller = Get.put(BookingFormController());

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: GetBuilder(
        init: controller,
        tag: 'booking_form_controller',
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
                      "Booking Form",
                      fontSize: 18,
                      fontWeight: 600,
                    ),
                    MyBreadcrumb(
                      children: [
                        MyBreadcrumbItem(name: 'Booking Form', active: true),
                      ],
                    ),
                  ],
                ),
              ),
              MySpacing.height(flexSpacing),
              Padding(
                padding: MySpacing.x(flexSpacing / 2),
                child: MyFlex(children: [
                  MyFlexItem(sizes: 'lg-6 md-6', child: guestDetails()),
                  MyFlexItem(sizes: 'lg-6 md-6', child: bookingDetails()),
                ]),
              )
            ],
          );
        },
      ),
    );
  }

  Widget commonTextField(String hintText, IconData? prefixIcon) {
    return TextFormField(
      style: MyTextStyle.labelMedium(),
      decoration: InputDecoration(
        border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
        focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
        errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
        disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
        hintText: hintText,
        prefixIcon: Icon(prefixIcon, size: 14),
        prefixIconConstraints: BoxConstraints(maxHeight: 32, minHeight: 32, maxWidth: 32, minWidth: 32),
        hintStyle: MyTextStyle.labelMedium(muted: true),
        contentPadding: MySpacing.all(14),
        isCollapsed: true,
        isDense: true,
      ),
    );
  }

  Widget guestDetails() {
    return MyCard(
      shadow: MyShadow(elevation: 0.2, position: MyShadowPosition.bottom),
      paddingAll: 24,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText.bodyMedium("Guest Detail", fontWeight: 600),
          MySpacing.height(24),
          commonTextField("First Name", LucideIcons.user),
          MySpacing.height(24),
          commonTextField("Last Name", LucideIcons.user),
          MySpacing.height(24),
          commonTextField("Email", LucideIcons.mail),
          MySpacing.height(24),
          commonTextField("Phone Number", LucideIcons.phone),
          MySpacing.height(24),
          commonTextField("Address", LucideIcons.map_pin),
        ],
      ),
    );
  }

  Widget bookingDetails() {
    return MyCard(
      shadow: MyShadow(elevation: 0.2, position: MyShadowPosition.bottom),
      paddingAll: 24,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText.bodyMedium("Bookings Detail", fontWeight: 600),
          MySpacing.height(24),
          commonTextField("Hotel Name", LucideIcons.user),
          MySpacing.height(24),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText.labelMedium("Room Type :"),
              MySpacing.width(4),
              Expanded(
                child: Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    children: RoomType.values
                        .map((gender) => InkWell(
                            onTap: () => controller.onChangeGender(gender),
                            child: Row(mainAxisSize: MainAxisSize.min, children: [
                              Radio<RoomType>(
                                  value: gender,
                                  activeColor: theme.colorScheme.primary,
                                  groupValue: controller.roomType,
                                  onChanged: controller.onChangeGender,
                                  visualDensity: getCompactDensity,
                                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap),
                              MySpacing.width(8),
                              MyText.labelMedium(gender.name.capitalizeWords),
                            ])))
                        .toList()),
              ),
            ],
          ),
          MySpacing.height(24),
          GestureDetector(
            onTap: () => controller.selectDate(context, true),
            child: AbsorbPointer(
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: controller.checkInDate == null ? 'Check in date' : '${Utils.getDateStringFromDateTime(controller.checkInDate!)}',
                  hintStyle: MyTextStyle.labelMedium(muted: true),
                  contentPadding: MySpacing.all(14),
                  isDense: true,
                  isCollapsed: true,
                  prefixIcon: Icon(LucideIcons.clock_3, size: 14),
                  prefixIconConstraints: BoxConstraints(maxHeight: 32, minHeight: 32, maxWidth: 32, minWidth: 32),
                  border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                  focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                  errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                  disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                ),
              ),
            ),
          ),
          MySpacing.height(24),
          GestureDetector(
            onTap: () => controller.selectDate(context, false),
            child: AbsorbPointer(
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: controller.checkOutDate == null ? 'Check out date' : '${Utils.getDateStringFromDateTime(controller.checkOutDate!)}',
                  hintStyle: MyTextStyle.labelMedium(muted: true),
                  contentPadding: MySpacing.all(14),
                  isDense: true,
                  isCollapsed: true,
                  prefixIcon: Icon(LucideIcons.clock_3, size: 14),
                  prefixIconConstraints: BoxConstraints(maxHeight: 32, minHeight: 32, maxWidth: 32, minWidth: 32),
                  border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                  focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                  errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                  disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                ),
              ),
            ),
          ),
          MySpacing.height(24),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText.labelMedium("Payments :"),
              MySpacing.width(4),
              Expanded(
                child: Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  children: PaymentMethod.values.map((paymentMethod) {
                    return InkWell(
                        onTap: () => controller.onChangePaymentMethod(paymentMethod),
                        child: Row(mainAxisSize: MainAxisSize.min, children: [
                          Radio<PaymentMethod>(
                              value: paymentMethod,
                              activeColor: theme.colorScheme.primary,
                              groupValue: controller.selectedPaymentMethod,
                              onChanged: controller.onChangePaymentMethod,
                              visualDensity: getCompactDensity,
                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap),
                          MySpacing.width(8),
                          MyText.labelMedium(paymentMethod.name.capitalizeWords),
                        ]));
                  }).toList(),
                ),
              ),
            ],
          ),
          MySpacing.height(24),
          commonTextField("Promo Code", LucideIcons.user),
          MySpacing.height(24),
          MyButton.block(
              onPressed: () {},
              elevation: 0,
              padding: MySpacing.all(16),
              backgroundColor: contentTheme.primary,
              child: MyText.labelMedium(
                "Book Now",
                color: contentTheme.onPrimary,
                fontWeight: 600,
              )),
        ],
      ),
    );
  }
}
