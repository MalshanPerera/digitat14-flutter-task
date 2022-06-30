import 'package:digitat14_flutter_task/models/events_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'injection_container.dart';
import 'services/navigation_service.dart';
import 'view_models/home_view_model/home_view_model.dart';
import 'views/details_view.dart';
import 'views/home_view.dart';
import 'views/splash_view.dart';
import 'widgets/view_not_found.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Digitat14 Flutter Task',
      debugShowCheckedModeBanner: false,
      navigatorKey: sl<NavigationService>().navigatorKey,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryTextTheme: const TextTheme(
          headline1: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
      initialRoute: '/',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(
              builder: (c) => const SplashView(),
            );
          case '/home':
            return MaterialPageRoute(
              builder: (c) => ChangeNotifierProvider(
                create: (_) => sl<HomeViewModel>(),
                child: const HomeView(),
              ),
            );
          case '/details':
            return MaterialPageRoute(
              builder: (c) => DetailsView(
                event: settings.arguments as Event,
              ),
            );
          default:
            return MaterialPageRoute(
              builder: (c) => const ViewNotFound(),
            );
        }
      },
    );
  }
}
