import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/Calculator/Bloc/Calculator/calculator_bloc.dart';

import 'Widget/ButtonCalc.dart';
import 'Widget/ResultLabels.dart';
import 'Widget/ThemeCalc.dart';


class AppStateCalculator extends StatelessWidget
{
  @override
  Widget build(BuildContext context) 
  {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CalculatorBloc())
      ],
      child: BlocBuilder<CalculatorBloc, CalculatorState>(
        builder: (context, state) => HomeCalculatorPage(),
      )
    );
  }
}

class HomeCalculatorPage extends StatelessWidget
{

 @override
 Widget build(BuildContext context)
 {
   final size = MediaQuery.of(context).size;
   final calculatorBloc = BlocProvider.of<CalculatorBloc>(context);
   final themeBloc = BlocProvider.of<CalculatorBloc>(context).state.theme;

    return Scaffold(
      backgroundColor: themeBloc.scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.35),
              child: Container(
                margin: EdgeInsets.only(top: 10.0),
                height: 50,
                width: size.width,
                decoration: BoxDecoration(
                  color: themeBloc.backgroundColor,
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      icon : Icon(Icons.wb_sunny_outlined),
                      onPressed: () => calculatorBloc.add( ChangeTheme(CalculatorTheme.lightTheme) ),
                    ),
                    IconButton(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      icon : Icon(Icons.nights_stay_outlined, color: Colors.grey,),
                      onPressed: () => calculatorBloc.add( ChangeTheme(CalculatorTheme.darkTheme) ),
                    ),
                    
                  ],
                ),
              ),
            ),
            
            Expanded(
              flex: 2,
              child: ResultLabels()
            ),

            Expanded(
              flex: 4,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 30),
                decoration: BoxDecoration(
                  color: calculatorBloc.state.theme.backgroundColor,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ButtonCalc(text: 'AC', textColor: Color(0xff60fade), onPressed: () => calculatorBloc.add( ClearAC() )),
                        ButtonCalc(text: '+/-', textColor: Color(0xff60fade), onPressed: () => calculatorBloc.add( PositiveNegative() )),
                        ButtonCalc(text: '%', textColor: Color(0xff60fade)),
                        ButtonCalc(text: '/', textColor: Color(0xffeb6565), onPressed: () => calculatorBloc.add( OperationEntry('/'))),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ButtonCalc(text: '7', onPressed: () => calculatorBloc.add( AddNumber('7'))),
                        ButtonCalc(text: '8', onPressed: () => calculatorBloc.add( AddNumber('8'))),
                        ButtonCalc(text: '9', onPressed: () => calculatorBloc.add( AddNumber('9'))),
                        ButtonCalc(text: 'x', textColor: Color(0xffeb6565), onPressed: () => calculatorBloc.add( OperationEntry('x'))),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ButtonCalc(text: '4', onPressed: () => calculatorBloc.add( AddNumber('4'))),
                        ButtonCalc(text: '5', onPressed: () => calculatorBloc.add( AddNumber('5'))),
                        ButtonCalc(text: '6', onPressed: () => calculatorBloc.add( AddNumber('6'))),
                        ButtonCalc(text: '-', textColor: Color(0xffeb6565), onPressed: () => calculatorBloc.add( OperationEntry('-'))),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ButtonCalc(text: '1', onPressed: () => calculatorBloc.add( AddNumber('1'))),
                        ButtonCalc(text: '2', onPressed: () => calculatorBloc.add( AddNumber('2'))),
                        ButtonCalc(text: '3', onPressed: () => calculatorBloc.add( AddNumber('3'))),
                        ButtonCalc(text: '+', textColor: Color(0xffeb6565), onPressed: () => calculatorBloc.add( OperationEntry('+'))),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ButtonCalc(text: 'C', onPressed: () => calculatorBloc.add( Clear() )),
                        ButtonCalc(text: '0', onPressed: () => calculatorBloc.add( AddNumber('0'))),
                        ButtonCalc(text: '.', onPressed: () => calculatorBloc.add( AddNumber('.'))),
                        ButtonCalc(text: '=', textColor: Color(0xffeb6565), onPressed: () => calculatorBloc.add( MathResult() )),
                      ],
                    )
                  ],
                ),
              ) 
            )
          ],
        ),
      ),
    );
  }
}
