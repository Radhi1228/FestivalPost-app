import 'package:festival_app/screen/caption/caption_screen.dart';
import 'package:festival_app/screen/edit/edit_screen.dart';
import 'package:festival_app/screen/home/home_screen.dart';
import 'package:festival_app/screen/splash/splash_screen.dart';
import 'package:flutter/cupertino.dart';

Map<String,WidgetBuilder> app_routes =
{
  "/" : (context) => const SplashScreen(),
  "home" : (context) => const HomeScreen(),
  "caption" : (context) => const CaptionScreen(),
  "edit" : (context) => const EditScreen(),
};