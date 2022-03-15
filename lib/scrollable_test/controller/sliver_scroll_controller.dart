
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_projects/scrollable_test/data/data_product.dart';
import 'package:flutter_projects/scrollable_test/models/my_header_model.dart';
import 'package:flutter_projects/scrollable_test/models/product_model.dart';

class SliverScrollController {

  // List of categories
  late List<CategoryModel> listCategory;

  List<double> listOffSetItemHeader = [];

  final headerNotifier = ValueNotifier<MyHeaderModel?>(null);

  final globalOffSetValue = ValueNotifier<double>(0);

  final goingDown = ValueNotifier<bool>(false);

  final valueScroll = ValueNotifier<double>(0);

  late ScrollController scrollControllerItemHeader;

  late ScrollController scrollControllerGlobally;

  final visibleHeader = ValueNotifier<bool>(false);

  void loadDataRamdon(){
    final productsTwo = [ ...products ];
    final productsThree = [ ...products ];
    final productsFour = [ ...products ];

    productsTwo.shuffle();
    productsThree.shuffle();
    productsFour.shuffle();

    listCategory = [
      CategoryModel(
        category: 'Order Again',
        listProducts: products
      ),
      CategoryModel(
        category: 'Picked For You',
        listProducts: productsTwo
      ),
      CategoryModel(
        category: 'Startes',
        listProducts: productsThree
      ),
      CategoryModel(
        category: 'Gimpub Sushi',
        listProducts: productsFour
      ),
    ];
  }

  void init(){

    loadDataRamdon();
    listOffSetItemHeader = List.generate(listCategory.length, (i) => i.toDouble());
    scrollControllerGlobally = ScrollController();
    scrollControllerItemHeader = ScrollController();
    scrollControllerGlobally.addListener(_listenScrollChange);

    headerNotifier.addListener(_listenHeaderNotifier);

    visibleHeader.addListener(_listenVisibleHeader);

  }

  void _listenVisibleHeader(){
    if(visibleHeader.value){
      headerNotifier.value = const MyHeaderModel(index: 0, visible: false);
    }
  }

  void _listenHeaderNotifier(){

    if(visibleHeader.value){
      for (var i = 0; i < listCategory.length; i++) {
        scollAnimationHorizontal(index: i);
      }
    }

  }

  void scollAnimationHorizontal({required int index}){

    if(headerNotifier.value!.index == index && headerNotifier.value!.visible){
      scrollControllerItemHeader.animateTo(
        listOffSetItemHeader[headerNotifier.value!.index] - 16, 
        duration: const Duration(milliseconds: 300), 
        curve: goingDown.value ? Curves.bounceOut : Curves.fastOutSlowIn
      );
    }

  }

  
  void _listenScrollChange(){
    globalOffSetValue.value = scrollControllerGlobally.offset; 
    if(scrollControllerGlobally.position.userScrollDirection == ScrollDirection.reverse){
      goingDown.value = true;
    }else{
      goingDown.value = false;
    }
  }

  void dispose(){

    scrollControllerGlobally.dispose();
    scrollControllerItemHeader.dispose();

  }

  void refreshheader(int index, bool visible, int? lasIndex){

    final headerValue = headerNotifier.value;
    final headerTitle = headerValue?.index ?? index;
    final headerVisible = headerValue?.visible ?? false;

    if( headerTitle != index || lasIndex != null || headerVisible != false ){

      Future.microtask((){

        if(!visible && lasIndex != null){

          headerNotifier.value = MyHeaderModel(index: lasIndex, visible: true);

        }else{

          headerNotifier.value = MyHeaderModel(index: index, visible: visible);

        }

      });

    }

  }

}