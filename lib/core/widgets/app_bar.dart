import 'package:flutter/material.dart';

import '../resources.dart';

AppBar customAppBar(String title,
    {IconData? icon,
    isHome = false,
    List<Widget>? actions,
    Widget? titleBottom}) {
  return AppBar(
    // centerTitle: true,
    backgroundColor: mainColor,
    elevation: 0,
    title: Column(
      children: [
        AppText(
          text: title,
          style: meduim16.copyWith(color: white),
        ),
        if (titleBottom != null)
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                titleBottom,
              ],
            ),
          ),
      ],
    ),
    leadingWidth: isHome ? null : SizeConfig.getW(45),
    actions: actions,
  );
}
