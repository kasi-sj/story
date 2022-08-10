// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

import 'story_brain.dart';

//TODO: Step 15 - Run the app and see if you can see the screen update with the first story. Delete this TODO if it looks as you expected.

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String story = StoryBrain().getStory();
  String choice1 = StoryBrain().getChoice1();
  String choice2 = StoryBrain().getChoice2();
  bool visibility = true;
  List<Widget> mylist = [];

  nextquestion(int no) {
    setState(() {
      StoryBrain().nextstory(no);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: const Text('Story')),
          body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('images/background.png'))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Container(
                    child: Center(
                        child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        StoryBrain().getStory(),
                        style: const TextStyle(color: Colors.white),
                      ),
                    )),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: TextButton(
                          onPressed: () {
                            nextquestion(1);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Container(
                              color: const Color.fromARGB(255, 9, 255, 0),
                              child: Center(
                                  child: Text(
                                StoryBrain().getChoice1(),
                              )),
                            ),
                          ),
                        )),
                        Visibility(
                          visible: StoryBrain().Visibility(),
                          child: Expanded(
                              child: TextButton(
                            onPressed: () {
                              nextquestion(2);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Container(
                                color: const Color.fromARGB(255, 255, 0, 0),
                                child: Center(
                                    child: Text(
                                  StoryBrain().getChoice2(),
                                )),
                              ),
                            ),
                          )),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(50.0),
                            child: Container(
                              child: Text(
                                '',
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
