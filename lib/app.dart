import 'package:flutter/material.dart';
import 'package:study_flutter_web_navigation2_0/router/route_delegate.dart';
import 'package:study_flutter_web_navigation2_0/router/route_information_parser.dart';

class App extends StatelessWidget {
  final bool isLoggedIn;
  const App({Key? key, required this.isLoggedIn}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Estudos Flutter web Navigation 2.0',
      routeInformationParser: RoutesInformationParser(),
      routerDelegate: AppRouterDelegate(isLoggedIn: isLoggedIn),
    );
  }
}
