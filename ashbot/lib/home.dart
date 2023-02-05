import 'package:ashbot/widgets/chat_bubble.dart';
import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:speech_to_text/speech_to_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    SpeechToText speechToText = SpeechToText();
    String text = "Text-to-Speech goes here";
    bool isListening= false;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("AshBot"),
        centerTitle: true,
      ),


      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(text, style: TextStyle(fontSize: 25),),
            ),
      
      
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(15)
                ),

                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      chatBubble(),
                      chatBubble(),
                      chatBubble()
                    ],
                  ),
                ),
            
              ),
            )
          ],
        ),
      ),



      floatingActionButton: AvatarGlow(
        endRadius: 75,
        repeat: true,
        repeatPauseDuration: const Duration(milliseconds: 10),
        duration: const Duration(milliseconds: 2000),
        glowColor: Colors.blue,
        animate: isListening,
        showTwoGlows: true,
        child: GestureDetector(
          onTapDown: (details) async{

            if(!isListening){
              var available = await speechToText.initialize();
              if(available){
                setState(() {
                  isListening = true;
                  speechToText.listen(
                    onResult: (result) {
                      text = result.recognizedWords;
                    },
                  );
                });
              }
            }
          },
          onTapUp: (details) {
            setState(() {
              isListening = false;
            });
            speechToText.stop();
          },
          child: CircleAvatar(
            maxRadius: 30,
            backgroundColor: Colors.blue,
            child: Icon(isListening? Icons.mic:Icons.mic_none_rounded),
          ),
        )
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      



    );
  }
}