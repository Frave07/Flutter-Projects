part of 'calculator_bloc.dart';

class CalculatorState {

  final String firstNumber;
  final String secondNumber;
  final String resultNumber;
  final String operation;
  final ThemeData theme;


  CalculatorState({
    this.firstNumber = '0',
    this.secondNumber = '0',
    this.resultNumber = '0',
    this.operation = '+',
    required this.theme,

  });

  CalculatorState copyWith({ String? firstNumber, String? secondNumber, String? resultNumber, String? operation, ThemeData? theme}){
    return CalculatorState(
      firstNumber: firstNumber ?? this.firstNumber,
      secondNumber: secondNumber ?? this.secondNumber,
      resultNumber: resultNumber ?? this.resultNumber,
      operation: operation ?? this.operation,
      theme: theme ?? this.theme,
    );
  }

}
