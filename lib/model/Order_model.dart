////import 'package:mobile_bro_food_admin_panel/model/Addres.dart';import 'package:mobile_bro_food_admin_panel/model/food_model.dart';List<OrderModel> listOrder(Map order) {  print(order.length);  List result = [];  order.forEach((key, value) {    result.add(value);    print('value');    print(value);  });  List<OrderModel> orders =      result.map((e) => OrderModel.fromJson(e)).toList();  print(orders.length);  print(orders.length);  print(orders.length);  print(orders.length);  return orders;}class OrderModel { late  String numberPhone; late String token; late bool isDelivered; late String comment; late  String typePay; late String deliveryTime; late List<Foods> foods; late List<Addres> addres;  OrderModel({      required this.numberPhone,      required this.token,    required   this.foods,    required  this.addres,    required    this.comment,    required   this.typePay,    required  this.deliveryTime,required this.isDelivered}); OrderModel.fromJson(dynamic json) {   numberPhone = json['numberPhone'] ?? 'Empty';   token = json['token'] ?? 'Empty';   comment = json['comment'] ?? 'Empty';   typePay = json['typePay'] ?? 'Empty';   deliveryTime = json['deliveryTime'] ?? 'Empty';   List<Foods> f = [];   List<Addres> a = [];   json['foods'].map((e) => f.add(Foods.fromJson(e)));   json['addres'].map((e) => a.add(Addres.fromJson(e)));   foods = f;   addres = a; } Map<String, dynamic> toJson() {    final map = <String, dynamic>{};    map['numberPhone'] = numberPhone;    map['token'] = token;    map['foods'] = foods;    map['isDelivered'] = isDelivered;    map['addres'] = addres;    map['comment'] = comment;    map['typePay'] = typePay;    map['deliveryTime'] = deliveryTime;    return map;  }}// class OrderModel {//   late String numberPhone;//   late String token;//   late String comment;//   late String typePay;//   late String deliveryTime;//   late List<Foods> foods;//   late List<Addres> addres;////   OrderModel({//     required this.numberPhone,//     required this.token,//     required this.foods,//     required this.addres,//     required this.comment,//     required this.typePay,//     required this.deliveryTime,//   });////   OrderModel.fromJson(dynamic json) {//     numberPhone = json['numberPhone'] ?? 'Empty';//     token = json['token'] ?? 'Empty';//     comment = json['comment'] ?? 'Empty';//     typePay = json['typePay'] ?? 'Empty';//     deliveryTime = json['deliveryTime'] ?? 'Empty';//     List<Foods> f = [];//     List<Addres> a = [];//     json['foods'].map((e) => f.add(Foods.fromJson(e)));//     json['addres'].map((e) => a.add(Addres.fromJson(e)));//     foods = f;//     addres = a;//   }////   Map<String, dynamic> toJson() {//     final map = <String, dynamic>{};//     map['numberPhone'] = numberPhone;//     map['token'] = token;//     map['foods'] = foods;//     map['addres'] = addres;//     map['comment'] = comment;//     map['typePay'] = typePay;//     map['deliveryTime'] = deliveryTime;//     return map;//   }// }