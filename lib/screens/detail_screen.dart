import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final Map<String, dynamic> breed;
  DetailScreen({required this.breed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(breed['name'])),
      ),
      body: Column(
        children: [
          Image.network(breed['image']?['url'] ?? '', height: 200, fit: BoxFit.cover),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Origin: ${breed['origin']}', style: TextStyle(fontSize: 18)),
                  Text('Intelligence: ${breed['intelligence']}', style: TextStyle(fontSize: 18)),
                  Text('Adaptability: ${breed['adaptability']}', style: TextStyle(fontSize: 18)),
                  Text('Life Span: ${breed['life_span']} years', style: TextStyle(fontSize: 18)),
                  Text('Description: ${breed['description']}', style: TextStyle(fontSize: 18),textAlign: TextAlign.justify),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
