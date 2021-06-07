import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class DetailsPage extends StatelessWidget
{
  final List<String> package;
  final List<String> permission;

  const DetailsPage({Key key, this.package, this.permission}) : super(key: key);

 @override
 Widget build(BuildContext context)
 {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        child: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [

                Container(
                  height: 45,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xff004481),
                    borderRadius: BorderRadius.circular(10.0)
                  ),
                  child: Center(child: Text('Package', style: GoogleFonts.getFont('Inter', fontSize: 18, color: Colors.white))),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                  height: 250,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xffEFF3FA),
                    borderRadius: BorderRadius.circular(10.0)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(this.package.length ,(index) 
                        => index == null
                        ? Text('Without Packages', style: GoogleFonts.getFont('Inter', fontSize: 17)) 
                        : Text('$index -> ${this.package[index]}', style: GoogleFonts.getFont('Inter', fontSize: 17))
                    ),
                  ),
                ),

                SizedBox(height: 20),
                Container(
                  height: 45,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xff004481),
                    borderRadius: BorderRadius.circular(10.0)
                  ),
                  child: Center(child: Text('Permission', style: GoogleFonts.getFont('Inter', fontSize: 18, color: Colors.white))),
                ),

                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                  height: 170,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xffEFF3FA),
                    borderRadius: BorderRadius.circular(10.0)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(this.permission.length ,(index)
                        => index == null 
                        ? Text('Without Permission', style: GoogleFonts.getFont('Inter', fontSize: 17))
                        : Text('$index -> ${this.permission[index]}', style: GoogleFonts.getFont('Inter', fontSize: 17)
                    )),
                  ),
                ),

              ],
            ),
          ),
        ),
      )
     );
  }
}