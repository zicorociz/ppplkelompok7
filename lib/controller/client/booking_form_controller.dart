import 'package:flutter/material.dart';
import 'package:stay_place/controller/my_controller.dart';

enum RoomType { Standard, Deluxe, Suite }

enum PaymentMethod {
  CreditCard,
  PayPal,
  ApplePay,
  GooglePay,
  BankTransfer,
}

class BookingFormController extends MyController {
  RoomType roomType = RoomType.Deluxe;
  PaymentMethod selectedPaymentMethod = PaymentMethod.CreditCard;

  DateTime? checkInDate;
  DateTime? checkOutDate;

  void onChangeGender(RoomType? value) {
    roomType = value ?? roomType;
    update();
  }

  void onChangePaymentMethod(PaymentMethod? value) {
    selectedPaymentMethod = value ?? selectedPaymentMethod;
    update();
  }

  Future<void> selectDate(BuildContext context, bool isStartDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: isStartDate ? DateTime.now() : (checkInDate ?? DateTime.now()),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != (isStartDate ? checkInDate : checkOutDate)) {
      if (isStartDate) {
        checkInDate = picked;
      } else {
        checkOutDate = picked;
      }
      update();
    }
    update();
  }
}
