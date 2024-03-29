import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mobile_bro_food_admin_panel/pages/home/controller/home_controller.dart';
import 'package:mobile_bro_food_admin_panel/pages/home/home_page.dart';
import 'package:mobile_bro_food_admin_panel/pages/singin/signin_page.dart';
import 'package:mobile_bro_food_admin_panel/repository/auth_repostory.dart';
import 'package:mobile_bro_food_admin_panel/service/sd_service.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  String data = await DBService.readData(key: DBService.key);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Repost _authRep = Repost();
  String firstName = 'Admin';
  String lastname = 'FastFood';
  String email = 'admin';
  String password = 'admin12345';

  static final RouteObserver<PageRoute> routeObserver =
      RouteObserver<PageRoute>();

  Widget _startPage() {
    return StreamBuilder<User?>(
      stream: _authRep.firebaseAuth.authStateChanges(),
      builder: (builder, snapshot) {
        if (snapshot.hasData) {
          DBService.storeData(
            value: snapshot.data!.uid.toString(),
          );
          return ChangeNotifierProvider<HomeProvider>(
            create: (context) => HomeProvider(),
            child: const HomePage(),
          );
        } else {
          DBService.deleteData(key: DBService.key);
          return const SignPage();
        }
      },
    );
  }

  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.orange,
      theme: ThemeData(
          appBarTheme:
              const AppBarTheme(backgroundColor: Colors.orange)),
      home: _startPage(),
    );
  }
}
