/**
 * Created by Imtiyazaehmad Parasara.
 * Date: 11/01/24
 */
import 'package:daily_account/main.dart';
import 'package:easy_localization/easy_localization.dart';

class Utils {
  static String dateFormatdefault = "dd-MMM-yyyy";


  static String getDateTimeFormat(String? dateTime, String format) {
    if (dateTime != null && dateTime != "") {
      var parsedDate = DateTime.parse(dateTime);
      var formatter = DateFormat(format);
      return formatter.format(parsedDate);
    } else {
      return "-";
    }
  }

  static String getString(String string) {
    return navKey.currentContext!.tr(string);
  }
}
