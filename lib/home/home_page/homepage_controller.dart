import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class HomepageController extends ChangeNotifier{


String dateFormat(){
  var date = DateTime.now();
  var formatDate = DateFormat('EEE, dd MMM').format(date);
  return formatDate;
}
}