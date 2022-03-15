
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/scrollable/bloc/food/food_bloc.dart';


class SliverAppBarBackground extends StatelessWidget {

  const SliverAppBarBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<FoodBloc, FoodState>(
      builder: (context, state) {

        return SliverAppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          expandedHeight: 250,
          stretch: true,
          pinned: state.scrollGlobally < 90 ? true : false,
          flexibleSpace: FlexibleSpaceBar(
            collapseMode: CollapseMode.pin,
            stretchModes: const [StretchMode.zoomBackground],
            background: Stack(
              fit: StackFit.expand,
              children: [
      
                Positioned.fill(
                  child: Image.asset(
                    'Assets/food/cover.jpg',
                    fit: BoxFit.cover,
                    colorBlendMode: BlendMode.darken,
                    color: Colors.black.withOpacity(.2),
                  ),
                ),
      
                Positioned(
                  top: 40,
                  left: 10,
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white,),
                  )
                ),
      
                Positioned(
                  top: 40,
                  right: 10,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.favorite_rounded, color: Colors.white,),
                  )
                ),
      
              ],
            ),
          ),
        );

      }
    );
  }
}