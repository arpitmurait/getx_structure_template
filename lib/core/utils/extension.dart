import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

extension HexColorExtension on String {
  /// Converts a hex string like "ffffff" or "#ffffff" to a [Color]
  Color toColor({bool prependHash = false}) {
    final hex = replaceAll('#', '').padLeft(6, '0');

    return Color(int.parse('FF$hex', radix: 16)); // FF is the opacity
  }
}

extension DateFormatting on DateTime {
  String toDdMmmYyyy() => DateFormat('dd, MMM yyyy').format(this);
  String mmHha() => DateFormat('hh:mm a dd, MMM, yyyy').format(this);
  String ddmmHha() => DateFormat('dd, MMM hh:mm a').format(this);

}
