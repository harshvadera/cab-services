import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:ride_evee/app/routes.dart';
import 'package:ride_evee/features/dashboard/models/city_model.dart';

import '../core/themes/app_themes.dart';

Future<Widget> initializeApp() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (!kIsWeb) {
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark));
  }
  final appDocumentDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  Hive.registerAdapter(CityModelAdapter());
  Hive.init(appDocumentDirectory.path);
  return const ProviderScope(child: MyApp());
}

class GlobalScrollBehavior extends ScrollBehavior {
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return const BouncingScrollPhysics();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(390, 844),
        minTextAdapt: true,
        splitScreenMode: true,
        useInheritedMediaQuery: true,
        builder: (_, child) {
          return MaterialApp(
            builder: (context, widget) {
              return ScrollConfiguration(
                  behavior: GlobalScrollBehavior(), child: widget!);
            },
            theme: AppThemes.light,
            darkTheme: AppThemes.dark,
            debugShowCheckedModeBanner: false,
            initialRoute: Routes.splash,
            onGenerateRoute: Routes.ongenerateRoute,
          );
        });
  }
}
