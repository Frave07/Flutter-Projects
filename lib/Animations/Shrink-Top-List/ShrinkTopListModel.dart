import 'package:flutter/material.dart';


class ShrinkTopListModel {

  final String logo;
  final String name;
  final String number;
  final Color backgroundColor;
  final String image;

  ShrinkTopListModel({
    required this.logo, 
    required this.name, 
    required this.number, 
    required this.backgroundColor, 
    required this.image
  });


  static final listCardShrinkTop = [

    ShrinkTopListModel(
      logo: 'Assets/list-animated/logo-macdonalds.png',
      name: 'macDonalds',
      number: '-15%',
      backgroundColor: Color(0xff01C58C),
      image: 'Assets/list-animated/papas.png'
    ),
    ShrinkTopListModel(
      logo: 'Assets/list-animated/dunki-logo.png',
      name: 'Dunki Dounts',
      number: '-30%',
      backgroundColor: Color(0xffD8E0F6),
      image: 'Assets/list-animated/dona.png'
    ),
    ShrinkTopListModel(
      logo: 'Assets/list-animated/pizaa-logo.png',
      name: 'Pizza',
      number: '-1.26%',
      backgroundColor: Color(0xffE4E1F1),
      image: 'Assets/list-animated/pizaa.png'
    ),
    ShrinkTopListModel(
      logo: 'Assets/list-animated/apple-logo.png',
      name: 'Iphone',
      number: '-18%',
      backgroundColor: Color(0xffD4E1F1),
      image: 'Assets/list-animated/iphone-11.png'
    ),
    ShrinkTopListModel(
      logo: 'Assets/list-animated/starbucks-logo.png',
      name: 'Starbucks',
      number: '-28%',
      backgroundColor: Color(0xffF1EEEF),
      image: 'Assets/list-animated/bebida.png'
    ),
    ShrinkTopListModel(
      logo: 'Assets/list-animated/adidas-log.png',
      name: 'Adidas',
      number: '-18%',
      backgroundColor: Color(0xffEEE9F5),
      image: 'Assets/list-animated/shoes.png'
    ),
    ShrinkTopListModel(
      logo: 'Assets/list-animated/samsung-logo.png',
      name: 'Samsung',
      number: '-48%',
      backgroundColor: Color(0xffEED6EF),
      image: 'Assets/list-animated/s20.png'
    ),
    ShrinkTopListModel(
      logo: 'Assets/list-animated/ps5-logo.png',
      name: 'PS5',
      number: '-8%',
      backgroundColor: Color(0xff1C1976),
      image: 'Assets/list-animated/ps5.png'
    ),

  ];
}


class DiscoverModels {

  final String text;
  final String coupons;
  final Color color;
  final IconData icon;

  DiscoverModels({
    required this.text, 
    required this.coupons, 
    required this.color, 
    required this.icon
  });

  static final listDiscover = [

    DiscoverModels(
      text: 'Most Favourites',
      coupons: '28 coupons',
      icon: Icons.favorite_border_rounded,
      color: Color(0xffFFA136)
    ),
    DiscoverModels(
      text: 'Newest',
      coupons: '20 coupons',
      icon: Icons.circle_notifications_rounded,
      color: Color(0xff8956FF)
    ),
    DiscoverModels(
      text: 'Super',
      coupons: '15 coupons',
      icon: Icons.air_rounded,
      color: Color(0xff0C6CF2)
    ),
    DiscoverModels(
      text: 'Most Favourites',
      coupons: '28 coupons',
      icon: Icons.favorite_border_rounded,
      color: Color(0xffFFCD3A)
    ),
    DiscoverModels(
      text: 'Newest',
      coupons: '20 coupons',
      icon: Icons.circle_notifications_rounded,
      color: Color(0xff8956FF)
    ),
  ];

}