import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/scrollable/data/data_food.dart';
import 'package:flutter_projects/scrollable/models/product_model.dart';

part 'food_event.dart';
part 'food_state.dart';

class FoodBloc extends Bloc<FoodEvent, FoodState> {

  late ScrollController scrollControllerGlobally;
  late ScrollController scrollControllerHeader;

  FoodBloc() : super(const FoodState()) {

    on<GetDataProductsEvent>(_getDataProducts);
    on<GetScrollGloballyEvent>(_getScrollGlobally);
    on<GetIndexCategoryEvent>(_getIndexCategory);
    on<GetListOffsetHeaderEvent>(_getListOffsetHeader);
    on<ChangeVisibleHeaderEvent>(_changeVisibleHeader);

  }

  void init(){

    scrollControllerGlobally = ScrollController();
    scrollControllerHeader = ScrollController();

    scrollControllerGlobally.addListener(_listenScrollChange);
    scrollControllerHeader.addListener((_scrollHeader));

    

  }

  void dispose(){

    scrollControllerGlobally.dispose();
    scrollControllerHeader.dispose();

  }

  void _listenScrollChange(){

    add(GetScrollGloballyEvent(scrollControllerGlobally.offset));

  }


  void _scrollHeader(){

    if(state.isVisibleHeader){

      print('HERE');

    }
      print('HERE');

  }


  Future<void> _getDataProducts(GetDataProductsEvent event, Emitter<FoodState> emit) async {

    final list = DataFood.listProducts;

    final offsets = List.generate(list.length, (i) => i.toDouble());

    emit(state.copyWith(listProducts: list, listOffsetHeader: offsets));

  }

  
  Future<void> _getScrollGlobally(GetScrollGloballyEvent event, Emitter<FoodState> emit) async {

    emit(state.copyWith(scrollGlobally: event.scroll));

  }


  Future<void> _getIndexCategory(GetIndexCategoryEvent event, Emitter<FoodState> emit) async {

    emit(state.copyWith(indexCategory: event.index));

  }


  Future<void> _getListOffsetHeader(GetListOffsetHeaderEvent event, Emitter<FoodState> emit) async {

    emit(state.copyWith(listOffsetHeader: event.offset));

  }


  Future<void> _changeVisibleHeader(ChangeVisibleHeaderEvent event, Emitter<FoodState> emit) async {

    emit(state.copyWith(isVisibleHeader: event.visible));

  }





}
