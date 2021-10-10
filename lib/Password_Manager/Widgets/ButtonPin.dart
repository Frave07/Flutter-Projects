import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class ButtonPin extends StatelessWidget
{
  final String text;
  final Function onPressed;
  final bool isClear;
  final bool isColor;

  const ButtonPin({ 
    required this.text, 
    required this.onPressed, 
    this.isClear = false, 
    this.isColor = true 
  });


 @override
 Widget build(BuildContext context)
 {
    final buttonStyle = TextButton.styleFrom(
      backgroundColor: this.isColor ? Color(0xfff5f6f7) : Colors.white,
      primary: Colors.black,
      shape: StadiumBorder()
    );
    return Container(
      margin: EdgeInsets.only(bottom: 20, left: 15, right: 15),
      child: TextButton(
        style: buttonStyle,
        child: Container(
          width: 65,
          height: 65,
          child: isClear ? Center(child: Icon(Icons.backspace_outlined, size: 30, color: Colors.grey))
                : Center(child: Text(this.text, style: GoogleFonts.getFont('Inter', fontSize: 30, fontWeight: FontWeight.w500, color: Colors.black))),
        ),
        onPressed: () => this.onPressed(),
      ),
     );
  }
}