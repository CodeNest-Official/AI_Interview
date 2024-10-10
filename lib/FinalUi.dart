// ignore_for_file: file_names

import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:speech_to_text/speech_to_text.dart';

class Finalui extends StatefulWidget {
  const Finalui({super.key});

  @override
  State<Finalui> createState() => _FinaluiState();
}

class _FinaluiState extends State<Finalui> {
  final TextEditingController _controller = TextEditingController();
  late GenerativeModel _model;
  late ChatSession _chatSession;
  bool _isMicPressed = false;
  bool _isLoading = false;
  List<String> messages = [];
  List<bool>? _isPlayingList = [];
  bool startRecord = false;
  final SpeechToText speech = SpeechToText();
  bool isAvailable = false;
  var text = 'hold and speack';

  make() async {
    isAvailable = await speech.initialize();
    setState(() {});
  }

  @override
  void initState() {
    make();

    super.initState();
    _model = GenerativeModel(
      model: 'gemini-pro',
      apiKey:
          'AIzaSyCl0UzxP4AdQzQdsPg1ohebzoH7EzQ712A', // Use environment variables or a secure method for the API key.
    );
    _chatSession = _model.startChat();
    _isPlayingList = List.generate(messages.length, (index) => false);
  }

  // Method to toggle the mic button
  void _toggleMicButton() {
    setState(() {
      _isMicPressed = !_isMicPressed;
    });
  }

  // Method to stop all TTS
  void stopAllPlaying() {
    setState(() {
      _isPlayingList = List.generate(messages.length, (index) => false);
    });
  }

