import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart';

class Speechtotext extends StatefulWidget {
  const Speechtotext({super.key});

  @override
  State<Speechtotext> createState() => _SpeechtotextState();
}

class _SpeechtotextState extends State<Speechtotext> {
  bool startRecord = false;
  final SpeechToText speech = SpeechToText();
  bool isAvailable = false;
  var text = 'hold and speack';

  @override
  void initState() {
    make();
    // TODO: implement initState
    super.initState();
  }
  make()async{
    isAvailable=await speech.initialize();
    setState(() {
      
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('speech To Text'),
        backgroundColor: Colors.amber[50],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(fontSize: 20),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(padding: const EdgeInsets.only(bottom: 80),
      child: AvatarGlow(
        animate: startRecord,
        glowColor: Colors.orange,
        child: GestureDetector(
          onTapDown: (value){
            setState(() {
              startRecord=true;
            });
            if(isAvailable){
              speech.listen(
                onResult: (value){
                  text=value.recognizedWords;
                }
              );

            }
          },
          onTapUp: (value){
            setState(() {
              startRecord=false;
            });
            speech.stop();
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.amberAccent[100],
              shape: BoxShape.circle
            ),
            child: Padding(padding: const EdgeInsets.all(10),
            child: Icon(startRecord?Icons.mic:Icons.mic_none,color: Colors.black,),),
          ),
        ),
      ),),
    );
  }
}
