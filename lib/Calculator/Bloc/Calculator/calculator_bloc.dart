import 'dart:async';

import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_projects/Calculator/Widget/ThemeCalc.dart';

part 'calculator_event.dart';
part 'calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {

  CalculatorBloc() : super(CalculatorState( theme: CalculatorTheme.lightTheme ));

  @override
  Stream<CalculatorState> mapEventToState( CalculatorEvent event ) async* {
    

      if( event is ClearAC ){
        yield state.copyWith(firstNumber: '0', secondNumber: '0', resultNumber: '0');
      
      } else if( event is Clear ){

        yield* _clearLast();

      }else if ( event is AddNumber ){
        
        yield state.copyWith( resultNumber: ( state.resultNumber == '0' ) 
                        ? event.number
                        : state.resultNumber + event.number
        );

      }else if( event is ChangeTheme ){
        yield state.copyWith(theme: event.theme );

      }else if( event is OperationEntry ){

        yield* _operation(event.operation);

      }else if( event is PositiveNegative ){

        yield state.copyWith(
          resultNumber: ( 
                state.resultNumber.contains('-') 
                ? state.resultNumber.replaceFirst('-', '')
                : '-' + state.resultNumber  
          )
        );

      }else if( event is MathResult ){

        yield* _mathResult();
      }
  }

  Stream<CalculatorState> _clearLast() async*{
    yield state.copyWith(
      resultNumber: ( state.resultNumber.length > 1 ) 
                  ? state.resultNumber.substring(0, state.resultNumber.length - 1) 
                  : '0'
    );
  }

  Stream<CalculatorState> _operation(operation) async* {
    yield state.copyWith(
      firstNumber: state.resultNumber,
      operation: operation,
      resultNumber: '0',
      secondNumber: '0'
    );
  }

  Stream<CalculatorState> _mathResult() async* {
    
    double num1 = double.parse( state.firstNumber );
    double num2 = double.parse( state.resultNumber );

    switch(state.operation){
      case '+':
          yield state.copyWith(
            secondNumber: state.resultNumber + ' =',
            resultNumber: ('${ num1 + num2 }')
          );
          break;
      case '-':
          yield state.copyWith(
            secondNumber: state.resultNumber + ' =',
            resultNumber: '${ num1 - num2 }'
          );
          break;
      case 'x':
          yield state.copyWith(
            secondNumber: state.resultNumber + ' =',
            resultNumber: '${ num1 * num2 }'
          );
          break;
      case '/':
          yield state.copyWith(
            secondNumber: state.resultNumber + ' =',
            resultNumber: '${ num1 ~/ num2 }'
          );
          break;

      default:
          yield state;

    }
  }
}
