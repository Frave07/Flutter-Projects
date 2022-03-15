import 'package:flutter/material.dart';
import 'package:flutter_projects/scrollable_test/controller/sliver_scroll_controller.dart';
import 'package:flutter_projects/scrollable_test/models/my_header_model.dart';
import 'package:flutter_projects/scrollable_test/widgets/get_box_offset.dart';


class ListItemHeaderSliver extends StatelessWidget {

  final SliverScrollController bloc;

  const ListItemHeaderSliver({Key? key, required this.bloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final itemOffsets = bloc.listOffSetItemHeader;
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: NotificationListener<ScrollNotification>(
        onNotification: (notification) => true,
        child: SingleChildScrollView(
          padding: EdgeInsets.only(right: size.width - (itemOffsets[itemOffsets.length - 1] - itemOffsets[itemOffsets.length - 2])),
          controller: bloc.scrollControllerItemHeader,
          // physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: ValueListenableBuilder(
            valueListenable: bloc.headerNotifier,
            builder: (_, MyHeaderModel? header , ___){
              
              return Row(
                children: List.generate(bloc.listCategory.length, (i){
            
                  return GetBoxOffset(
                    offset: (offset) {
                      itemOffsets[i] = offset.dx;
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 8, bottom: 8, right: 8),
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: i == header!.index ? Colors.white : null,
                        borderRadius: BorderRadius.circular(16.0)
                      ),
                      child: Text(
                        bloc.listCategory[i].category,
                        style: TextStyle(fontWeight: FontWeight.w500, color: i == header.index ? Colors.black : Colors.white),
                      ),
                    ),
                  );
            
                }),
              );
      
            }
          ),
        ),
      ),
    );
  }
}