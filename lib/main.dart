import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:home_test/app/home_test_app.dart';
import './di/injection.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  configureDependencies();
  runApp(const HomeTestApp());
}
