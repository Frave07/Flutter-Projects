import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/scrollable/bloc/food/food_bloc.dart';
import 'package:flutter_projects/scrollable_test/widgets/get_box_offset.dart';
import 'package:google_fonts/google_fonts.dart';


class ListItemHeader extends StatelessWidget {

  const ListItemHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final foodBloc = BlocProvider.of<FoodBloc>(context);

    return  BlocBuilder<FoodBloc, FoodState>(
      builder: (context, state) {
        
        return Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: SingleChildScrollView(
            controller: foodBloc.scrollControllerHeader,
            padding: EdgeInsets.only(right: size.width - (state.listOffsetHeader[state.listOffsetHeader.length - 1] - state.listOffsetHeader[state.listOffsetHeader.length - 2])),
            scrollDirection: Axis.horizontal,
            child:Row(
              children: List.generate(state.listProducts.length, (i){
  
                return GetBoxOffset(
                  offset: (offset) {
                    List<double> list = [];
                    list.addAll(foodBloc.state.listOffsetHeader);

                    list[i] = offset.dx;

                    foodBloc.add(GetListOffsetHeaderEvent(list));
                  },
                  child: Container(
                    // alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                    margin: const EdgeInsets.only(right: 10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: state.indexCategory == i ? Colors.white : Colors.black
                    ),
                    child: Text(
                      state.listProducts[i].nameCategory, 
                      style: GoogleFonts.roboto(color: state.indexCategory == i ? Colors.black : Colors.white, fontSize: 18)
                    ),
                  ),
                );
  
              }),
            ),
          ),
        );

      },
    );
  }
}