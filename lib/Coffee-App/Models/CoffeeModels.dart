import 'dart:math';


double _doubleInRange(Random source, num start, num end) => source.nextDouble() * (end - start) + start;
final random = Random();

final coffees = List.generate(_names.length, (index) 
  => CoffeeModels(
    name: _names[index],
    image: 'Assets/coffee/${index + 1}.png',
    price: _doubleInRange(random, 3, 7)
  )
);

class CoffeeModels
{
  final String name;
  final String image;
  final double price;

  CoffeeModels({this.name, this.image, this.price});

}

final _names = [
  'Caramel Macchiato',
  'Caramel Cold Drink',
  'Iced Coffe Mocha',
  'Caramelized Pecan Latte',
  'Toffee Nut Latte',
  'Capuchino',
  'Toffee Nut Iced Latte',
  'Americano',
  'Vietnamese-Style Iced Coffee',
  'Black Tea Latte',
  'Classic Irish Coffee',
  'Toffee Nut Crunch Latte'
];