import 'package:flutter/material.dart';
import 'package:flutter_projects/Coffee-App/CoffeeListPage.dart';
import 'package:flutter_projects/Coffee-App/Models/CoffeeModels.dart';


class HomeCoffeePage extends StatefulWidget
{
  @override
  _HomeCoffeePageState createState() => _HomeCoffeePageState();
}

class _HomeCoffeePageState extends State<HomeCoffeePage> 
{


 @override
 Widget build(BuildContext context)
 {
   final size = MediaQuery.of(context).size;

    return Scaffold(
      body: GestureDetector(
        onVerticalDragUpdate: (details) {
          if( details.primaryDelta < -10 ){
            Navigator.push(context, 
            PageRouteBuilder(
              transitionDuration: Duration(milliseconds: 650),
              pageBuilder: (_, animation, __){
                return FadeTransition(
                  opacity: animation,
                  child: CoffeeListPage(),
                );
            }));
          }
        },
        child: Stack(
          children: [
            SizedBox.expand(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xffa89276),
                      Colors.white
                    ]
                  )
                ) 
              ),
            ),
            Positioned(
              height: size.height * 0.4,
              left: 0,
              right: 0,
              top: size.height * 0.15,
              child: Hero(
                tag: coffees[10].name,
                child: Image.asset(coffees[10].image),
              )
            ),
            Positioned(
              height: size.height * 0.7,
              left: 0,
              right: 0,
              bottom: 0,
              child: Hero(
                tag: coffees[7].name,
                child: Image.asset(coffees[7].image, fit: BoxFit.cover),
              )
            ),
            Positioned(
              height: size.height,
              left: 0,
              right: 0,
              bottom: -size.height * 0.8,
              child: Hero(
                tag: coffees[8].name,
                child: Image.asset(coffees[8].image, fit: BoxFit.cover),
              )
            ),
            Positioned(
              height: 140,
              left: 0,
              right: 0,
              bottom: size.height * 0.25,
              child: Image.asset('Assets/coffee/logo-coffee.png')
            ),
          ],   
        ),
      ),
     );
  }
}