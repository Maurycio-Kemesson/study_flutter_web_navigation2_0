import 'package:flutter/material.dart';
import 'package:study_flutter_web_navigation2_0/router/route_delegate.dart';
import 'package:study_flutter_web_navigation2_0/router/route_handeler.dart';
import 'package:study_flutter_web_navigation2_0/services/shared_preferences_service.dart';

class Login extends StatelessWidget {
  final TextEditingController emailController = TextEditingController(text: "");
  final TextEditingController passwordController =
      TextEditingController(text: "");
  Login({Key? key}) : super(key: key);
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.3,
          right: MediaQuery.of(context).size.width * 0.3,
          top: MediaQuery.of(context).size.height * 0.25,
        ),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/fundo.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Form(
            key: _loginFormKey,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(top: 60.0, bottom: 20),
                    child: Center(
                      child: FlutterLogo(size: 150),
                    ),
                  ),
                  SizedBox(
                    height: 80,
                    width: 350,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: TextFormField(
                        validator: (String? str) {
                          if (str!.isEmpty) {
                            return "Campo obrigatório.";
                          }
                        },
                        controller: emailController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Usuário',
                            hintText: 'Entre com seu usuário '),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 80,
                    width: 350,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Senha',
                            hintText: 'Entre com sua senha'),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 60),
                    child: Container(
                      height: 50,
                      width: 250,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(20)),
                      child: TextButton(
                        onPressed: () => _login(),
                        child: const Text(
                          'Login',
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _login() async {
    if (_loginFormKey.currentState!.validate()) {
      await SharedPreferencesService.logUserIn();
      AppRouterDelegate().setPathName(RouteData.home.name);
    }
  }
}
