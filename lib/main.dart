import 'package:chat/View/Screen/SplichAndOnboarding/splish.dart';
import 'package:chat/View/routing.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  // SystemChrome.setSystemUIOverlayStyle(
  //   SystemUiOverlayStyle(
  //     statusBarColor: Colors.transparent,
  //     statusBarIconBrightness:
  //         Brightness.dark, // Set the icon color to dark (black)
  //   ),
  // );

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //await FirbaseApi().intiNotification();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Chat',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: SplishScreens(),
      getPages: AppRouting.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