  // Method to send the message and get AI response
  Future<void> _sendMessage() async {
    if (_controller.text.isEmpty || _isLoading) return;

    setState(() {
      messages.add('You: ${_controller.text}');
      _isLoading = true;
    });

    try {
      var prompt = _controller.text;

      // Generate content using the user input as the prompt
      final response = await _model.generateContent([Content.text(prompt)]);

      setState(() {
        messages.add('${response.text}');
        _isPlayingList = List.generate(messages.length, (index) => false);

        _controller.clear();
      });
    } catch (e) {
      setState(() {
        messages.add('Error: ${e.toString()}');
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(67),
          child: _buildAppBar(),
        ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          _buildMessageList(), // Your scrollable message list
                          // const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                  // _buildBottomSection(), // Fixed bottom section (text field and mic button)
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: _buildBottomSection(),
      ),
    );
  }

  Widget _buildAppBar() {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.09),
            offset: Offset(0, 4),
            blurRadius: 10,
            spreadRadius: 0,
          ),
        ],
      ),
      child: AppBar(
        leadingWidth: 75,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_outlined)),
        toolbarHeight: 67,
        titleSpacing: -15,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            'AI Interview',
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
    );
  }

  Widget _buildMessageList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: messages.length,
      itemBuilder: (context, index) {
        bool isUserMessage = messages[index].startsWith('You:');
        return Padding(
          padding: isUserMessage
              ? const EdgeInsets.only(left: 60)
              : const EdgeInsets.only(right: 60),
          child: Align(
            alignment:
                isUserMessage ? Alignment.centerRight : Alignment.centerLeft,
            child: isUserMessage
                ? _buildUserMessage(messages[index])
                : _buildAiMessage(messages[index], index),
          ),
        );
      },
    );
  }

  Widget _buildUserMessage(String message) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: _boxDecorationUser(),
      child: Container(
        margin: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(255, 255, 255, 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 5),
              Text(
                message.substring(5),
                style: _textStyle(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  FlutterTts flutterTts = FlutterTts();

  Widget _buildAiMessage(String message, int index) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage('assets/img/ai.png'),
            backgroundColor: Color(0xffd9d9d9),
          ),
        ),
        const SizedBox(width: 15),
        Flexible(
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            //padding: const EdgeInsets.all(10),
            decoration: _boxDecorationAi(),
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.95,
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                  child: Text(
                    message,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const Divider(
                  color: Color(0xff8a8a8a),
                  thickness: 0.54,
                ),
                Padding(
                  padding: const EdgeInsets.all(1),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 30.0,
                          height: 30.0,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromRGBO(30, 227, 255, 0.7),
                                Color.fromRGBO(31, 255, 154, 0.6),
                              ],
                            ),
                            shape: BoxShape.circle,
                          ),
                        ),
                        IconButton(
                          onPressed: () async {
                            if (_isPlayingList![index]) {
                              await flutterTts.stop();
                              setState(() {
                                _isPlayingList![index] =
                                    false; // Stop the message at index
                              });
                            } else {
                              stopAllPlaying();
                              setState(() {
                                _isPlayingList![index] = true;
                              });
                              await flutterTts.speak(message);
                              // Ensure speak is async if flutterTts is asynchronous
                            }
                          },
                          icon: (_isPlayingList![index])
                              ? const Icon(
                                  Icons.volume_off,
                                  size: 20,
                                  color: Colors.black,
                                )
                              : SvgPicture.asset(
                                  'assets/img/Vector.svg',
                                  height: 15,
                                  width: 15,
                                ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  TextStyle _textStyle({FontWeight fontWeight = FontWeight.w400}) {
    return GoogleFonts.poppins(
      fontSize: 12,
      fontWeight: fontWeight,
      color: const Color(0xff363636),
    );
  }

  BoxDecoration _boxDecorationUser() {
    return BoxDecoration(
      gradient: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color.fromRGBO(30, 227, 255, 0.296),
          Color.fromRGBO(31, 255, 154, 0.4),
        ],
      ),
      borderRadius: BorderRadius.circular(10),
    );
  }

  BoxDecoration _boxDecorationAi() {
    return BoxDecoration(
      gradient: const LinearGradient(
        colors: [
          Color.fromRGBO(31, 255, 154, 0.21),
          Color.fromRGBO(30, 227, 255, 0.21),
        ],
      ),
      borderRadius: BorderRadius.circular(11),
    );
  }

  Widget _inputTextField() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    decoration: _boxDecorationUser(),
                    child: Container(
                      margin: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(255, 255, 255, 1),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                                color: Color.fromRGBO(208, 225, 255, 0.29),
                                offset: Offset(0, 4),
                                blurRadius: 4,
                                spreadRadius: 4), //rgba(208, 225, 255, 0.29)
                          ]),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        controller: _controller,
                        decoration: InputDecoration(
                          
                          suffixIcon: (_isLoading)
                              ? const SpinKitWave(
                                  type: SpinKitWaveType.end,
                                  color: Colors
                                      .blue, // Change to your desired color
                                  size: 10.0, // Adjust the size as needed
                                )
                              : IconButton(
                                  onPressed: _sendMessage,
                                  icon: const Icon(
                                    Icons.send,
                                    color: Color(0xff1568ff),
                                  ),
                                ),
                          filled: true,
                          fillColor: const Color(0xffffffff),
                          hintText: 'Type your message...',
                          hintStyle: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xffbebebe),
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                // Mic button with toggle functionality
                Stack(
                  children: [
                    Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromRGBO(30, 227, 255, 0.3),
                            Color.fromRGBO(31, 255, 154, 0.3),
                          ],
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                    Positioned(
                      top: 3,
                      left: 2,
                      child: IconButton(
                        onPressed: _toggleMicButton, // Use the toggle method
                        icon: Icon(
                          _isMicPressed
                              ? Icons.mic_off_outlined
                              : Icons.mic_none, // Change icon based on state
                        ),
                        color: Colors.black,
                        iconSize: 30,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            // Adjust padding based on keyboard visibility
            SizedBox(
              height:
                  MediaQuery.of(context).viewInsets.bottom, // Correctly used
            ),
          ],
        ),
      ),
    );
  }

  // Larger mic button build method
  Widget _buildMicButton() {
    return Stack(
      children: [
        Container(
          width: 100.0,
          height: 100.0,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(30, 227, 255, 0.16),
                Color.fromRGBO(31, 255, 154, 0.16),
              ],
            ),
            shape: BoxShape.circle,
          ),
        ),
        Positioned(
          top: 1,
          bottom: 1,
          left: 6,
          child: Container(
            width: 88.0,
            height: 88.0,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(30, 227, 255, 0.4),
                  Color.fromRGBO(31, 255, 154, 0.4),
                ],
              ),
              shape: BoxShape.circle,
            ),
          ),
        ),
        Positioned(
          top: 2,
          bottom: 2,
          left: 15,
          child: Container(
            width: 68.0,
            height: 68.0,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(30, 227, 255, 0.7),
                  Color.fromRGBO(31, 255, 154, 0.6),
                ],
              ),
              shape: BoxShape.circle,
            ),
          ),
        ),
        Positioned(
          top: 15,
          bottom: 15,
          left: 22,
          child: AvatarGlow(
            animate: startRecord,
            glowRadiusFactor: 0.75,
            glowShape: BoxShape.circle, // Keep the circular shape
            glowColor:const Color.fromRGBO(30, 227, 255, 0.7),
            child: GestureDetector(
              onTapDown: (value) {
                setState(() {
                  startRecord = true;
                });
                if (isAvailable) {
                  speech.listen(onResult: (value) {
                    setState(() {
                      _controller.text = value.recognizedWords;
                    });
                  });
                }
              },
              onTapUp: (value) {
                setState(() {
                  startRecord = false;
                });
                speech.stop();
              },
              child: IconButton(
                onPressed: () {}, // Allow closing the mic UI when pressed again
                icon: const Icon(Icons.mic_none),
                color: Colors.black,
                iconSize: 40,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBottomSection() {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        width: 400,
        height: (!_isMicPressed) ? 90 : 280,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          color: (!_isMicPressed) ? Colors.transparent : const Color(0xFFFFFFFF),
          boxShadow: [
            if (_isMicPressed)
              const BoxShadow(
                color: Color.fromRGBO(28, 108, 255, 0.35),
                offset: Offset(0, 4),
                blurRadius: 20,
                spreadRadius: 0,
              ),
          ],
        ),
        child: Column(
          children: [
            if (_isMicPressed)
              SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    _buildMicButton(),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Tap to Speak',
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff000000),
                      ),
                    ),
                  ],
                ),
              ),
            const Spacer(),
            _inputTextField(),
          ],
        ),
      ),
    );
  }
}
