import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class TextFrave extends StatelessWidget
{
  final String text;
  final double size;
  final FontWeight fontWeight;
  final Color color;
  final TextOverflow textOverflow;

  const TextFrave({
      @required this.text,
      this.size = 18,
      this.fontWeight = FontWeight.normal,
      this.color = Colors.black,
      this.textOverflow = TextOverflow.visible
  });

  @override
  Widget build(BuildContext context)
  {
    return Text(
      text,
      style: GoogleFonts.getFont('Roboto', fontSize: size, fontWeight: fontWeight, color: color),
      overflow: textOverflow,
     );
  }
}