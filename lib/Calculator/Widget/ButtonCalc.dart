import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/Calculator/Bloc/Calculator/calculator_bloc.dart';
import 'package:google_fonts/google_fonts.dart';


class ButtonCalc extends StatelessWidget {

  final String text;
  final Color textColor;
  final Function onPressed;

  const ButtonCalc({
    required this.text, 
    this.textColor = Colors.black, 
    required this.onPressed 
  });


 @override
 Widget build(BuildContext context)
 {
   final calculatorBloc = BlocProvider.of<CalculatorBloc>(context);
   
   final buttonStyle = TextButton.styleFrom(
     backgroundColor: calculatorBloc.state.theme.primaryColor,
     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
     primary: Colors.black87
   );

    return Container(
      margin: EdgeInsets.only(bottom: 15),
      height: 70,
      width: 70,
      child: TextButton(
        style: buttonStyle,
        child: Center(child: Text(text, style: GoogleFonts.getFont('Inter', fontSize: 27, fontWeight: FontWeight.w500, color: textColor))),
        onPressed: () => onPressed(),
      )
    );

  }
}