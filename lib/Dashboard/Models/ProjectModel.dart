import 'package:flutter/material.dart';

class ProjectModel
{
  final int id;
  final String title;
  final String designer;
  final String pathImage;
  final String route;
  final Color color;
  final List<String> package;
  final List<String> permission;

  const ProjectModel({
    this.id, 
    this.pathImage,
    this.title,
    this.designer, 
    this.route, 
    this.color,   
    this.package, 
    this.permission 
  });

  static const password_manager = ProjectModel(
    id: 1,
    title: 'Password Manager',
    designer: 'Frave',
    pathImage: 'Assets/logo-white.png',
    route: 'authentication',
    color: Color(0xff1E58AC),
    package: [
      'google_fonts: ^2.0.0',
      'flutter_secure_storage: ^4.1.0',
      'local_auth: ^1.1.0',
      'hive: ^2.0.2',
      'hive_flutter: ^1.0.0',
      'encrypt: ^5.0.0',
      'fluttertoast: ^8.0.3'
    ],
    permission: [
      'USE_FINGERPRINT'
    ]
  );

  static const coffee = ProjectModel(
    id: 2,
    title: 'Coffee App',
    designer: 'Jacob Janura',
    pathImage: 'Assets/coffee/logo-coffee.png',
    route: 'coffee-app',
    color: Color(0xffFFA136),
    package: [],
    permission: []
  );

  static const calculator = ProjectModel(
    id: 3,
    title: 'Calculator App',
    designer: 'Lucia Scott',
    pathImage: 'Assets/logo-white.png',
    route: 'calculator',
    color: Color(0xff5A4A9E),
    package: [
      'flutter_bloc: ^7.0.0'
    ],
    permission: []
  );

  static const listAnimated = ProjectModel(
    id: 4,
    title: 'List Animated',
    designer: 'PLATFORM',
    pathImage: 'Assets/logo-white.png',
    route: 'listAnimated',
    color: Color(0xff01C58C),
    package: [],
    permission: []
  );

  static const ui = ProjectModel(
    id: 4,
    title: 'UI',
    designer: 'Frave Developer',
    pathImage: 'Assets/logo-white.png',
    route: 'homeUi',
    color: Color(0xff1C2834),
    package: [],
    permission: []
  );



  static const listProjects = [
    password_manager,
    coffee,
    calculator,
    listAnimated,
    ui
  ];

  

}