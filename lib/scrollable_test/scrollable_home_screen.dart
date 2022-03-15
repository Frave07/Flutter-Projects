import 'package:flutter/material.dart';
import 'package:flutter_projects/scrollable_test/controller/sliver_scroll_controller.dart';
import 'package:flutter_projects/scrollable_test/widgets/background_sliver.dart';
import 'package:flutter_projects/scrollable_test/widgets/list_item_header_sliver.dart';
import 'package:flutter_projects/scrollable_test/widgets/my_header_title.dart';
import 'package:flutter_projects/scrollable_test/widgets/sliver_body_item.dart';
import 'package:flutter_projects/scrollable_test/widgets/sliver_header_data.dart';
import 'package:google_fonts/google_fonts.dart';


class ScrollableTabScreen extends StatefulWidget {

  const ScrollableTabScreen({Key? key}) : super(key: key);

  @override
  State<ScrollableTabScreen> createState() => _ScrollableTabScreenState();
}

class _ScrollableTabScreenState extends State<ScrollableTabScreen> {

  final bloc = SliverScrollController();

  @override
  void initState() {
    bloc.init();
    super.initState();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Scrollbar(
        radius: const Radius.circular(16.0),
        notificationPredicate: (scroll){
          bloc.valueScroll.value = scroll.metrics.extentInside;
          return true;
        },
        child: ValueListenableBuilder(
          valueListenable: bloc.globalOffSetValue,
          builder: (_,double valueCurrentScroll, ___){

            return CustomScrollView(
              physics: const BouncingScrollPhysics(),
              controller: bloc.scrollControllerGlobally,
              slivers: [
                
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.transparent,
                  expandedHeight: 250,
                  stretch: true,
                  pinned: valueCurrentScroll < 90 ? true : false,
                  flexibleSpace: FlexibleSpaceBar(
                    collapseMode: CollapseMode.pin,
                    stretchModes: const [StretchMode.zoomBackground],
                    background: Stack(
                      fit: StackFit.expand,
                      children: [
                        const BackgroundSliver(),
                        Positioned(
                          right: 10,
                          top: ( size.height + 40) - bloc.valueScroll.value,
                          child: const Icon(Icons.favorite_rounded, color: Colors.white, size: 30.0)
                        ),
                        Positioned(
                          left: 10,
                          top: ( size.height + 40) - bloc.valueScroll.value,
                          child: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white, size: 30.0)
                        )
                      ],
                    ),
                  ),
                ),
                
                SliverPersistentHeader(delegate: _HeaderSliver(bloc: bloc), pinned: true),
                
                for (var i = 0; i < bloc.listCategory.length; i++) ...[
                
                  SliverPersistentHeader(
                    delegate: MyHeaderTitle(
                      title: bloc.listCategory[i].category, 
                      onHeaderChange: (visible){
                        return bloc.refreshheader(i, visible, i > 0 ? i - 1 : null);
                      }
                    )
                  ),
                
                  SliverBodyItem(listProduct: bloc.listCategory[i].listProducts)
                
                ]
                
              ],
            );

          },
        ),
      ),
    );
  }
}

class _HeaderSliver extends SliverPersistentHeaderDelegate {

  final SliverScrollController bloc;

  _HeaderSliver({ required this.bloc});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {

    if( shrinkOffset > .1 ){
      bloc.visibleHeader.value = true;
    }else{
      bloc.visibleHeader.value = false;
    }

    return Stack(
      children: [

        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 101,
            color: Colors.black,
            child: Column(
              children: [
                const SizedBox(height: 30.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      AnimatedOpacity(
                        opacity: shrinkOffset > 0.1 ? 1 : 0,
                        duration: const Duration(milliseconds: 300),
                        child: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white)
                      ),
                      const SizedBox(width: 10.0),
                      AnimatedSlide(
                        duration: const Duration(milliseconds: 300),
                        offset: Offset( shrinkOffset < 0.1 ? -.25 : 0.01, 0),
                        child: Text('Kavsoft Bakery', style: GoogleFonts.inter(fontSize: 18, color: Colors.white))
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 6.0),
                Expanded(
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: shrinkOffset > .1 
                      ? ListItemHeaderSliver(bloc: bloc)
                      : const SliverHeaderData()
                  ),
                )
              ],
            ),
          )
        ),

        if(shrinkOffset > .1)
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: shrinkOffset > .1 
              ? Container(
                height: .5,
                color: Colors.white,
              )
              : null
            )
          )

      ],
    );
  }

  @override
  double get maxExtent => 100.0;

  @override
  double get minExtent => 100.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => false;



}