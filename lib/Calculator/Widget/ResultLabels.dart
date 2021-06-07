import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/Calculator/Bloc/Calculator/calculator_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultLabels extends StatelessWidget 
{

  @override
  Widget build(BuildContext context) {

    final calculatorBloc = BlocProvider.of<CalculatorBloc>(context);
    final themeBloc = BlocProvider.of<CalculatorBloc>(context).state.theme;
    final size = MediaQuery.of(context).size;

    if( calculatorBloc.state.firstNumber == '0' && calculatorBloc.state.secondNumber == '0'){
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        height: 190,
        width: size.width,
        color: themeBloc.scaffoldBackgroundColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
             _textResult(calculatorBloc.state.resultNumber, themeBloc.canvasColor, 50, FontWeight.bold),
             SizedBox(height: 30),
          ],
        ),
      );
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      height: 190,
      width: size.width,
      color: themeBloc.scaffoldBackgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [

              _textResult(
                  calculatorBloc.state.firstNumber.endsWith('.0')
                ? calculatorBloc.state.firstNumber.substring(0, calculatorBloc.state.firstNumber.length - 2)
                : calculatorBloc.state.firstNumber 
                ,themeBloc.canvasColor, 26, FontWeight.normal),

              SizedBox(width: 10),
              _textResult(calculatorBloc.state.operation , Color(0xffeb6565), 26, FontWeight.normal),
              SizedBox(width: 10),
              _textResult(calculatorBloc.state.secondNumber, themeBloc.canvasColor, 26, FontWeight.normal),
            ],
          ),
          SizedBox(height: 15),
          _textResult(
              calculatorBloc.state.resultNumber.endsWith('.0')
              ? calculatorBloc.state.resultNumber.substring(0, calculatorBloc.state.resultNumber.length - 2)
              : calculatorBloc.state.resultNumber
            ,themeBloc.canvasColor, 50, FontWeight.bold),
          SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _textResult( String text, Color color, double size, FontWeight weight ){
    return Text( text, 
      style: GoogleFonts.getFont('Inter', fontSize: size, fontWeight: weight , color: color)
    );
  }

}