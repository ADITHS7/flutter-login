import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MyPieChart extends StatelessWidget {
  const MyPieChart({super.key});

  @override
  Widget build(BuildContext context) {
    return PieChart(
        swapAnimationDuration: const Duration(milliseconds: 750),
        swapAnimationCurve: Curves.easeInOutQuint,
        PieChartData(sections: [
          PieChartSectionData(
            value: 200,
            color: Colors.blue,
          ),
          PieChartSectionData(
            value: 20,
            color: Colors.green,
          ),
          PieChartSectionData(
            value: 200,
            color: Colors.yellow,
          ),
          PieChartSectionData(
            value: 200,
            color: Colors.red,
          ),
          PieChartSectionData(
            value: 100,
            color: Colors.orange,
          ),
        ]));
  }
}
