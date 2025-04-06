import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SpeechScreen(),
    );
  }
}

class SpeechScreen extends StatefulWidget {
  @override
  _SpeechScreenState createState() => _SpeechScreenState();
}

class _SpeechScreenState extends State<SpeechScreen> {
  List<String> statements = [
    "Person 1: What colour dress are you planning to wear tomorrow",
    "Person 2: Maybe pink what about you",
    "Person 1: Maybe blue",
  ];

  List<String> displayedTexts = [];
  String currentText = "";
  bool isTyping = false;

  void startTyping() {
    if (!isTyping) {
      setState(() {
        isTyping = true;
        displayedTexts.clear();
      });

      int statementIndex = 0;

      void typeNextStatement() {
        if (statementIndex < statements.length) {
          String fullText = statements[statementIndex];

          // Split into "Person X:" (fast) and remaining text (slow)
          List<String> parts = fullText.split(": ");
          String prefix = parts[0] + ": ";
          String remainingText = parts.length > 1 ? parts[1] : "";

          setState(() {
            currentText = prefix; // Instantly display the "Person X:"
          });

          int charIndex = 0;

          Timer.periodic(Duration(milliseconds: 100), (timer) {
            if (charIndex < remainingText.length) {
              setState(() {
                currentText += remainingText[charIndex];
                charIndex++;
              });
            } else {
              timer.cancel();
              setState(() {
                displayedTexts.add(currentText);
                currentText = "";
                statementIndex++;
              });

              Future.delayed(Duration(milliseconds: 300), typeNextStatement);
            }
          });
        } else {
          setState(() {
            isTyping = false;
          });
        }
      }

      typeNextStatement();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Faed App")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.mic, size: 50, color: Colors.blue),
              onPressed: startTyping,
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 20),
                children: [
                  for (String text in displayedTexts)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        text,
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  if (currentText.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        currentText,
                        style: TextStyle(fontSize: 18, color: Colors.blue),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}