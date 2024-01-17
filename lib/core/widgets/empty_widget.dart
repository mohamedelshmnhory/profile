import 'package:flutter/cupertino.dart';

import '../resources.dart';

class EmptyWidget extends StatefulWidget {
  final Widget? icon;
  final String? text;
  const EmptyWidget({Key? key, this.icon, this.text}) : super(key: key);

  @override
  State<EmptyWidget> createState() => _EmptyWidgetState();
}

class _EmptyWidgetState extends State<EmptyWidget> {
  bool _showWidget = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) setState(() => _showWidget = true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return !_showWidget
        ? const SizedBox()
        : Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                widget.icon ?? const SizedBox(),
                10.heightBox(),
                AppText(
                  text: widget.text ?? 'No items found',
                  style: meduim18.copyWith(color: mainColor),
                ),
              ],
            ),
          );
  }
}
