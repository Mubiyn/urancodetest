import 'package:flutter/material.dart';
import 'package:urancodetest/globals.dart';
import 'package:urancodetest/resources/resources.dart';

class UranTestAppBar extends StatelessWidget implements PreferredSizeWidget {
  const UranTestAppBar({
    Key? key,
    required this.title,
    this.canGoBack,
  }) : super(key: key);
  final String title;
  final bool? canGoBack;

  @override
  Widget build(BuildContext context) {
    dimension.init(context);
    return AppBar(
      automaticallyImplyLeading: canGoBack ?? true,
      centerTitle: true,
      title: Text(
        title,
        style: textTheme().headline1,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(dimension.buttonHeight!);
}
