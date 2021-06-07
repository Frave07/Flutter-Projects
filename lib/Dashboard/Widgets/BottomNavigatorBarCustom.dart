import 'package:flutter/material.dart';
import 'package:flutter_projects/Dashboard/Pages/InfoPage.dart';
import 'package:flutter_projects/Dashboard/Pages/MainPage.dart';

import '../Pages/Perfil.dart';


class BottomNavigatorCustom extends StatelessWidget
{
  final int index;

  const BottomNavigatorCustom({this.index});

 @override
 Widget build(BuildContext context)
 {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      height: 60,
      width: 280,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [ BoxShadow( color: Colors.grey, blurRadius: 10, spreadRadius: -5)]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _ItemMenu(
            i: 0, 
            index: index, 
            icon: Icons.work_outline_outlined,
            activeIcon: Icons.work,
            onPressed: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>  MainPage()))
          ),
          _ItemMenu(
            i: 1, 
            index: index, 
            icon: Icons.info_outline_rounded,
            activeIcon: Icons.info, 
            onPressed: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>  InfoPage()))
          ),
          _ItemMenu(
            i: 2, 
            index: index, 
            icon: Icons.person_outline_rounded,
            activeIcon: Icons.person, 
            onPressed: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>  PerfilPage()))
          ),
        ],
      ),
    );
  }
}

class _ItemMenu extends StatelessWidget {

  final int i;
  final int index;
  final IconData icon;
  final Function onPressed;
  final IconData activeIcon;

  const _ItemMenu({this.index, this.i, this.icon, this.onPressed, this.activeIcon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          child: Container(
            child: i == index 
                  ? Icon(activeIcon, size: 30, color: Color(0xff0C6CF2)) 
                  : Icon(icon, size: 30, color: Color(0xff0C6CF2)),
          ),
          onTap: onPressed
        ),
        if (i == index ) Icon(Icons.lens, size: 9, color: Color(0xff0C6CF2)) 
    ]);
  }
}