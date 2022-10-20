import 'package:firebase_messaging/firebase_messaging.dart';import 'package:flutter/foundation.dart';import 'package:flutter/material.dart';import 'package:mobile_bro_food_admin_panel/configs/text_configs.dart';import 'package:mobile_bro_food_admin_panel/model/Order_model.dart';import 'package:mobile_bro_food_admin_panel/model/food_model.dart';import 'package:mobile_bro_food_admin_panel/pages/history/controller/history_provider.dart';import 'package:mobile_bro_food_admin_panel/service/notification_data_source.dart';import 'package:provider/provider.dart';class HistoryPage extends StatelessWidget {   HistoryPage({Key? key}) : super(key: key);   @override  Widget build(BuildContext context) {    return StreamProvider<List<OrderModel>>(        initialData:const [],        create: (context) => HistoryProvider().order,        catchError: (context,error)=>  [],        child:  _HistoryPage());  }}class _HistoryPage extends StatelessWidget {   _HistoryPage({Key? key}) : super(key: key);  NotificationDataSource? notificationData;  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;  @override  Widget build(BuildContext context) {    return Consumer<List<OrderModel>>(        builder: (context,provider,__){          if(provider.isEmpty){            return const Center(child: Text(empty),);          }          return ListView.builder(              itemCount: provider.length,              itemBuilder: (context, i) {                OrderModel order = provider[i];                List <Foods> foods = provider[i].foods;                return Card(                    child: ExpansionTile(                      title: Row(                        mainAxisAlignment: MainAxisAlignment.spaceAround,                        children: [                          Text("#${order.orderId}"),                          Icon(                              order.ready                                  ? Icons.check_circle_outline                                  : Icons.sync,                              color: Colors.green),                          ElevatedButton(                              onPressed: ()async {                                await _firebaseMessaging.requestPermission(                                  alert: true,                                  announcement: false,                                  badge: true,                                  carPlay: false,                                  criticalAlert: false,                                  provisional: false,                                  sound: true,                                );                                String? token = await                                _firebaseMessaging.getToken(                                  vapidKey: "BGpdLRs......",                                );                              },                              child: const Text(sendToCurer)),                        ],                      ),                      children: [                        ExpansionTile(title: const Text                          (addressDelivery),                          children: [  const Text('order.addres.first.fromGeocoding.toString()'),                          Text(order.address.floorCode),                          Text(order.address.fromGeocoding),                          Text(order.address.float),                          Text(order.address.kvNumber),                          Text(order.address.home),                        ],)                      ],                    ));              });        });  }}