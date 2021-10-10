import 'package:flutter/material.dart';
import 'package:flutter_projects/Dashboard/Models/ProjectModel.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Widgets/BottomNavigatorBarCustom.dart';


class InfoPage extends StatelessWidget
{

 @override
 Widget build(BuildContext context)
 {
   final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.3,
        centerTitle: true,
        title: Text('Info Projects', style: GoogleFonts.getFont(
          'Inter', color: Color(0xff1A60C1), fontSize: 20,fontWeight: FontWeight.w500)
        ),
      ),
      body: Stack(
        children: [
          ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: ProjectModel.listProjects.length,
            itemBuilder: (context, i) => ListTile(
              title: Text(ProjectModel.listProjects[i].title, style: GoogleFonts.getFont('Inter', color: Color(0xff323A82))),
              trailing: Icon(Icons.arrow_forward_ios_outlined, size: 22, color: Color(0xff323A82)),
              onTap: () {}
            ),
          ),

          Positioned(
            bottom: 10,
            child: Container(
              alignment: Alignment.center,
              width: size.width,
              child: BottomNavigatorCustom(index: 1),
            )
          )
        ],
      ),
     );
  }
}