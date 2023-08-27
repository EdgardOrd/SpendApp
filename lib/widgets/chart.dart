import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:proyecto/services/firebase_service.dart';

class Chart extends StatefulWidget {
  const Chart({Key? key}) : super(key: key);

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  List<Map<String, dynamic>> _spends = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    List spends = await getSpends();
    List<Map<String, dynamic>>? filteredSpends = spends
        .where((spend) => spend['fecha'] != null && spend['tipo'] != null)
        .cast<Map<String, dynamic>>()
        .toList();

    setState(() {
      _spends = filteredSpends;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      child: SfCartesianChart(
        primaryXAxis: CategoryAxis(),
        series: <BarSeries<Map<String, dynamic>, String>>[
          BarSeries<Map<String, dynamic>, String>(
            color: Color.fromARGB(255, 47, 125, 121),
            dataSource: _spends,
            yValueMapper: (Map<String, dynamic> spend, _) => spend['monto'],
            xValueMapper: (Map<String, dynamic> spend, _) => spend['tipo'],
          )
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Chart(),
  ));
}
