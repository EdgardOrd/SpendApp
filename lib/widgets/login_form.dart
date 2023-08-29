import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _email = '';
  String _password = '';

  void login() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      try {
        QuerySnapshot querySnapshot = await FirebaseFirestore.instance
            .collection('users')
            .where('usuario', isEqualTo: _email)
            .where('password', isEqualTo: _password)
            .get();

        if (querySnapshot.docs.isNotEmpty) {
          Navigator.pushNamed(context, '/page');
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Usuario o contraseña incorrectos.'),
              duration: Duration(seconds: 3),
            ),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error al intentar iniciar sesión.'),
            duration: Duration(seconds: 3),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              labelText: 'Correo/Usuario',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor, ingresa tu correo o usuario.';
              }
              return null;
            },
            onSaved: (value) {
              _email = value ?? '';
            },
          ),
          const SizedBox(height: 25),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Contraseña',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor, ingresa tu contraseña.';
              }
              return null;
            },
            onSaved: (value) {
              _password = value ?? '';
            },
          ),
          const SizedBox(height: 45),
          ElevatedButton(
            onPressed: login,
            child: Text(
              'Iniciar Sesión',
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF4CAF50), // Background color
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              elevation: 15,
            ),
          )
        ],
      ),
    );
  }
}
