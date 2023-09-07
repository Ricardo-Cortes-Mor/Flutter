import 'dart:io';
import 'package:app_holter/conect/ble.dart';
import 'package:app_holter/providers/name.dart';
import 'package:app_holter/screens/screens.dart';
import 'package:app_holter/theme_data/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
if (Platform.isAndroid) {
    WidgetsFlutterBinding.ensureInitialized();
    [
      Permission.location,
      Permission.storage,
      Permission.bluetooth,
      Permission.bluetoothConnect,
      Permission.bluetoothScan
    ].request().then((status) {
      runApp(const MyApp());
    });
  } else {
    runApp(const MyApp());
  }
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
       ChangeNotifierProvider(create:(_) => Name())
     ],
     child: const AppState(),
    
    );
     
    
    
  }
}

class AppState extends StatelessWidget {
  const AppState({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      initialRoute: 'home',
      routes:{
        'home' :(context) => const Home(),
        'graph':(context) => const Graph(),
        'blue' :(context) => Blue(),
      } ,
      
    );
  }
}

