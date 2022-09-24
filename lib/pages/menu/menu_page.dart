import 'package:flutter/material.dart';import 'package:mobile_bro_food_admin_panel/pages/menu/controller/menu_provider.dart';import 'package:provider/provider.dart';class MenuPage extends StatelessWidget {  const MenuPage({Key? key}) : super(key: key);  @override  Widget build(BuildContext context) {    return ChangeNotifierProvider(create: (context)=> MenuProvider      (),builder:(_,__){      return  _Menu();    });  }}class _Menu extends StatelessWidget {  const _Menu({Key? key}) : super(key: key);  @override  Widget build(BuildContext context) {    final provider = context.watch<MenuProvider>();    print(provider.list.length);    return Scaffold(      appBar: AppBar(      ),      body:Stack(children: [ListView.builder(    itemCount: provider.list.length,        itemBuilder: (context,i){          return ListTile(title: Text(provider.list[i].name),            subtitle: Text(provider.list[i].price),leading:            Image.network              (provider.list[i].image),trailing: Text(provider                .list[i]                .price),);        }),    Visibility(    visible: provider.isLoading,    child: Center(child: CircularProgressIndicator(),))],),    );  }}