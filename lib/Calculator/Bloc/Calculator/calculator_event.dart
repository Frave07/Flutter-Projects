part of 'calculator_bloc.dart';


@immutable
abstract class CalculatorEvent {}


class ClearAC extends CalculatorEvent{}

class Clear extends CalculatorEvent{}

class AddNumber extends CalculatorEvent{
  final String number;

  AddNumber(this.number);
}

class ChangeTheme extends CalculatorEvent{
  final ThemeData theme;

  ChangeTheme(this.theme); 
}

class PositiveNegative extends CalculatorEvent{}


class OperationEntry extends CalculatorEvent{
  final String operation;

  OperationEntry(this.operation);
}

class MathResult extends CalculatorEvent{}
