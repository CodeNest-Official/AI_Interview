import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class Texttospeech extends StatefulWidget {
  const Texttospeech({super.key});

  @override
  State<Texttospeech> createState() => _TexttospeechState();
}

class _TexttospeechState extends State<Texttospeech> {
  TextEditingController value = TextEditingController();
  FlutterTts flutterTts = FlutterTts();
  speak() async {
    await flutterTts.speak(value.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Text To speech  '),
        backgroundColor: Colors.amber[50],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          flutterTts.stop();
        },
        child: const Icon(Icons.stop_circle_outlined),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(30),
            child: Center(
              child: TextField(
                controller: value,
                decoration:const InputDecoration(
                    hintText: 'write your text here',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          ElevatedButton(
              onPressed: () {
                speak();
              },
              child:const Icon(Icons.volume_up))
        ],
      ),
    );
  }
}
