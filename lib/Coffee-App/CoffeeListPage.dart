import 'package:flutter/material.dart';
import 'package:flutter_projects/Coffee-App/CoffeeDetails.dart';
import 'package:flutter_projects/Coffee-App/Models/CoffeeModels.dart';
import 'package:google_fonts/google_fonts.dart';

const duration = Duration(milliseconds: 300);
const _initialPage = 8.0;

class CoffeeListPage extends StatefulWidget
{
  @override
  _CoffeeListPageState createState() => _CoffeeListPageState();
}

class _CoffeeListPageState extends State<CoffeeListPage> 
{

  final _pageController = PageController( viewportFraction: 0.35, initialPage: _initialPage.toInt() );
  final _pageTextController = PageController(initialPage: _initialPage.toInt() );

  double _currentPage = _initialPage;
  double _textPage = _initialPage;

  void _coffeeScrollListener(){
    setState(() {
      _currentPage = _pageController.page;
    });
  }

  void _textScrollListener(){
    setState(() {
      _textPage = _pageTextController.page;
    });
  }

  @override
  void initState() {
    _pageController.addListener(( _coffeeScrollListener ));
    _pageTextController.addListener(( _textScrollListener ));
    super.initState();
  }

  @override
  void dispose() {
    _pageController.removeListener(( _coffeeScrollListener ));
    _pageTextController.removeListener(( _textScrollListener ));
    _pageController.dispose();
    _pageTextController.dispose();
    super.dispose();
  }

 @override
 Widget build(BuildContext context)
 {
   final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Positioned(
            left:22,
            right: 20,
            bottom: -size.height * 0.3,
            top: size.height * 0.3,
            child: DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(color: Colors.brown, blurRadius: 90, spreadRadius: 45)
                ]
              ),
            )
          ),
          
          Transform.scale(
            scale: 1.6,
            alignment: Alignment.bottomCenter,
            child: PageView.builder(
              scrollDirection: Axis.vertical,
              controller: _pageController,
              itemCount: coffees.length + 1,
              onPageChanged: (value) {
                if( value < coffees.length ){
                  _pageTextController.animateToPage(value, duration: duration, curve: Curves.easeOut);
                }
              },
              itemBuilder: (context, index) {
                if( index == 0 ) return SizedBox.shrink();

                final coffee = coffees[index - 1];
                final result = _currentPage - index + 1;
                final value  = -0.4 * result + 1;
                final opacity = value.clamp(0.0, 1.0);
                // print(result);

                return GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        transitionDuration: Duration(milliseconds: 650),
                        pageBuilder: (_, animation, __) => FadeTransition(opacity: animation, child: CoffeDetailsPage(coffeeModels: coffee))
                      )
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 20.0),
                    child: Transform(
                      alignment: Alignment.bottomCenter,
                      transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..translate( 0.0 , size.height / 2.6 * (1 - value).abs())
                      ..scale(value),
                      child: Opacity(
                        opacity: opacity,
                        child: Hero(
                          tag: coffee.name,
                          child: Image.asset(coffee.image, fit: BoxFit.fitHeight,)
                        )
                      )
                    ),
                  ),
                );
              },
            ),
          ),
          Positioned(
            left: 0,
            top: 0,
            right: 0,
            height: 100,
            child: TweenAnimationBuilder<double>(
              duration: duration,
              tween: Tween(begin: 1.0, end: 0.0),
              builder: (context, value, child) {
                return Transform.translate(
                  offset: Offset(0.0, -100 * value),
                  child: child,
                );
              },
              child: Column(
                children: [

                  Expanded(
                    child: PageView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      controller: _pageTextController,
                      itemCount: coffees.length,
                      itemBuilder: (context, index) {
                        
                        final opacity = (1 - (index - _textPage).abs()).clamp(0.0, 1.0);
                        return Opacity(
                          opacity: opacity,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: size.width * 0.2),
                            child: Hero(
                              tag: 'text_${coffees[index].name}',
                              child: Material(
                                color: Colors.transparent,
                                child: Text(coffees[index].name, 
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.getFont('Inter', fontSize: 25, fontWeight: FontWeight.w700)),
                              ),
                            ),
                          ),
                        );
                      },
                    )
                  ),

                  AnimatedSwitcher(
                    key: Key(coffees[_currentPage.toInt()].name),
                    duration: duration,
                    child: Text('\$${ coffees[_currentPage.toInt()].price.toStringAsFixed(2) }',
                      style: GoogleFonts.getFont('Inter', fontSize: 20, fontWeight: FontWeight.w500),
                      )
                  )
                ],
              ),
            )
          ),
        ],   
      ),
     );
  }
}