import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _email = 'admin';
  String _password = 'admin';

  void login() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save(); // Guardar los valores del formulario

      // Verificar los datos ingresados
      if (_email == "admin" && _password == "admin") {
        // Datos correctos, mostrar pantalla de bienvenida
        Navigator.pushNamed(context, '/page');
      } else {
        // Datos incorrectos, mostrar mensaje de error
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Usuario o contraseña incorrectos.'),
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
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color.fromARGB(255, 0, 137, 62),
                ),
              ),
              labelStyle: TextStyle(
                color: Color.fromARGB(
                    255, 0, 77, 6), // Color del texto de la etiqueta
              ),
              focusColor:
                  Color.fromARGB(255, 0, 137, 62), // Color cuando tiene enfoque
              // Otros atributos de estilo y diseño
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
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color.fromARGB(255, 0, 137, 62),
                ),
              ),
              labelStyle: TextStyle(
                color: Color.fromARGB(
                    255, 0, 77, 6), // Color del texto de la etiqueta
              ),
              focusColor:
                  Color.fromARGB(255, 0, 137, 62), // Color cuando tiene enfoque
              // Otros atributos de estilo y diseño
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
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
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
