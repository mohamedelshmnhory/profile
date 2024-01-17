import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'core/dependencies/dependency_init.dart';
import 'core/network/remote/evn_variables.dart';
import 'core/routes.dart';
import 'core/styles/themes.dart';
import 'core/widgets/init_widget.dart';
import 'core/language/bloc/language_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  await EnvVariables.instance().init();

  configureDependencies();

  EasyLocalization.ensureInitialized();
  EasyLocalization.logger.enableBuildModes = [];

  runApp(const InitWidget(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(390, 844),
        useInheritedMediaQuery: true,
        builder: (context, mediaQuery) {
          return BlocConsumer<LanguageCubit, LanguageState>(
            bloc: getIt<LanguageCubit>()..appStart(),
            listener: (context, state) {},
            builder: (context, state) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
                navigatorKey: navigatorKey,
                onGenerateRoute: AppRouter.generateRoute,
                locale: context.locale,
                theme: appTheme,
              );
            },
          );
        });
  }
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
