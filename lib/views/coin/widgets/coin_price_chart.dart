import 'package:cripto_coins/core/utils/currency.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CoinPriceChart extends StatelessWidget {
  const CoinPriceChart({super.key, required this.chartData});

  final List chartData;

  List<FlSpot> buildChart(List data) {
    final List<FlSpot> spots = [];
    for (List item in data) {
      final double x = (item[0] / 1000).toDouble();
      final double y = item[1].toDouble();
      spots.add(FlSpot(x, y));
    }

    return spots;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AspectRatio(
          aspectRatio: 1.70,
          child: LineChart(
            LineChartData(
              lineBarsData: [
                LineChartBarData(
                  isCurved: false,
                  spots: buildChart(chartData),
                  barWidth: 3,
                ),
              ],
              lineTouchData: LineTouchData(
                touchTooltipData: LineTouchTooltipData(
                  getTooltipItems: (List<LineBarSpot> touchedSpots) {
                    return touchedSpots.map((spot) {
                      final date = DateTime.fromMillisecondsSinceEpoch(
                          (spot.x * 1000).toInt());
                      return LineTooltipItem(
                        '${DateFormat("dd/MM/yyyy HH:mm:ss").format(date)}\n'
                        ' ${Currency.toBRL(spot.y)}',
                        const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    }).toList();
                  },
                ),
              ),
              titlesData: FlTitlesData(show: false),
              borderData: FlBorderData(show: false),
            ),
          ),
        ),
      ],
    );
  }
}
