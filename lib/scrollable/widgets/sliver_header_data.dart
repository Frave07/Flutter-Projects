import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class SliverHeaderData extends StatelessWidget {

  const SliverHeaderData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Pizzas . Hamburguesas . Fast Food', style: GoogleFonts.roboto(color: Colors.white, fontSize: 18.0)),
          const SizedBox(height: 5.0),
          Row(
            children: const [
              Icon(Icons.access_time, size: 14, color: Colors.white,),
              SizedBox(width: 4.0),
              Text('30 - 40 Min  4.3', style: TextStyle(fontSize: 12.0, color: Colors.white)),
              SizedBox(width: 6.0),
              Icon(Icons.star_rounded, size: 14, color: Colors.white),
              SizedBox(width: 8.0),
              Text('\$ 6.50 Fee', style: TextStyle(fontSize: 12.0, color: Colors.white)),
            ],
          ),
        ],
      ),
    );
  }
}