import 'dart:convert';

import 'food_model.dart';

AkciyaModel akciyaModelFromJson(String str) =>
    AkciyaModel.fromJson(json.decode(str));

String akciyaModelToJson(AkciyaModel data) =>
    json.encode(data.toJson());

class AkciyaModel {
  String? akciyaName;
  String? akciyaPrice;
  String? akciyaData;
  Foods? food;

  AkciyaModel(
    this.food, {
    this.akciyaName,
    this.akciyaPrice,
    this.akciyaData,
  });

  AkciyaModel.fromJson(dynamic json) {
    akciyaName = json['akciyaName'];
    akciyaPrice = json['akciyaPrice'];
    akciyaData = json['akciyaData'];

    food = Foods(name:json['food']!.name,image: json['food'].image,
       price: json['food'].price,type: json['food'].type,have: json['have'].type,
        about:json['food']
            .about);
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['akciyaName'] = akciyaName;
    map['akciyaPrice'] = akciyaPrice;
    map['akciyaData'] = akciyaData;
    map['food'] = food!.toJson();
    return map;
  }
}
