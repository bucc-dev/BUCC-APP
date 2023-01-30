//! THIS FILE CONTAINS ALL EXTENSIONS USED WITH IN THE APP.
import 'dart:developer' as dev_tools show log;
import 'package:intl/intl.dart';

//! LOG EXTENSION - THIS HELPS TO CALL A .log() ON ANY OBJECT
extension Log on Object {
  void log() => dev_tools.log(toString());
}

//! STRING EXTENSIONS TO ...
//! ... VALIDATE EMAIL, STRIP A STRING, VALIDATE A LINK, GET INITIALS, CAPITALIZE FIRST LETTER
extension StringExtension on String {
  //! VALIDATE AN EMAIL
  bool validateEmail() {
    const emailPattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    final regExp = RegExp(emailPattern);

    return regExp.hasMatch(trim());
  }

  //! STRIP A STRING
  bool strip() => replaceAll(RegExp(r'\s+'), '').isEmpty;

  //! CONVERT DATE TO STRING
  String dateToString(String format) =>
      DateFormat(format).format(DateTime.parse(this)).toString();

  //! VALIDATE A LINK
  bool validateLink() {
    const urlPattern =
        r'^((?:.|\n)*?)((http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)([-A-Z0-9.]+)(/[-A-Z0-9+&@#/%=~_|!:,.;]*)?(\?[A-Z0-9+&@#/%=~_|!:‌​,.;]*)?)';

    final regExp = RegExp(urlPattern);

    return regExp.hasMatch(this);
  }

  //! GET INITIALS
  String get initials =>
      split(' ').map((e) => e.split('').first.toUpperCase()).join();

  //! CAPITALIZE
  String capitalize() => "${this[0].toUpperCase()}${substring(1)}";
}
