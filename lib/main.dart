import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Sample data with color and size categories
  final List<Map<String, dynamic>> items = [
    {'color': 'Red', 'size': 'Big'},
    {'color': 'Red', 'size': 'Medium'},
    {'color': 'Red', 'size': 'Small'},
    {'color': 'Green', 'size': 'Big'},
    {'color': 'Green', 'size': 'Medium'},
    {'color': 'Green', 'size': 'Small'},
  ];

  // Random number generator
  final Random _random = Random();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Cherries Grouped by Color and Size'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: _buildGroupedView(),
          ),
        ),
      ),
    );
  }

  // Method to build a grouped view by color
  List<Widget> _buildGroupedView() {
    // Grouping the items by color
    Map<String, List<Map<String, dynamic>>> groupedItems = {};
    for (var item in items) {
      String color = item['color'];
      if (!groupedItems.containsKey(color)) {
        groupedItems[color] = [];
      }
      groupedItems[color]!.add(item);
    }

    // Creating widgets for each color group
    List<Widget> widgets = [];
    groupedItems.forEach((color, items) {
      // Randomize a value for each size category
      List<Widget> sizeWidgets = items.map((item) {
        int randomValue = _random.nextInt(100) + 1; // Generate random value between 1 and 100
        return Expanded(
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            color: Colors.grey[200],
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    '${item['size']} ($randomValue)',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList();

      widgets.add(
        Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                color,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey[700],
                ),
              ),
              SizedBox(height: 5),
              Row(
                children: sizeWidgets,
              ),
              SizedBox(height: 10),
              Divider(
                color: Colors.grey[400],
                thickness: 1,
              ),
            ],
          ),
        ),
      );
    });

    return widgets;
  }
}


