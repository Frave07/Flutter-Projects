part of 'food_bloc.dart';

class FoodState extends Equatable {

  final List<CategoryModel> listProducts;
  final double scrollGlobally;
  final int indexCategory;
  final List<double> listOffsetHeader;
  final bool isVisibleHeader;

  const FoodState({
    this.listProducts = const [], 
    this.scrollGlobally = 0.0,
    this.indexCategory = 0,
    this.listOffsetHeader = const [],
    this.isVisibleHeader = false,
  });



  FoodState copyWith({
    List<CategoryModel>? listProducts,
    double? scrollGlobally,
    int? indexCategory,
    List<double>? listOffsetHeader,
    bool? isVisibleHeader,
  }) => FoodState(
    listProducts: listProducts ?? this.listProducts, 
    scrollGlobally: scrollGlobally ?? this.scrollGlobally,
    indexCategory: indexCategory ?? this.indexCategory,
    listOffsetHeader: listOffsetHeader ?? this.listOffsetHeader,
    isVisibleHeader: isVisibleHeader ?? this.isVisibleHeader,
  );
  
  @override
  List<Object> get props => [
    listProducts,
    scrollGlobally,
    indexCategory,
    listOffsetHeader,
    isVisibleHeader,
  ];


}
