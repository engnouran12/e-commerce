// import 'package:flutter/material.dart';
// import 'package:fl_chart/fl_chart.dart';
// import 'package:intl/intl.dart';

// import '../../models/order_model.dart';

// class GraphScreen extends StatelessWidget {
//   final List<Order> orders;

//   const GraphScreen({super.key, required this.orders});

//   @override
//   Widget build(BuildContext context) {
//     // Group orders by month (e.g., "2023-01")
//     Map<String, int> groupedOrders = {};

//     for (var order in orders) {
//       String month = DateFormat('yyyy-MM').format(order.registered);
//       groupedOrders[month] = (groupedOrders[month] ?? 0) + 1;
//     }

//     // Prepare data for the chart
//     List<BarChartGroupData> barChartData = [];
//     List<String> labels = groupedOrders.keys.toList();
//     int index = 0;

//     for (var key in groupedOrders.keys) {
//       barChartData.add(
//         BarChartGroupData(
//           x: index,
//           barRods: [
//             BarChartRodData(
//               toY: groupedOrders[key]!.toDouble(),
//               color: Colors.blue,
//               width: 16,
//             ),
//           ],
//         ),
//       );
//       index++;
//     }

//     return Scaffold(
//       appBar: AppBar(title: const Text("Graph Screen")),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             Expanded(
//               child: BarChart(
//                 BarChartData(
//                   titlesData: FlTitlesData(
//                     leftTitles: AxisTitles(
//                       sideTitles: SideTitles(
//                         showTitles: true,
//                         reservedSize: 40,
//                         getTitlesWidget: (value, meta) {
//                           return Text(
//                             value.toInt().toString(),
//                             style: const TextStyle(fontSize: 12),
//                           );
//                         },
//                       ),
//                     ),
//                    bottomTitles: AxisTitles(
//   sideTitles: SideTitles(
//     showTitles: true,
//     reservedSize: 40,
//     getTitlesWidget: (value, meta) {
//       int index = value.toInt();
//       if (index >= 0 && index < labels.length) {
//         return Transform.rotate(
//           angle: -0.5, // زاوية الميل (بالراديان، -0.5 تعني الميل لليسار)
//           child: Text(
//             _formatMonthLabel(labels[index]),
//             style: const TextStyle(
//               fontSize: 10,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         );
//       }
//       return const SizedBox();
//     },
//   ),
// ),

                  



                  
//                     rightTitles: const AxisTitles(
//                       sideTitles: SideTitles(showTitles: false),
//                     ),
//                     topTitles: const AxisTitles(
//                       sideTitles: SideTitles(showTitles: false),
//                     ),
//                   ),
//                   barGroups: barChartData,
//                   borderData: FlBorderData(show: true),
//                   gridData: const FlGridData(show: true),
//                   alignment: BarChartAlignment.spaceBetween,
//                   maxY: groupedOrders.values
//                       .reduce((a, b) => a > b ? a : b)
//                       .toDouble(),
//                   minY: 0,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 8),
//             const Text(
//               'Orders by Month',
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // Helper to format month labels (e.g., "2023-01" -> "Jan 2023")
//   String _formatMonthLabel(String monthKey) {
//     DateTime parsedDate = DateFormat('yyyy-MM').parse(monthKey);
//     return DateFormat('MMM yyyy').format(parsedDate); // "Jan 2023"
//   }
// }



import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';

import '../../models/order_model.dart';

class GraphScreen extends StatelessWidget {
  final List<Order> orders;

  const GraphScreen({super.key, required this.orders});

  @override
  Widget build(BuildContext context) {
    // Step 1: Find the earliest and latest date in the dataset
    DateTime? earliestDate;
    DateTime? latestDate;

    for (var order in orders) {
      DateTime orderDate = order.registered;
      if (earliestDate == null || orderDate.isBefore(earliestDate)) {
        earliestDate = orderDate;
      }
      if (latestDate == null || orderDate.isAfter(latestDate)) {
        latestDate = orderDate;
      }
    }

    // If no orders are found, return an empty chart
    if (earliestDate == null || latestDate == null) {
      return Scaffold(
        appBar: AppBar(title: const Text("Graph Screen")),
        body: const Center(child: Text("No orders found")),
      );
    }

    // Step 2: Group orders by month (e.g., "2023-01")
    Map<String, int> groupedOrders = {};

    for (var order in orders) {
      String month = DateFormat('yyyy-MM').format(order.registered);
      groupedOrders[month] = (groupedOrders[month] ?? 0) + 1;
    }

    // Step 3: Prepare data for the chart
    List<BarChartGroupData> barChartData = [];
    List<String> labels = groupedOrders.keys.toList();

    // Sort the labels and chart data based on the date
    labels.sort((a, b) => DateFormat('yyyy-MM').parse(a).compareTo(DateFormat('yyyy-MM').parse(b)));

    int index = 0;
    for (var key in labels) {
      barChartData.add(
        BarChartGroupData(
          x: index,
          barRods: [
            BarChartRodData(
              toY: groupedOrders[key]!.toDouble(),
              color: Colors.blue,
              width: 16,
            ),
          ],
        ),
      );
      index++;
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Graph Screen")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: BarChart(
                BarChartData(
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 40,
                        getTitlesWidget: (value, meta) {
                          return Text(
                            value.toInt().toString(),
                            style: const TextStyle(fontSize: 12),
                          );
                        },
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 40,
                        getTitlesWidget: (value, meta) {
                          int index = value.toInt();
                          if (index >= 0 && index < labels.length) {
                            return Transform.rotate(
                              angle: -0.5, // Rotate label slightly to prevent overlap
                              child: Text(
                                _formatMonthLabel(labels[index]),
                                style: const TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            );
                          }
                          return const SizedBox();
                        },
                      ),
                    ),
                    rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),
                  barGroups: barChartData,
                  borderData: FlBorderData(show: true),
                  gridData: const FlGridData(show: true),
                  alignment: BarChartAlignment.spaceBetween,
                  maxY: groupedOrders.values
                      .reduce((a, b) => a > b ? a : b)
                      .toDouble(),
                  minY: 0,
                ),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Orders by Month',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }

  // Helper to format month labels (e.g., "2023-01" -> "Jan 2023")
  String _formatMonthLabel(String monthKey) {
    DateTime parsedDate = DateFormat('yyyy-MM').parse(monthKey);
    return DateFormat('MMM yyyy').format(parsedDate); // "Jan 2023"
  }
}
