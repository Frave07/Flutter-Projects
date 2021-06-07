import 'package:flutter/material.dart';
import 'package:flutter_projects/Animations/Shrink-Top-List/ShrinkTopListModel.dart';
import 'package:flutter_projects/Dashboard/Widgets/TextFrave.dart';


class ShrinkTopListPage extends StatefulWidget {
  @override
  _ShrinkTopListPageState createState() => _ShrinkTopListPageState();
}

class _ShrinkTopListPageState extends State<ShrinkTopListPage> 
{

  final scrollController = ScrollController();

  void onListen(){
    setState(() {});
  }

  @override
  void initState() {
    scrollController.addListener(onListen);
    super.initState();
  }


  @override
  void dispose() {
    scrollController.removeListener(onListen);
    super.dispose();
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black54, size: 20),
          onPressed: () => Navigator.of(context).pop(),
        ),
        elevation: 0.0,
        actions: [
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.search_rounded, color: Colors.black54 )
          ),
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.notes_rounded, color: Colors.black54 )
          ),
          SizedBox(width: 10.0)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: CustomScrollView(
          controller: scrollController,
          slivers: [

            SliverPersistentHeader(
              delegate: MyCustomHeader(),
              pinned: true, 
            ),
            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.all(10.0),
                height: 300,
                color: Colors.white,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextFrave(text: 'Discover', size: 24),
                        TextFrave(text: 'View all', color: Colors.grey ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 15.0),
                      height: 240,
                      // color: Colors.red,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: DiscoverModels.listDiscover.length,
                        itemBuilder: (_, i) 
                          => Container(
                            margin: EdgeInsets.only(right: 20.0),
                            padding: EdgeInsets.all(15.0),
                            height: 190,
                            width: 160,
                            decoration: BoxDecoration(
                              color: DiscoverModels.listDiscover[i].color,
                              borderRadius: BorderRadius.circular(30.0)
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                TextFrave(text: '${DiscoverModels.listDiscover[i].text}', size: 22, color: Colors.white ),
                                TextFrave(text: '2$i Coupons', color: Colors.white,),
                                Icon(DiscoverModels.listDiscover[i].icon, size: 50, color: Colors.white60)
                              ],
                            ),
                          ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SliverPersistentHeader(
              delegate: MyCustomPinner(),
              pinned: true, 
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate( ( context, i ){

                  final list = ShrinkTopListModel.listCardShrinkTop[i];
                  final itemPositionedOffset = i * 150;
                  final difference = scrollController.offset - itemPositionedOffset;
                  final percent = 1 - ( difference / 150 );
                  double opacity = percent;
                  double scale = percent;
                  if( opacity > 1.0 ) opacity = 1.0;
                  if( opacity < 0.0 ) opacity = 0.0;
                  if( percent > 1.0 ) scale = 1.0;
 
                  return Align(
                    heightFactor: 0.85,
                    child: Opacity(
                      opacity: opacity,
                      child: Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.identity()..scale(scale, 1.0),
                        child: Container(
                          margin: EdgeInsets.only(top: 5),
                          height: 120,
                          padding: const EdgeInsets.only(left: 15.0, top: 10.0, bottom: 10.0 ),
                          decoration: BoxDecoration(
                            color: list.backgroundColor,
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25.0)),
                            boxShadow: [ BoxShadow( color: Colors.grey[400], blurRadius: 30, spreadRadius: -5 )]
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Image.asset(list.logo, height: 25),
                                    TextFrave(text: list.name ),
                                    TextFrave(text: list.number, size: 30, fontWeight: FontWeight.w600 )
                                  ],
                                ),
                              ),
                              Image.asset(list.image, height: 150)
                            ],
                          )
                        ),
                      ),
                    ),
                  );

                },
                childCount: ShrinkTopListModel.listCardShrinkTop.length
              ),
            )
          ],
        ),
      )
     );
  }
}

class MyCustomHeader extends SliverPersistentHeaderDelegate {
  
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
      
      return Container(
        height: 50.0,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextFrave(text: 'Frave Cards', size: 23, color: Colors.grey ),
            TextFrave(text: 'Coupons', size: 23, color: Colors.black ),
          ],
        ),
      );
    }
  
    @override
    double get maxExtent => 50.0;
  
    @override
    double get minExtent => 50.0;
  
    @override
    bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => false;

}


class MyCustomPinner extends SliverPersistentHeaderDelegate {

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
      
      return Container(
        padding: EdgeInsets.only(left: 20.0),
        alignment: Alignment.centerLeft,
        height: 40.0,
        color: Colors.white,
        child: TextFrave(text: 'My Coupons', size: 23, color: Colors.black, fontWeight: FontWeight.w300 ),
      );
    }
  
    @override
    double get maxExtent => 40.0;
  
    @override
    double get minExtent => 40.0;
  
    @override
    bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => false;
}