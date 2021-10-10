
class DateTimeModel {

  final String day;
  final String number;

  DateTimeModel({ required this.day, required this.number});


  static List<DateTimeModel> listDate = [

    DateTimeModel(day: 'Thu', number: '8'),
    DateTimeModel(day: 'Fri', number: '9'),
    DateTimeModel(day: 'Sat', number: '10'),
    DateTimeModel(day: 'Sun', number: '11'),
    DateTimeModel(day: 'Mon', number: '12'),

  ];

  static List<String> listTime = [
    '11:30 AM',
    '12:50 AM',
    '3:30 PM',
    '5:30 PM',
    '7:30 PM',
  ];

}