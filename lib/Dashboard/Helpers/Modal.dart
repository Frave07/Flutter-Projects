
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

modalAlert( BuildContext context ){

  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Center(child: Text('Something went wrong', style: GoogleFonts.getFont('Inter'))),
      content: Container(
        height: 75,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0)
        ),
        child: Text('You need to setup either PIN or Fingerprint Authentication to be able to use this App. \n I am doing this for you Safety!'),
      ),
      actions: [
        TextButton(
          child: Text('I get it', style: GoogleFonts.getFont('Inter', fontSize: 16)),
          onPressed: ()=> Navigator.pop(context),
        )
      ],
    )
  );

}