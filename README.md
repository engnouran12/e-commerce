# E-Commerce Order Insights - Flutter Application

## Overview

The **E-Commerce Order Insights** app is a Flutter-based mobile application that provides valuable insights into e-commerce order data. The app offers key metrics such as:
- **Total orders count**.
- **Average order price**.
- **Number of returned orders**.

Additionally, it presents a **graphical representation** of order trends over time, allowing users to analyze order data visually. This app is designed to provide a simple, user-friendly interface that can be easily understood by non-technical users.

## Features

### 1. Metrics Screen

Displays numeric insights about the orders, including:
- **Total Order Count**: The total number of orders in the dataset.
- **Average Order Price**: The average price of all orders.
- **Total Number of Returned Orders**: The number of orders marked as "returned."

### 2. Graph Screen

Displays a bar chart representing the following:
- **Y-Axis**: The number of orders.
- **X-Axis**: The time (order dates).

The **Graph Screen** uses a bar chart to visualize how orders fluctuate over time, providing useful insights into order trends.

Graph Screen - Monthly Order Trends
The Graph Screen displays a bar chart visualizing order trends over time. It groups orders by month and shows the number of orders per month:

Data Grouping: Orders are grouped by month using the format "YYYY-MM" (e.g., "2023-01"). Each month’s total order count is calculated.
Chart Representation: The chart plots the number of orders (Y-axis) against the months (X-axis), with bars representing the total orders for each month.
Date Handling: The earliest and latest order dates are determined, ensuring data is displayed for the relevant period.
Month Labels: Labels on the X-axis are formatted as "Jan 2023", providing clear and readable month names.
This screen helps visualize order trends, making it easier to analyze how the orders fluctuate monthly.

## Prerequisites

Before running the app, make sure you have the following tools installed:

- **Flutter SDK**: Ensure you have Flutter installed on your machine. Follow the [installation guide here](https://flutter.dev/docs/get-started/install).
- **Dart SDK**: Dart comes bundled with Flutter.
- **Code Editor**: Use a text editor such as **VS Code** or **Android Studio** for Flutter development.

## Steps to Run the App

1. **Clone the Repository**  
   Clone or download the repository to your local machine.

2. **Navigate to the Project Directory**  
   After cloning the repository, navigate to the project directory.

3. **Install Dependencies**  
   Run the necessary command to install the required packages (using your IDE or terminal).

4. **Run the Application**  
   Launch the app on an emulator or physical device.

## Libraries/Packages Used

This project utilizes the following libraries to enhance functionality:

- **[fl_chart: ^0.69.0](https://pub.dev/packages/fl_chart)**: A Flutter package for rendering beautiful charts (specifically, bar charts for visualizing order data).
- **[intl: ^0.17.0](https://pub.dev/packages/intl)**: Provides internationalization and date formatting support.
- **[flutter/material.dart](https://flutter.dev/docs/development/ui/widgets/material)**: The core Flutter framework used for building the user interface.

## How It Works

### Data Handling

- **Order Data**: The order data is read from a **local JSON file** (`assets/json/orders.json`). This approach simplifies cross-platform compatibility, including support for web platforms, since accessing and parsing JSON files is straightforward in Flutter. JSON as an asset is used to keep the implementation simple, and it makes data handling consistent across different platforms (iOS, Android, Web).

- **Metrics Screen**: Aggregates the order data to calculate and display key insights:
  - Total number of orders
  - Average order price
  - Number of returned orders
  
- **Graph Screen**: Visualizes the order data over time using a bar chart created by the `fl_chart` package. The chart plots order dates on the X-axis and the number of orders on the Y-axis.

## Assumptions Made During Development

- The order data is stored locally in a JSON file for simplicity. This method was chosen to make it easier to work with across different platforms (especially Flutter web) without the need for additional setup such as a server or database. In a production scenario, this data would typically be fetched from a backend API or database.
- The app assumes that the user has access to a stable internet connection for future potential integrations.
- The UI design is kept simple and user-friendly, focusing on easy accessibility for non-technical users.


