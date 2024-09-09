import 'package:intl/intl.dart';

extension StringDateExtension on String{
  String formatNewsDate(){
    var inputFormat = DateFormat("yyyy-MM-ddTHH:mm:SSZ");
    var date = inputFormat.parse(this);

    var outputFormat = DateFormat("yyyy MMM ddd HH:mm aa");

    return outputFormat.format(date);

  }

}