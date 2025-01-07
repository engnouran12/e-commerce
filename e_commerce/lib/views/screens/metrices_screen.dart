import 'package:ecommerce_insights/models/order_model.dart';
import 'package:flutter/material.dart';

class MetricsScreen extends StatelessWidget {
  final List<Order> orders;

  const MetricsScreen({super.key, required this.orders});

  @override
  Widget build(BuildContext context) {
    int totalOrders = orders.length;
    double averagePrice = orders.isNotEmpty
        ? orders.map((order) => order.price).reduce((a, b) => a + b) /
            totalOrders
        : 0.0;
    int returnedOrders = orders
        .where((order) => order.status.toUpperCase() == "RETURNED")
        .length;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Metrics Screen"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Total Orders Card
              _buildMetricCard(
                context,
                icon: Icons.shopping_cart,
                label: "Total Orders",
                value: totalOrders.toString(),
                color: Colors.blue,
              ),
              const SizedBox(height: 16),

              // Average Order Price Card
              _buildMetricCard(
                context,
                icon: Icons.attach_money,
                label: "Average Order Price",
                value: "\$${averagePrice.toStringAsFixed(2)}",
                color: Colors.green,
              ),
              const SizedBox(height: 16),

              // Total Returned Orders Card
              _buildMetricCard(
                context,
                icon: Icons.undo,
                label: "Total Returned Orders",
                value: returnedOrders.toString(),
                color: Colors.red,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to build each metric card
  Widget _buildMetricCard(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String value,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 40,
            color: color,
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
