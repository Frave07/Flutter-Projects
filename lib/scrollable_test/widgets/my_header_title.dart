import 'package:flutter/material.dart';

const headerTitle = 80.0;
typedef OnHeaderChange = void Function(bool visible);

class MyHeaderTitle extends SliverPersistentHeaderDelegate {

  final OnHeaderChange onHeaderChange;
  final String title;

  const MyHeaderTitle({required this.onHeaderChange, required this.title});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {

    if(shrinkOffset > 0){
      onHeaderChange(true);
    }else{
      onHeaderChange(false);
    }

    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(title, style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700, color: Colors.white)),
      ),
    );

  }

  @override
  double get maxExtent => headerTitle;

  @override
  double get minExtent => headerTitle;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => false;



}