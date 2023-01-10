import 'package:flutter/material.dart';
import 'package:study_flutter_web_navigation2_0/router/route_handeler.dart';

class SubNavigationRoutes {
  String title;
  IconData icon;
  RouteData route;
  SubNavigationRoutes(
      {required this.title, required this.icon, required this.route});
}

List<SubNavigationRoutes> routeList = [
  SubNavigationRoutes(
      title: RouteData.home.name.toUpperCase(),
      icon: Icons.home,
      route: RouteData.home),
  SubNavigationRoutes(
      title: RouteData.settings.name.toUpperCase(),
      icon: Icons.settings,
      route: RouteData.settings),
];
