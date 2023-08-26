import 'package:flutter/material.dart';
import 'package:proyecto/widgets/login_form.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: <Color>[
              Color.fromARGB(255, 53, 117, 113),
              Color.fromARGB(0, 80, 117, 239),
            ], begin: Alignment.topCenter),
          ),
          child: ListView(
            padding:
                const EdgeInsets.symmetric(horizontal: 40.0, vertical: 200),
            children: const <Widget>[
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage('images/tarje.png'),
                      width: 170,
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      'Bienvenido',
                      style: TextStyle(
                        fontSize: 38.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Proyecto SE',
                      style: TextStyle(fontSize: 25.0),
                    ),
                    const SizedBox(height: 25),
                    LoginForm()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
