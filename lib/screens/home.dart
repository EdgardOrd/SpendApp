import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:proyecto/services/firebase_service.dart';
import 'package:proyecto/widgets/info.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> day = [
    'Monday',
    "Tuesday",
    "Wednesday",
    "Thursday",
    'Friday',
    'Saturday',
    'Sunday',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(height: 340, child: Info()),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Historial de Transacciones',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 19,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'Registros',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            FutureBuilder<List>(
              future: getSpends(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return SliverToBoxAdapter(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return SliverToBoxAdapter(
                    child: Text('Error: ${snapshot.error}'),
                  );
                } else {
                  var spendsList = snapshot.data;
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        var item = spendsList?[index];
                        Timestamp timestamp = item?['fecha'];
                        DateTime fecha = timestamp.toDate();

                        return Dismissible(
                          onDismissed: (direction) async {
                            await deleteSpends(snapshot.data?[index]["uid"]);
                            setState(() {});
                          },
                          confirmDismiss: (direction) async {
                            bool result = false;
                            result = await showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text(
                                        '¿Está seguro de eliminar este ${snapshot.data?[index]['nombre']}?'),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            return Navigator.pop(
                                                context, false);
                                          },
                                          child: Text(
                                            "Cancelar",
                                            style: TextStyle(color: Colors.red),
                                          )),
                                      TextButton(
                                          onPressed: () {
                                            return Navigator.pop(context, true);
                                          },
                                          child: const Text("Si, estoy seguro"))
                                    ],
                                  );
                                });
                            return result;
                          },
                          background: Container(
                            color: Colors.red,
                            child: const Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                          ),
                          direction: DismissDirection.startToEnd,
                          key: Key(snapshot.data?[index]["uid"]),
                          child: ListTile(
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Image.asset('images/${item?['tipo']}.png',
                                  height: 40),
                            ),
                            title: Text(
                              item?['descrip'] ?? '',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            onTap: (() {
                              Navigator.pushNamed(context, '/edit', arguments: {
                                "descrip": snapshot.data?[index]['descrip'],
                                "monto":
                                    snapshot.data?[index]['monto'].toString(),
                                "fecha": fecha,
                                "tipo": snapshot.data?[index]['tipo'],
                                "nombre": snapshot.data?[index]['nombre'],
                                "uid": snapshot.data?[index]["uid"]
                              });
                            }),
                            subtitle: Text(
                              '${day[fecha.weekday - 1]}  ${fecha.year}-${fecha.day}-${fecha.month}',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  item?['nombre'] == 'Ingreso'
                                      ? Icons.add_circle
                                      : Icons.remove_circle,
                                  color: item?['nombre'] == 'Ingreso'
                                      ? Colors.green
                                      : Colors.red,
                                ),
                                SizedBox(
                                    width:
                                        10), // Espacio entre el icono y el texto
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text:
                                            ' ${item?['monto'].toString() ?? ''}',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 19,
                                          color: item?['nombre'] == 'Ingreso'
                                              ? Colors.green
                                              : Colors.red,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      childCount: spendsList?.length ?? 0,
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
