// lib/model/room_model.dart

import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:sikilap/helpers/services/json_decoder.dart';
import 'package:sikilap/model/identifier_model.dart';

class LayananModel extends IdentifierModel {
  final int mitraId; // <-- TAMBAHKAN FIELD BARU
  final String layananType, kategori, image, jenisMobil;
  final double harga;
  final List amenities, guestService, inclusion;
  final bool availability, smoking;
  final int capacity, estimasiMenit;
  late bool isFavourite = false;

  LayananModel(
    super.id,
    this.mitraId, // <-- TAMBAHKAN DI CONSTRUCTOR
    this.layananType,
    this.kategori,
    this.harga,
    this.amenities,
    this.availability,
    this.image,
    this.guestService,
    this.inclusion,
    this.jenisMobil,
    this.smoking,
    this.capacity,
    this.estimasiMenit,
    this.isFavourite,
  );

  static LayananModel fromJSON(Map<String, dynamic> json) {
    JSONDecoder decoder = JSONDecoder(json);

    int hotelId = decoder.getInt('hotel_id'); // <-- AMBIL NILAI hotel_id
    String layananType = decoder.getString('room_type');
    String bedType = decoder.getString('bed_type');
    String image = decoder.getString('image');
    String view = decoder.getString('view');
    double pricePerNight = decoder.getDouble('price_per_night');
    List amenities = decoder.getObjectList('amenities');
    List guestService = decoder.getObjectList('guest_service');
    List inclusion = decoder.getObjectList('inclusion');
    bool availability = decoder.getBool('availability');
    bool smoking = decoder.getBool('smoking');
    int capacity = decoder.getInt('capacity');
    int jenisMobil = decoder.getInt('floor');
    bool isFavourite = decoder.getBool('isFavourite');

    return LayananModel(
        decoder.getId,
        hotelId, // <-- MASUKKAN KE CONSTRUCTOR
        layananType,
        bedType,
        pricePerNight,
        amenities,
        availability,
        image,
        guestService,
        inclusion,
        view,
        smoking,
        capacity,
        jenisMobil,
        isFavourite);
  }

  static List<LayananModel> listFromJSON(List<dynamic> list) {
    return list.map((e) => LayananModel.fromJSON(e)).toList();
  }

  static Future<List<LayananModel>> get dummyList async {
    dynamic data = json.decode(await getData());
    return listFromJSON(data);
  }

  static Future<String> getData() async {
    return await rootBundle.loadString('assets/data/room_data.json');
  }
}
