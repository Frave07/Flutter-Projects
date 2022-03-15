part of 'food_bloc.dart';

abstract class FoodEvent extends Equatable {
  const FoodEvent();

  @override
  List<Object> get props => [];
}

class GetDataProductsEvent extends FoodEvent {}

class GetScrollGloballyEvent extends FoodEvent {
  final double scroll;
  const GetScrollGloballyEvent(this.scroll);
}

class GetIndexCategoryEvent extends FoodEvent {
  final int index;
  const GetIndexCategoryEvent(this.index);
}

class GetListOffsetHeaderEvent extends FoodEvent {
  final List<double> offset;
  const GetListOffsetHeaderEvent(this.offset);
}

class ChangeVisibleHeaderEvent extends FoodEvent {
  final bool visible;
  const ChangeVisibleHeaderEvent(this.visible);
}

