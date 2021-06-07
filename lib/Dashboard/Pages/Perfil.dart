import 'package:flutter/material.dart';
import 'package:flutter_projects/Dashboard/Widgets/TextFrave.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Widgets/BottomNavigatorBarCustom.dart';


class PerfilPage extends StatelessWidget
{

 @override
 Widget build(BuildContext context)
 {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile', style: GoogleFonts.getFont(
          'Inter', fontSize: 22,fontWeight: FontWeight.w500)
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        actions: [
          Icon(Icons.more_horiz_outlined),
          SizedBox(width: 10)
        ],
      ),
      body: Stack(
        children: [
          ListView(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            children: [
              SizedBox(height: 20),
              Center(
                child: Container(
                  padding: EdgeInsets.all(15.0),
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                    color: Color(0xff3F8CFF).withOpacity(0.2),
                    shape: BoxShape.circle
                  ),
                  child: Container(
                    padding: EdgeInsets.all(7.0),
                    height: 100,
                    width: 100,
                    
                    child: Image.asset('Assets/logo.png', height: 50),
                  ),
                )
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFrave(text: 'Frave Developer', size: 20),
                  SizedBox(width: 5),
                  Icon(Icons.verified, color: Color(0xff3F8CFF))
                ],
              ),
              SizedBox(height: 50),
              Text('Account Settings', style: GoogleFonts.getFont('Inter', fontSize: 16, color: Colors.grey)),

              SizedBox(height: 10),
              ListTile(
                leading: Icon(Icons.nightlight_round),
                title: Text('Dark Mode', style: GoogleFonts.getFont('Inter', fontSize: 16)),
                trailing: Icon(Icons.arrow_forward_ios_rounded, size: 18),
                onTap: (){},
              ),
              ListTile(
                leading: Icon(Icons.code),
                title: Text('GitHub', style: GoogleFonts.getFont('Inter', fontSize: 16)),
                trailing: Icon(Icons.arrow_forward_ios_rounded, size: 18),
                onTap: (){},
              ),
              ListTile(
                leading: Icon(Icons.movie_creation_outlined),
                title: Text('Youtube', style: GoogleFonts.getFont('Inter', fontSize: 16)),
                trailing: Icon(Icons.arrow_forward_ios_rounded, size: 18),
                onTap: (){},
              )
              
            ],
          ),
          Positioned(
            bottom: 10,
            child: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              child: BottomNavigatorCustom(index: 2),
            ),
          )
        ],
      ),
     );
  }
}