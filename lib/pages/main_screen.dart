import 'package:flutter/material.dart';
import 'package:study_flutter_web_navigation2_0/router/route_delegate.dart';
import 'package:study_flutter_web_navigation2_0/router/route_handeler.dart';
import 'package:study_flutter_web_navigation2_0/services/shared_preferences_service.dart';
import 'package:study_flutter_web_navigation2_0/utils/data.dart';

class MainScreen extends StatefulWidget {
  // Receives the name of the route from router delegate
  final String routeName;

  const MainScreen({
    Key? key,
    required this.routeName,
  }) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Widget? render;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'.toUpperCase()),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: const Icon(Icons.exit_to_app),
              onPressed: (() => _logout()),
            ),
          ),
        ],
      ),
      body: Row(
        key: UniqueKey(),
        children: [
          Drawer(
            elevation: 1,
            child: ListView.builder(
              itemCount: routeList.length,
              itemBuilder: (context, i) {
                return _navTile(routeList[i]);
              },
            ),
          ),
          Expanded(
            child: Center(
              child: RouteHandeler().getRouteWidget(widget.routeName),
            ),
          ),
        ],
      ),
    );
  }

  _logout() async {
    await SharedPreferencesService.logOutUser();
    AppRouterDelegate().setPathName(RouteData.login.name, loggedIn: false);
  }

  Widget _navTile(SubNavigationRoutes route) {
    return ListTile(
      leading: Icon(
        route.icon,
        color: widget.routeName.contains(route.route.name)
            ? Colors.blue
            : Colors.grey,
      ),
      title: Text(
        route.title,
        style: TextStyle(
          color: widget.routeName.contains(route.route.name)
              ? Colors.blue
              : Colors.grey,
        ),
      ),
      onTap: () {
        AppRouterDelegate().setPathName(route.route.name);
      },
    );
  }
}
