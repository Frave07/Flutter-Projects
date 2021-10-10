import 'package:flutter/material.dart';

class ProjectModel {
  
  final int id;
  final String title;
  final String designer;
  final String pathImage;
  final String route;
  final Color color;

  const ProjectModel({
    required this.id, 
    required this.pathImage,
    required this.title,
    required this.designer, 
    required this.route, 
    required this.color
  });

  static const password_manager = ProjectModel(
    id: 1,
    title: 'Password Manager',
    designer: 'Frave',
    pathImage: 'Assets/logo-white.png',
    route: 'authentication',
    color: Color(0xff1E58AC)
  );

  static const coffee = ProjectModel(
    id: 2,
    title: 'Coffee App',
    designer: 'Jacob Janura',
    pathImage: 'Assets/coffee/logo-coffee.png',
    route: 'coffee-app',
    color: Color(0xffFFA136)
  );

  static const calculator = ProjectModel(
    id: 3,
    title: 'Calculator App',
    designer: 'Lucia Scott',
    pathImage: 'Assets/logo-white.png',
    route: 'calculator',
    color: Color(0xff5A4A9E)
  );

  static const listAnimated = ProjectModel(
    id: 4,
    title: 'List Animated',
    designer: 'PLATFORM',
    pathImage: 'Assets/logo-white.png',
    route: 'listAnimated',
    color: Color(0xff01C58C)
  );

  static const cinema = ProjectModel(
    id: 5,
    title: 'Cinema',
    designer: 'Frave Developer',
    pathImage: 'Assets/logo-white.png',
    route: 'cinema',
    color: Color(0xff1C2834)
  );



  static const listProjects = [
    password_manager,
    coffee,
    calculator,
    listAnimated,
    cinema
  ];

  

}