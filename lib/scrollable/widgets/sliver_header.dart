import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/scrollable/bloc/food/food_bloc.dart';
import 'package:flutter_projects/scrollable/widgets/list_item_header.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../scrollable/widgets/sliver_header_data.dart';

class SliverHeader extends SliverPersistentHeaderDelegate {

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {

    if(shrinkOffset > .1){
      BlocProvider.of<FoodBloc>(context).add(ChangeVisibleHeaderEvent(true));
    }else{
      BlocProvider.of<FoodBloc>(context).add(ChangeVisibleHeaderEvent(false));
    }

    return Container(
      height: 100,
      color: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 300),
                  opacity: shrinkOffset > .1 ? 1 : 0,
                  child: InkWell(
                    onTap: () => Navigator.pop(context), 
                    child: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white)
                  ),
                ),
                const SizedBox(width: 10.0),
                AnimatedSlide(
                  duration: const Duration(milliseconds: 300),
                  offset: Offset(shrinkOffset > 0.1 ? -.01 : -0.27, 0),
                  child: Text('FoodTruck Fast', style: GoogleFonts.roboto(color: Colors.white, fontSize: 18.0))
                ),
              ],
            ),
          ),
          const SizedBox(height: 6.0),
          Expanded(
            child: shrinkOffset < .1 
            ? const SliverHeaderData()
            : const ListItemHeader()
          )
        ],
      ),
    );
  }

  @override
  double get maxExtent => 100.0;

  @override
  double get minExtent => 100.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => false;



}