# e-commerce
This Flutter application provides insights into e-commerce orders, including metrics like total orders, average order price, and total number of returned orders. It also displays a graphical representation of order trends over time.

Features

Metrics Screen Displays numeric insights about the orders, including: Total order count: The total number of orders in the dataset. Average order price: The average price of all orders. Total number of returned orders: The count of orders marked as "returned".
Graph Screen Displays a graph with the following information: Y-axis: Number of orders. X-axis: Time (order dates).
Follow these steps to get the project up and running on your local machine.

Prerequisites Flutter SDK: Make sure you have Flutter installed. If not, follow the installation guide here: Install Flutter. Dart SDK: Dart comes bundled with Flutter. Code Editor: Use any text editor like VS Code or Android Studio.

Steps to Run the App

Clone the repository: Download or clone the repository to your local machine. Navigate to the project directory: After cloning, go into the project directory:

Libraries/Packages Used

This project utilizes the following libraries:

fl_chart: ^0.69.0: A Flutter package for rendering beautiful charts. intl: ^0.17.0: Provides internationalization and date formatting support. flutter/material.dart: Core Flutter framework used for building UI.

#How It Works

Order Data: The order data is read from a local JSON file (assets/json/orders.json), and it's parsed using the Order model. Metrics Screen: Aggregates the order data to display insights such as total orders, average order price, and returned orders. 
Graph Screen: Visualizes the order data over time using the fl_chart library to create bar charts based on the order dates. Metrics Screen: Aggregates the order data to display insights such as total orders, average order price, and returned orders. Graph Screen: Visualizes the order data over time using the fl_chart library to create bar charts based on the order dates.
