import 'package:flutter/material.dart';
import 'package:study_flutter_web_navigation2_0/services/split_route_params.dart';

class Settings extends StatelessWidget {
  final String routeName;

  const Settings({
    Key? key,
    required this.routeName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        getRouteParams(routeName).length > 1
            ? "Págica de configurações com parâmetro ${getRouteParams(routeName)[1]}"
            : "Págica de configurações",
        style: const TextStyle(color: Colors.blue, fontSize: 16),
      ),
    );
  }
}
