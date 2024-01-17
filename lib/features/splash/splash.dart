import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../core/dependencies/dependency_init.dart';
import '../../core/routes.dart';
import '../../core/styles/colors.dart';
import '../../core/utils/size_config.dart';
import '../../core/widgets/app_logo.dart';
import '../../core/language/repository/langauge_repository.dart';
import '../profile/presentation/bloc/profile/profile_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  final bloc = getIt<ProfileBloc>();
  StreamSubscription? _subscription;

  late final AnimationController _controllerUMED = AnimationController(duration: const Duration(milliseconds: 800), vsync: this);

  late final AnimationController _controllerHorizontal = AnimationController(duration: const Duration(seconds: 1), vsync: this);

  late final Animation<Offset> _offsetAnimation1 = Tween<Offset>(
    begin: const Offset(0, 0),
    end: const Offset(0, 1),
  ).animate(CurvedAnimation(parent: _controllerHorizontal, curve: Curves.fastOutSlowIn));

  @override
  void initState() {
    super.initState();
    _controllerHorizontal.forward();

    _controllerHorizontal.addListener(() {
      if (_controllerHorizontal.isCompleted) {
        _controllerUMED.forward();
      }
    });

    _controllerUMED.addListener(() async {
      if (_controllerUMED.isCompleted) {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
          EasyLocalization.of(context)?.setLocale(Locale(getIt<LanguageRepository>().languageValue));

          Future.delayed(const Duration(milliseconds: 500), () {
            bloc.add(FetchUserProfileEvent());
            _subscription = bloc.stream.listen((event) {
              if (event is ProfileLoaded) {
                Navigator.pushReplacementNamed(context, PROFILE_SCREEN);
                _subscription?.cancel();
              } else if (event is ProfileError) {
                Navigator.pushReplacementNamed(context, FORM_SCREEN);
                _subscription?.cancel();
              }
            });
          });
        });
      }
    });
  }

  @override
  void dispose() {
    _controllerUMED.dispose();
    _subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(),
          SlideTransition(position: _offsetAnimation1, child: Container(color: mainColor)),
          Center(
            child: ScaleTransition(
              scale: Tween<double>(begin: SizeConfig.getFontSize(0), end: SizeConfig.getFontSize(1)).animate(CurvedAnimation(
                parent: _controllerUMED,
                curve: Curves.easeOut,
              )),
              child: const AppLogo(),
            ),
          )
        ],
      ),
    );
  }
}
