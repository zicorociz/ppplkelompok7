import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:sikilap/helpers/services/json_decoder.dart';
import 'package:sikilap/model/identifier_model.dart';

class MitraModel extends IdentifierModel {
  final String image, ownerName, phoneNumber, email, mitraName, alamatName;

  MitraModel(super.id, this.ownerName, this.phoneNumber, this.email,
      this.mitraName, this.alamatName, this.image);

  static MitraModel fromJSON(Map<String, dynamic> json) {
    JSONDecoder decoder = JSONDecoder(json);

    String image = decoder.getString('image');
    String ownerName = decoder.getString('owner_name');
    String phoneNumber = decoder.getString('phone_number');
    String email = decoder.getString('email');
    String mitraName = decoder.getString('hotel_name');
    String cityName = decoder.getString('city_name');

    return MitraModel(decoder.getId, ownerName, phoneNumber, email, mitraName,
        cityName, image);
  }

  static List<MitraModel> listFromJSON(List<dynamic> list) {
    return list.map((e) => MitraModel.fromJSON(e)).toList();
  }

  static List<MitraModel>? _dummyList;

  static Future<List<MitraModel>> get dummyList async {
    if (_dummyList == null) {
      dynamic data = json.decode(await getData());
      _dummyList = listFromJSON(data);
    }
    return _dummyList!;
  }

  static Future<String> getData() async {
    return await rootBundle.loadString('assets/data/mitra_data.json');
  }
}
