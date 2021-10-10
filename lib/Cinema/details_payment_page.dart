import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/Cinema/Bloc/cinema/cinema_bloc.dart';
import 'package:flutter_projects/Dashboard/Widgets/Widgets.dart';


class DetailsPaymentPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final cinemabloc = BlocProvider.of<CinemaBloc>(context);

    return Scaffold(
      backgroundColor: Color(0xff21242C),
      body: SafeArea(
        child: Stack(
          children: [
            
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Container(
                height: size.height,
                width: size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Column(
                  children: [

                    Container(
                      height: size.height * .45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(cinemabloc.state.imageMovie)
                        )
                      ),
                    ),

                    SizedBox(height: 20.0),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              TextFrave(text: 'DATE', color: Colors.grey, fontSize: 16),
                              TextFrave(text: cinemabloc.state.date),
                            ],
                          ),
                          Column(
                            children: [
                              TextFrave(text: 'TICKETS', color: Colors.grey, fontSize: 16),
                              TextFrave(text: '${cinemabloc.state.selectedSeats.length}'),
                            ],
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              TextFrave(text: 'TIME', color: Colors.grey, fontSize: 16),
                              TextFrave(text: cinemabloc.state.time),
                            ],
                          ),
                          Column(
                            children: [
                              TextFrave(text: 'SEATS', color: Colors.grey, fontSize: 16),
                              Row(
                                children: List.generate(cinemabloc.state.selectedSeats.length, (i){
                                  return TextFrave(text: '${cinemabloc.state.selectedSeats[i]} ');

                                }),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(31, (index) => TextFrave(text: '- ', color: Colors.grey)),
                    ),
                    SizedBox(height: 10.0),
                    SizedBox(
                      height: 120,
                      width: 120,
                      child: Image(
                        image: AssetImage('Assets/qr-code-github-frave.png')
                      ),
                    )
                    
                  ],
                ),
              ),
            ),

            Positioned(
              top: size.height * .695,
              left: 15,
              child: Icon(Icons.circle, color: Color(0xff21242C))
            ),

            Positioned(
              top: size.height * .695,
              right: 15,
              child: Icon(Icons.circle, color: Color(0xff21242C))
            ),
      
          ],
        ),
      ),
    );
  }
}