import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/scrollable/bloc/food/food_bloc.dart';
import 'package:flutter_projects/scrollable/widgets/slider_heder_title_item.dart';
import 'package:flutter_projects/scrollable/widgets/sliver_header.dart';

import '../widgets/sliver_app_bar_background.dart';
import '../widgets/sliver_body_item.dart';

class InitialHomeFood extends StatelessWidget {

  const InitialHomeFood({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => FoodBloc()..add(GetDataProductsEvent())),
      ],
      child: HomeFoodScreen(),
    );
  }

}


class HomeFoodScreen extends StatefulWidget {

  const HomeFoodScreen({Key? key}) : super(key: key);

  @override
  State<HomeFoodScreen> createState() => _HomeFoodScreenState();
}

class _HomeFoodScreenState extends State<HomeFoodScreen> {

  late FoodBloc foodBloc;

  @override
  void initState() {
    foodBloc = BlocProvider.of<FoodBloc>(context);
    foodBloc.init();
    super.initState();
  }

  @override
  void dispose() {
    foodBloc.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: BlocBuilder<FoodBloc, FoodState>(
          builder: (context, state) {
            
            return CustomScrollView(
              controller: foodBloc.scrollControllerGlobally,
              physics: const BouncingScrollPhysics(),
              slivers: [
          
                SliverAppBarBackground(),
          
                SliverPersistentHeader(delegate: SliverHeader(), pinned: true),
          
                for (var i = 0; i < state.listProducts.length; i++) ...[
          
                  SliverPersistentHeader(
                    delegate: SliderHeaderTitleItem(title: state.listProducts[i].nameCategory, index: i),
                  ),

      
                  SliverBodyItem(listProducts: state.listProducts[i].listProducts),
          
                ]
          
              ],
            );
      
          },
        ),
      ),
    );
  }
}