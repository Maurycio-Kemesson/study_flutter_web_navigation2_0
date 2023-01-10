import 'package:flutter/material.dart';
import 'package:study_flutter_web_navigation2_0/pages/home_screen.dart';
import 'package:study_flutter_web_navigation2_0/pages/settings_screen.dart';
import 'package:study_flutter_web_navigation2_0/pages/unknown_screen.dart';

enum RouteData {
  unkownRoute,

  notFound,

  login,
  home,
  settings,
}

class RouteHandeler {
  static final RouteHandeler _instance = RouteHandeler._();
  factory RouteHandeler() => _instance;
  RouteHandeler._();

  Widget getRouteWidget(String? routeName) {
    RouteData routeData;

    if (routeName != null) {
      final uri = Uri.parse(routeName);

      if (uri.pathSegments.isNotEmpty) {
        final pathName = uri.pathSegments.elementAt(0).toString();

        routeData = RouteData.values.firstWhere(
            (element) => element.name == pathName,
            orElse: () => RouteData.notFound);

        if (routeData != RouteData.notFound) {
          switch (routeData) {
            case RouteData.home:
              return Home(
                routeName: routeName,
              );
            case RouteData.settings:
              return Settings(
                routeName: routeName,
              );

            default:
              return Home(
                routeName: routeName,
              );
          }
        } else {
          return const UnknownRoute();
        }
      } else {
        return Home(
          routeName: routeName,
        );
      }
    } else {
      return const UnknownRoute();
    }
  }
}
