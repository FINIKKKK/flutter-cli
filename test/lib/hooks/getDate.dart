import 'package:intl/intl.dart';

/*
  Преобразование даты ----------------
 */
String getDate(String date, {String? format}) {
  DateTime dateTime = DateTime.parse(date);

  String formattedDate =
  DateFormat(format ?? 'yyyy-MM-dd HH:mm:ss').format(dateTime);

  return formattedDate;
}