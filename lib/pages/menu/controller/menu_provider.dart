import 'package:flutter/foundation.dart';import 'package:flutter/material.dart';import 'package:image_picker_web/image_picker_web.dart';import 'package:mobile_bro_food_admin_panel/model/food_model.dart';import 'package:mobile_bro_food_admin_panel/service/net_serivce.dart';import 'package:mobile_bro_food_admin_panel/service/rtdb_service.dart';class MenuProvider extends ChangeNotifier{late TextEditingController _controllerName;late TextEditingController _controllerPrice;late TextEditingController _controllerAbout;String imgUrl = '';String? type;bool isAddOpen = false;MenuProvider(){   _controllerName =      TextEditingController (); _controllerPrice =  TextEditingController (); _controllerAbout=  TextEditingController ();}static List<String> menuItems =[  Type.set.name,  Type.lavash.name,  Type.shaurma.name,  Type.donar.name,  Type.xaggi.name,  Type.burgers.name,  Type.hotDog.name,  Type.garniri.name,  Type.souse.name,  Type.napitk.name,  Type.deserts.name,  Type.morojonoe.name,];final List<DropdownMenuItem<String>> dropDownMenuItems = menuItems    .map(      (String value) => DropdownMenuItem<String>(    value: value,    child: Text(value),  ),).toList();TextEditingController get controllerName => _controllerName;  Uint8List? image;bool isLoading = true;  List<Foods> list = [];Future<void> get()async{  Map s =  await NetworkService.GET(NetworkService.API_MENU,{});  if(s.isNotEmpty){    if(list.length != listFromJson(s).length){      list =  listFromJson(s);    }  }else {    list = [];  }  isLoading = false;}void fileGalery(context) async{  late BuildContext alertContext;  await showDialog(      context: context,      builder: (builder) {        return SimpleDialog(          children: [            IconButton(              onPressed: (){                alertContext = builder;                _getImageFromFile(alertContext);              },              icon: Row(                children: const [                  Icon(Icons.file_copy),                  SizedBox(                    width: 10,                  ),                  Text("Use File")                ],              ),            )          ],        );      });  print('asdsd');  print(image.toString());  notifyListeners();  //Navigator.of(alertContext,).pop('dialog');}void _getImageFromFile(context) async { Uint8List? picker = await ImagePickerWeb.getImageAsBytes();  if (picker != null) {    image = picker;  }  Navigator.of(context).pop();}@overridevoid dispose() {  _controllerName.dispose();  _controllerPrice.dispose();  _controllerAbout.dispose();  list.clear();  super.dispose();}void dropType(String? value) {  if (value != null) {    type = value;  }  notifyListeners();}Future<void> add() async {  imgUrl =  await StoreRepos.uploadImage(image!);}void closeOrOpen(){  isAddOpen = !isAddOpen;  notifyListeners();}TextEditingController get controllerPrice => _controllerPrice;TextEditingController get controllerAbout => _controllerAbout;}