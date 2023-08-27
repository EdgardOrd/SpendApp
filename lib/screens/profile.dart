import 'package:flutter/material.dart';
import 'package:proyecto/services/firebase_service.dart';
import 'package:proyecto/widgets/chart.dart';

class User extends StatefulWidget {
  const User({super.key});

  @override
  State<User> createState() => _UserState();
}

class _UserState extends State<User> {
  double totalIncome = 0;
  double totalExpenses = 0;
  double total = 0;
  String userName = '';

  @override
  void initState() {
    super.initState();
    calculate();
  }

  Future<void> loadUserName() async {
    String user = await getUser();

    setState(() {
      userName = user;
    });
  }

  void calculate() async {
    List transactions = await getSpends();

    for (var item in transactions) {
      double amount = (item['monto'] ?? 0).toDouble();
      if (item['nombre'] == 'Ingreso') {
        totalIncome += amount;
      } else {
        totalExpenses += amount;
      }
    }
    total = totalIncome - totalExpenses;
    setState(() {}); // Actualiza la interfaz después de calcular los totales
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(height: 240, child: _head()),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(height: 60.0), // SEGUNDA FILA DE LA PAGINA
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 60.0,
                                width: 200.0,
                              ),
                              Container(
                                width: 150,
                                child: Text(
                                  'Lps. 15000',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: Color(0xff368983),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20.0),
                              Container(
                                width: 150,
                                child: Text(
                                  'Total Mes Anterior',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: Color(0xff368983),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment
                            .end, // Cambio de CrossAxisAlignment.start a CrossAxisAlignment.end
                        children: [
                          SizedBox(height: 50.0),
                          Padding(
                            padding: EdgeInsets.only(right: 0.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                SizedBox(
                                  height: 15.0,
                                  width: 200.0,
                                ),
                                Container(
                                  width: 150,
                                  child: Text(
                                    'Lps.${total}',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: Color(0xff368983),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20.0),
                                Container(
                                  width: 150,
                                  child: Text(
                                    'Balance Actual',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: Color(0xff368983),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Chart(),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _head() {
  return Container(
    width: double.infinity,
    height: 240,
    decoration: BoxDecoration(
      color: Color(0xff368983),
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),
    ),
    child: Column(
      children: [
        SizedBox(height: 30.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 25.0,
                      width: 200.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Image(
                        image: AssetImage('images/usuario.png'),
                        width: 120,
                      ),
                    ),
                    Container(
                      width: 120,
                      child: Text(
                        'Usuario',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50.0),
                Padding(
                  padding: EdgeInsets.only(
                      right: 15.0), // Agregar espacio a la derecha
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 6.0,
                            backgroundColor: Colors.white,
                          ),
                          SizedBox(
                              width:
                                  8.0), // Espacio entre el círculo y el texto
                          Text(
                            'Atlántida',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.0),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 6.0,
                            backgroundColor: Colors.white,
                          ),
                          SizedBox(
                              width:
                                  8.0), // Espacio entre el círculo y el texto
                          Text(
                            'FICOHSA',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.0),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 6.0,
                            backgroundColor: Colors.white,
                          ),
                          SizedBox(
                              width:
                                  8.0), // Espacio entre el círculo y el texto
                          Text(
                            'BAC',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.0),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}
