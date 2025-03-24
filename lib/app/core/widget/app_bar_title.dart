import 'package:flutter/material.dart';

import '/app/core/values/text_styles.dart';

class AppBarTitle extends StatelessWidget {
  final String text;

  const AppBarTitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: pageTitleStyle,
      textAlign: TextAlign.center,
    );
  }
}
