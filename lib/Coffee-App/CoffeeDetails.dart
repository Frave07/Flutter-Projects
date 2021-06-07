import 'package:flutter/material.dart';
import 'package:flutter_projects/Coffee-App/Models/CoffeeModels.dart';
import 'package:google_fonts/google_fonts.dart';


class CoffeDetailsPage extends StatelessWidget
{
  const CoffeDetailsPage({Key key, this.coffeeModels}) : super(key: key);
  
  final CoffeeModels coffeeModels;



 @override
 Widget build(BuildContext context)
 {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.2),
            child: Hero(
              tag: 'text_${coffeeModels.name}',
              child: Material(
                color: Colors.transparent,
                child: Text(coffeeModels.name, 
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.getFont('Inter', fontSize: 25, fontWeight: FontWeight.w700)),
              ),
            ),
          ),
          SizedBox(height: 30),
          SizedBox(
            height: size.height * 0.4,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Hero(
                    tag: coffeeModels.name,
                    child: Image.asset(coffeeModels.image, fit: BoxFit.fitHeight),
                  ),
                ),
                Positioned(
                  left: size.width * 0.05,
                  bottom: 0,
                  child: TweenAnimationBuilder<double>(
                    duration: Duration(milliseconds: 610),
                    tween: Tween(begin: 1.0, end: 0.0),
                    builder: (context, value, child) {
                      return Transform.translate(
                        offset: Offset(-100 * value, 240 * value ),
                        child: child,
                      );
                    },
                    child: Text('\$${ coffeeModels.price.toStringAsFixed(2) }',
                      style: GoogleFonts.getFont(
                            'Inter', fontSize: 50,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            shadows: [
                              BoxShadow(color: Colors.black45, blurRadius: 10, spreadRadius: 20)
                            ]
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
     );
  }
}