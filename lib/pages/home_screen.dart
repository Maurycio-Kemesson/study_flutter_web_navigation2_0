import 'package:flutter/material.dart';
import 'package:study_flutter_web_navigation2_0/services/split_route_params.dart';

class Home extends StatelessWidget {
  final String routeName;

  const Home({
    Key? key,
    required this.routeName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        getRouteParams(routeName).length > 1
            ? "Página home com parâmetro  ${getRouteParams(routeName)[1]}"
            : "Página home",
        style: const TextStyle(color: Colors.blue, fontSize: 16),
      ),
    );
  }
}
