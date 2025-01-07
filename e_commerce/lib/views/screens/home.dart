import 'dart:convert';

import 'package:ecommerce_insights/models/order_model.dart';
import 'package:ecommerce_insights/views/screens/graph_screen.dart';
import 'package:ecommerce_insights/views/screens/metrices_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Order> orders = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadOrders(); // Load orders as soon as the HomeScreen is initialized
  }

  // Function to load orders from local JSON
  Future<void> _loadOrders() async {
    try {
      final String response =
          await rootBundle.loadString('assets/json/orders.json');
      final List<dynamic> jsonData = json.decode(response);

      setState(() {
        orders = jsonData.map((json) => Order.fromJson(json)).toList();
        isLoading = false; // Set loading to false once data is loaded
      });
    } catch (e) {
      print('Error loading JSON: $e');
      setState(() {
        isLoading = false; // Set loading to false even if there's an error
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('E-Commerce Insights'),
        backgroundColor: Colors.blueAccent,
      ),
      body: isLoading
          ? const Center(
              child:
                  CircularProgressIndicator()) // Show loading indicator while data is loading
          : Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => MetricsScreen(
                            orders:
                                orders), // Pass orders directly to MetricsScreen
                      ),
                    ),
                    child: const Text('Metrics'),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => GraphScreen(
                            orders:
                                orders), // Pass orders directly to GraphScreen
                      ),
                    ),
                    child: const Text('Graph'),
                  ),
                ],
              ),
            ),
    );
  }
}
