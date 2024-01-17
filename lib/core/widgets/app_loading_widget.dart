import 'package:flutter/cupertino.dart';
import 'package:profile/core/resources.dart';

class AppLoadingWidget extends StatefulWidget {
  final Color? color;
  final String? message;
  const AppLoadingWidget({super.key, this.color, this.message});

  @override
  State<AppLoadingWidget> createState() => _AppLoadingWidgetState();
}

class _AppLoadingWidgetState extends State<AppLoadingWidget> {
  bool _showWidget = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) setState(() => _showWidget = true);
    });

    // Future.delayed(const Duration(seconds: 3), () {
    //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //     content: AppText(
    //       text: '${AppStrings.pleasWait}...${widget.message ?? ''}',
    //       style: meduim16.copyWith(color: white),
    //     ),
    //   ));
    // });
  }

  @override
  Widget build(BuildContext context) {
    return !_showWidget
        ? const SizedBox()
        : const Center(
            child: CupertinoActivityIndicator(color: mainColor),
            //CircularProgressIndicator.adaptive(valueColor: AlwaysStoppedAnimation<Color>(mainColor)),
          );
  }
}
