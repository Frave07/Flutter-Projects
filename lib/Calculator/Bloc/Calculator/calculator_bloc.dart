import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_projects/Calculator/Widget/ThemeCalc.dart';

part 'calculator_event.dart';
part 'calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {

  CalculatorBloc() : super(CalculatorState( theme: CalculatorTheme.lightTheme ))  {

    on<ClearAC>(_clearAC);
    on<Clear>(_clearLast);
    on<AddNumber>(_addNumber);
    on<ChangeTheme>(_changeTheme);
    on<OperationEntry>(_operationEntry);
    on<PositiveNegative>(_positiveNegative);
    on<MathResult>(_mathResult);

  }

  
  Future<void> _clearAC(ClearAC event, Emitter<CalculatorState> emit) async {

    emit(state.copyWith(firstNumber: '0', secondNumber: '0', resultNumber: '0'));

  }

  Future<void> _clearLast(Clear event, Emitter<CalculatorState> emit) async {

     emit(state.copyWith(
      resultNumber: ( state.resultNumber.length > 1 ) 
                  ? state.resultNumber.substring(0, state.resultNumber.length - 1) 
                  : '0'
    ));

  }

  Future<void> _addNumber(AddNumber event, Emitter<CalculatorState> emit) async {

    emit(state.copyWith( resultNumber: ( state.resultNumber == '0' ) 
                        ? event.number
                        : state.resultNumber + event.number
        ));

  }

  Future<void> _changeTheme(ChangeTheme event, Emitter<CalculatorState> emit) async {

    emit(state.copyWith(theme: event.theme ));

  }

  Future<void> _operationEntry(OperationEntry event, Emitter<CalculatorState> emit) async {

    emit(state.copyWith(
      firstNumber: state.resultNumber,
      operation: event.operation,
      resultNumber: '0',
      secondNumber: '0'
    ));

  }

  Future<void> _positiveNegative(PositiveNegative event, Emitter<CalculatorState> emit) async {

    emit(state.copyWith(
          resultNumber: ( 
                state.resultNumber.contains('-') 
                ? state.resultNumber.replaceFirst('-', '')
                : '-' + state.resultNumber  
          )
        ));

  }

  Future<void> _mathResult(MathResult event, Emitter<CalculatorState> emit) async {

    double num1 = double.parse( state.firstNumber );
    double num2 = double.parse( state.resultNumber );

    switch(state.operation){
      case '+':
          emit(state.copyWith(
            secondNumber: state.resultNumber + ' =',
            resultNumber: ('${ num1 + num2 }')
          ));
          break;
      case '-':
          emit(state.copyWith(
            secondNumber: state.resultNumber + ' =',
            resultNumber: '${ num1 - num2 }'
          ));
          break;
      case 'x':
          emit(state.copyWith(
            secondNumber: state.resultNumber + ' =',
            resultNumber: '${ num1 * num2 }'
          ));
          break;
      case '/':
          emit(state.copyWith(
            secondNumber: state.resultNumber + ' =',
            resultNumber: '${ num1 ~/ num2 }'
          ));
          break;

      default:
          emit(state);

    }

  }

}
