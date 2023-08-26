import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:proyecto/services/firebase_service.dart';

void main() {
  runApp(MyApp());
}

class SpendData {
  final String type;
  final double amount;

  SpendData(this.type, this.amount);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spend Chart',
      home: Statistics(),
    );
  }
}

class Statistics extends StatefulWidget {
  @override
  _StatisticsState createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Spend Chart'),
      ),
      body: FutureBuilder<List>(
        future: getSpends(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            List<SpendData> spendDataList = [];

            // Procesar los datos recibidos en el snapshot y crear la lista de SpendData

            return Center(
              child: SfCircularChart(
                series: <CircularSeries>[
                  DoughnutSeries<SpendData, String>(
                    dataSource: spendDataList,
                    xValueMapper: (SpendData data, _) => data.type,
                    yValueMapper: (SpendData data, _) => data.amount,
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
