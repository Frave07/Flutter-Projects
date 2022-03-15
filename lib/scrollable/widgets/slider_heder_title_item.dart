
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/scrollable/bloc/food/food_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class SliderHeaderTitleItem extends SliverPersistentHeaderDelegate {

  final String title;
  final int index;

  const SliderHeaderTitleItem({required this.title, required this.index});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {

    if(shrinkOffset > .1){
      BlocProvider.of<FoodBloc>(context, listen: false).add(GetIndexCategoryEvent(index));
    }

    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(title, style: GoogleFonts.roboto(color: Colors.white, fontSize: 22.0, fontWeight: FontWeight.bold)),
      ),
    );
  }

  @override
  double get maxExtent => 80.0;

  @override
  double get minExtent => 80.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => false;



}