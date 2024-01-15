// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, file_names, avoid_print, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:pedometer/pedometer.dart';

import '../DietPlan/Bullet.dart';

class ChartWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 200,
        color: Colors.white30,
        padding: const EdgeInsets.all(16),
        child: LineChart(
          LineChartData(
            gridData: const FlGridData(show: false),
            titlesData: const FlTitlesData(show: false),
            borderData: FlBorderData(show: true),
            minX: 0,
            maxX: 10,
            minY: 0,
            maxY: 1000,
            lineBarsData: [
              LineChartBarData(
                spots: [
                  const FlSpot(0, 300),
                  const FlSpot(1, 450),
                  const FlSpot(2, 600),
                  const FlSpot(3, 800),
                  const FlSpot(4, 600),
                  const FlSpot(5, 750),
                  const FlSpot(6, 900),
                  const FlSpot(7, 700),
                  const FlSpot(8, 850),
                  const FlSpot(9, 1000),
                ],
                isCurved: true,
                color: Colors.orange,
                dotData: const FlDotData(show: false),
                belowBarData: BarAreaData(show: false),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PedometerChart extends StatefulWidget {
  @override
  _PedometerChartState createState() => _PedometerChartState();
}

class _PedometerChartState extends State<PedometerChart> {
  late Stream<StepCount> _stepCountStream;
  String _steps = '0';  // Initialize with '0'

  @override
  void initState() {
    super.initState();
    initPlatformState();
    _steps = '0';    // Ensure _steps is set to '0' during initialization
  }

  void onStepCount(StepCount event) {
    print(event);
    setState(() {
      _steps = event.steps.toString();
    });
  }

  void onStepCountError(error) {
    print('onStepCountError: $error');
    setState(() {
      _steps = 'Step Count not available';
    });
  }

  void initPlatformState() {
    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream.listen(onStepCount).onError(onStepCountError);

    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recommended\nWorkout'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
           Row(
             children: [
               const SizedBox(width: 30),
               MyBullet(),
               const SizedBox(width: 30),
                  const Text('Walking Pedometer',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
              ],
            ),
            SizedBox(height: 40),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 MyBullet(),
                 const SizedBox(width: 30),
                 const Text(
                   'Steps Taken',
                   style: TextStyle(fontSize: 22),
                 ),
               ],
             ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(width: 30),
                 Text(
                  _steps,
                  style: const TextStyle(fontSize: 45),
                ),
              ],
            ),
            const SizedBox(height: 40),
            ChartWidget(),
          ],
        ),
      ),
    );
  }
}

