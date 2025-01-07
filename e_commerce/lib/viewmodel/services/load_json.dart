import 'dart:convert';

import 'package:ecommerce_insights/models/order_model.dart';
import 'package:flutter/services.dart' show rootBundle;

Future<List<Order>> loadOrders() async {
  try {
    // Load JSON file as a string
    final String response = await rootBundle.loadString('assets/json/orders.json');
    
    // Decode JSON string into a List of dynamic
    final List<dynamic> jsonData = json.decode(response);

    // Convert each JSON entry into an Order object
    return jsonData.map((json) => Order.fromJson(json)).toList();
  } catch (e) {
    print('Error loading JSON: $e');
    return [];
  }
  // try {
  //   // Load the JSON file as a String
  //   final String response =
  //       await rootBundle.loadString('assets/json/orders.json');
  //   // Decode the JSON string into a Map
  //   return json.decode(response);
  // } catch (e) {
  //   print('Error loading JSON: $e');
  //   return [];
  // }
}
