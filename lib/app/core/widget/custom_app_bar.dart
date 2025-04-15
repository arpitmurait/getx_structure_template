import 'package:flutter/material.dart';

//Default appbar customized with the design of our app
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String appBarTitleText;
  final List<Widget>? actions;
  final bool isBackButtonEnabled;

  const CustomAppBar({
    super.key,
    required this.appBarTitleText,
    this.actions,
    this.isBackButtonEnabled = true,
  });

  @override
  Size get preferredSize => AppBar().preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      automaticallyImplyLeading: isBackButtonEnabled,
      actions: actions,
      title: Text( appBarTitleText),
    );
  }
}
