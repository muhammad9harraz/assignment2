import 'dart:developer';
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: flutterApp(),
  ));
}

class flutterApp extends StatefulWidget {
  const flutterApp({super.key});

  @override
  State<flutterApp> createState() => _flutterAppState();
}

class _flutterAppState extends State<flutterApp> {
  Map<String, String> fruitImageMap = {
    'apple': 'assets/images/apple.jpg',
    'banana': 'assets/images/banana.jpg',
    'cherry': 'assets/images/cherry.jpg',
    'durian': 'assets/images/durian.jpg',
    'eggplant': 'assets/images/eggplant.jpg',
  };
  String userInput = '';
  String selectedFruits = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter App'),
          backgroundColor: Colors.black,
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Fruits Available:'),
              for (var fruit in fruitImageMap.keys) Text(fruit),
              Padding(
                padding: const EdgeInsets.all(35),
                child: TextField(
                  onChanged: (value) {
                    userInput = value;
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter a fruit',
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (fruitImageMap.containsKey(userInput.toLowerCase())) {
                        selectedFruits = userInput.toLowerCase();
                      } else {
                        selectedFruits = '';
                      }
                      ;
                    });
                  },
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  child: Text('Display Choice')),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      final random = Random();
                      final randomIndex = random.nextInt(fruitImageMap.length);
                      selectedFruits = fruitImageMap.keys.toList()[randomIndex];
                    });
                  },
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  child: Text('I\'m Feeling Lucky')),
              if (selectedFruits.isNotEmpty)
                Image.asset(
                  fruitImageMap[selectedFruits]!,
                  height: 200,
                )
            ],
          ),
        ));
  }
}
