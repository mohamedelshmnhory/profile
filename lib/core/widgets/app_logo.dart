import 'package:flutter/material.dart';

import '../imagePaths.dart';
import '../resources.dart';



class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      LOGO,
      height: SizeConfig.getFontSize(80),
      color: mainColor,
    );
  }
}
