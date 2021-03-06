import 'package:flutter/material.dart';
import 'package:flutter_projects/Animations/Shrink-Top-List/ShrinkTopListPage.dart';
import 'package:flutter_projects/Calculator/HomeCalculator.dart';
import 'package:flutter_projects/Cinema/home_cine_page.dart';
import 'package:flutter_projects/Coffee-App/HomeCoffeePage.dart';
import 'package:flutter_projects/Dashboard/Pages/MainPage.dart';
import 'package:flutter_projects/Password_Manager/Authentication.dart';
import 'package:flutter_projects/scrollable/screens/home_food_screen.dart';
import 'package:flutter_projects/scrollable_test/scrollable_home_screen.dart';

Map< String, Widget Function(BuildContext)> routes = {

    '/' : (_) => MainPage(),
    'authentication' : (_) => AuthenticationPage(),
    'coffee-app'     : (_) => HomeCoffeePage(),
    'calculator'     : (_) => AppStateCalculator(),
    'listAnimated'   : (_) => ShrinkTopListPage(),
    'cinema'         : (_) => HomeCinePage(),
    'scrollable'     : (_) => ScrollableTabScreen(),
    'food_scroll'    : (_) => InitialHomeFood(),
};