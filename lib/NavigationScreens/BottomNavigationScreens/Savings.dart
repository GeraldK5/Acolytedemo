import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class Savings extends StatefulWidget {
  const Savings({super.key});

  @override
  State<Savings> createState() => _SavingsState();
}

class _SavingsState extends State<Savings> {
  Map<String, double> dataMap = {
    "Individual Savings": 60000,
    "Rewards": 30000,
    "Group Savings": 200000,
  };
  Map<String, String> labels = {
    "Individual Savings": "60000",
    "Rewards": "30000",
    "Group Savings": "200000",
  };
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
      child: Column(
        children: [
          PieChart(
            dataMap: dataMap,
            animationDuration: Duration(milliseconds: 800),
            chartLegendSpacing: 48,
            chartRadius: MediaQuery.of(context).size.width / 2,
            colorList: [Colors.red, Colors.blue, Colors.purple],
            initialAngleInDegree: 0,
            chartType: ChartType.ring,
            ringStrokeWidth: 40,
            legendOptions: LegendOptions(
                showLegendsInRow: false,
                legendPosition: LegendPosition.bottom,
                showLegends: true,
                legendShape: BoxShape.circle,
                legendTextStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                legendLabels: labels),
            chartValuesOptions: ChartValuesOptions(
              showChartValueBackground: false,
              showChartValues: false,
              showChartValuesInPercentage: false,
              showChartValuesOutside: false,
            ),
          )
        ],
      ),
    );
  }
}
