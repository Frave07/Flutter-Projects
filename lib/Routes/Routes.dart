import 'package:flutter/material.dart';
import 'package:flutter_projects/Animations/Shrink-Top-List/ShrinkTopListPage.dart';
import 'package:flutter_projects/Calculator/HomeCalculator.dart';
import 'package:flutter_projects/Cinema/home_cine_page.dart';
import 'package:flutter_projects/Coffee-App/HomeCoffeePage.dart';
import 'package:flutter_projects/Dashboard/Pages/MainPage.dart';
import 'package:flutter_projects/Password_Manager/Authentication.dart';

Map< String, Widget Function(BuildContext)> routes = {

    '/' : (_) => MainPage(),
    'authentication' : (_) => AuthenticationPage(),
    'coffee-app'     : (_) => HomeCoffeePage(),
    'calculator'     : (_) => AppStateCalculator(),
    'listAnimated'   : (_) => ShrinkTopListPage(),
    'cinema'         : (_) => HomeCinePage(),
};