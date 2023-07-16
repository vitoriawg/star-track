import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mobileapp/screens/homepage.dart';


void main (){
  WidgetsFlutterBinding.ensureInitialized();
  if(Platform.isAndroid) {
    runApp(const MobileApp());
  }
}

class MobileApp extends StatelessWidget {
  const MobileApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
        scaffoldBackgroundColor: Colors.white,
      ),
      title: 'Star- Track',
      home: HomePage(),

    );
  }
}