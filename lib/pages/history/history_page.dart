import 'package:flutter/material.dart';import 'package:mobile_bro_food_admin_panel/pages/history/controller/history_provider.dart';import 'package:provider/provider.dart';class HistoryPage extends StatelessWidget {  const HistoryPage({Key? key}) : super(key: key);  @override  Widget build(BuildContext context) {    return ChangeNotifierProvider<HistoryProvider>(        create: (context) => HistoryProvider(),        child: const _HistoryPage());  }}class _HistoryPage extends StatelessWidget {  const _HistoryPage({Key? key}) : super(key: key);  @override  Widget build(BuildContext context) {    final provider = context.read<HistoryProvider>();    print('HistoryPage');    return FutureBuilder(        future: provider.get(),        builder: (context, snapshot) {          return SizedBox(            height: MediaQuery.of(context).size.height * .8,            child: Stack(              children: [                ListView.builder(                    padding: const EdgeInsets.only(top: 50),                    itemCount: provider.list.length,                    itemBuilder: (context, i) {                      return ListTile(                        title: Text(provider.list[i].name),                        subtitle: Text(provider.list[i].price),                        leading:                            Image.network(provider.list[i].image),                        trailing: Text(provider.list[i].price),                      );                    },                ),                Visibility(                  visible: provider.isLoading,                  child: const Center(                    child: CircularProgressIndicator(),                  ),                ),              ],            ),          );        },    );  }}