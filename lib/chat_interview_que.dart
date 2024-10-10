// // ignore_for_file: file_names

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:google_generative_ai/google_generative_ai.dart';

// class ChatInterviewQue extends StatefulWidget {
//   const ChatInterviewQue({super.key});

//   @override
//   State<ChatInterviewQue> createState() => _ChatInterviewQueState();
// }

// class _ChatInterviewQueState extends State<ChatInterviewQue> {
//    final TextEditingController _controller = TextEditingController();
//    late final GenerativeModel _model;
//   late final ChatSession _chatSession;
//   @override
//   void initState(){
//     super.initState();
//     _model=GenerativeModel(model: 'gemini-pro', apiKey: 'AIzaSyCl0UzxP4AdQzQdsPg1ohebzoH7EzQ712A');
//     _chatSession=_model.startChat();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar:PreferredSize(
//         preferredSize: const Size.fromHeight(67),
//         child: Container(
//           decoration: const BoxDecoration(
//             boxShadow: [
//               BoxShadow(
//                 color: Color.fromRGBO(0, 0, 0, 0.09),
//                 offset: Offset(0, 4),
//                 blurRadius: 10,
//                 spreadRadius: 0,
//               ),
//             ],
//           ),
//           child: AppBar(
//             leadingWidth: 75,
//             leading: const Icon(Icons.arrow_back),
//             toolbarHeight: 67,
//             titleSpacing: -15,
//             title: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 5),
//               child: Text(
//                 'AI Interview',
//                 style: GoogleFonts.poppins(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w400,
//                 ),
//               ),
//             ),
//             backgroundColor: Colors.white,
//             surfaceTintColor: Colors.transparent,
//             shadowColor: const Color.fromRGBO(0, 0, 0, 1),
//             scrolledUnderElevation: 1,
//             elevation: 0,
//           ),
//         ),
//       ),
//         body: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
//             child: Column(
//               children: [
//                 _buildQuestionHeader(),
//                 const SizedBox(height: 10),
//                 _buildQuestionCard(),
//                 const SizedBox(height: 10),
//                 _buildAnswerCard(),
//                 const SizedBox(height: 10),
//                 _buildQuestionHeader1(),
//                 const SizedBox(height: 10,),
//                 _buildQuestionCard(),
//                 const SizedBox(height: 10),
//                 _buildAnswerCard(),
//                 const SizedBox(height: 10),// Adjusted space for layout
//               ],
//             ),
//           ),
//         ),
//         bottomNavigationBar: _buildBottomSection(),
//       ),
//     );
//   }

//   Widget _buildQuestionHeader() {
//     return Align(
//       alignment: Alignment.centerLeft,
//       child: Text(
//         'Question 1 of 6',
//         style: GoogleFonts.poppins(
//           fontSize: 10.55,
//           fontWeight: FontWeight.w500,
//           letterSpacing: -0.2,
//           color: const Color(0xff1c6cff),
//         ),
//       ),
//     );
//   }

//   Widget _buildQuestionHeader1() {
//     return Align(
//       alignment: Alignment.centerLeft,
//       child: Text(
//         'Question 2 of 6',
//         style: GoogleFonts.poppins(
//           fontSize: 10.55,
//           fontWeight: FontWeight.w500,
//           letterSpacing: -0.2,
//           color: const Color(0xff1c6cff),
//         ),
//       ),
//     );
//   }

//   Widget _buildQuestionCard() {
//     return Container(
//       height: 190,
//       width: 300,
//       decoration: const BoxDecoration(
//         borderRadius: BorderRadius.all(Radius.circular(11)),
//         gradient: LinearGradient(
//           colors: [
//             Color.fromRGBO(31, 255, 154, 0.09),
//             Color.fromRGBO(30, 227, 255, 0.09),
//           ],
//         ),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(18.0),
//             child: Text(
//               'Tell me about the design process which is being used in every product for making UI/UX?',
//               style: GoogleFonts.poppins(
//                 fontSize: 13,
//                 fontWeight: FontWeight.w700,
//                 color: const Color(0xff373737),
//               ),
//             ),
//           ),
//           const Divider(
//             color: Color(0xff8a8a8a),
//             thickness: 0.54,
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//             child: Row(
//               children: [
//                 _buildIcon(),
//                 const Spacer(),
//                 _buildAIAnswerButton(),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildAnswerCard() {
//     return Padding(
//       padding: const EdgeInsets.only(left: 60),
//       child: Container(
//         height: 210,
//         width: 245,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//           gradient: const LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [
//               Color.fromRGBO(30, 227, 255, 0.296),
//               Color.fromRGBO(31, 255, 154, 0.4),
//             ],
//           ),
//         ),
//         child: Container(
//           margin: const EdgeInsets.all(1), // Creates the illusion of a border
//           decoration: BoxDecoration(
//             color: const Color.fromRGBO(255, 255, 255, 1), // Inner container color
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(18.0),
//                 child: Column(
//                   children: [
//                     Text(
//                       textAlign: TextAlign.start,
//                       'I’m Kanak wagh,',
//                       style: GoogleFonts.poppins(
//                         fontSize: 12,
//                         fontWeight: FontWeight.w400,
//                         color: const Color(0xff363636),
//                       ),
//                     ),
//                     const SizedBox(height: 5,),
//                     Text(
//                       'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation',
//                       style: GoogleFonts.poppins(
//                         fontSize: 12,
//                         fontWeight: FontWeight.w400,
//                         color: const Color(0xff363636),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildIcon() {
//     return Stack(
//       alignment: Alignment.center,
//       children: [
//         Container(
//           width: 30.0,
//           height: 30.0,
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//               colors: [
//                 Color.fromRGBO(30, 227, 255, 0.7),
//                 Color.fromRGBO(31, 255, 154, 0.6),
//               ],
//             ),
//             shape: BoxShape.circle,
//           ),
//         ),
//         IconButton(
//           onPressed: () {},
//           icon: SvgPicture.asset(
//             'assets/img/Vector.svg',
//             height: 15,
//             width: 15,
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildAIAnswerButton() {
//     return ShaderMask(
//       shaderCallback: (bounds) => const LinearGradient(
//         colors: [Color(0xff20d3ed), Color(0xff18d480)],
//         tileMode: TileMode.clamp,
//       ).createShader(bounds),
//       child: Text(
//         'Get AI Answer',
//         textAlign: TextAlign.right,
//         style: GoogleFonts.poppins(
//           fontSize: 12,
//           fontWeight: FontWeight.w500,
//           color: Colors.white,
//         ),
//       ),
//     );
//   }

//   Widget _buildBottomSection() {
//     return Container(
//       height: 80,
//       decoration: const BoxDecoration(
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(30),
//           topRight: Radius.circular(30),
//         ),
//         color: Color(0xFFFFFFFF),
//         boxShadow: [
//           BoxShadow(
//             color: Color.fromRGBO(28, 108, 255, 0.35),
//             offset: Offset(0, 4),
//             blurRadius: 20,
//             spreadRadius: 0,
//           ),
//         ],
//       ),
//       child: Column(
//         children: [
//           // SizedBox(height:40 ,),
//           // _buildMicButton(),
//           // Text(
//           //   'Tap to Speak',
//           //   style: GoogleFonts.poppins(
//           //     fontSize: 12,
//           //     fontWeight: FontWeight.w400,
//           //     color: const Color(0xff000000),
//           //   ),
//           // ),
//           // const Spacer(),
//           _inputTextField(),
//         ],
//       ),
//     );
//   }

//   Widget _buildMicButton() {
//     return Stack(
//       children: [
//         Container(
//           width: 100.0,
//           height: 100.0,
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//               colors: [
//                 Color.fromRGBO(30, 227, 255, 0.16),
//                 Color.fromRGBO(31, 255, 154, 0.16),
//               ],
//             ),
//             shape: BoxShape.circle,
//           ),
//         ),
//         Positioned(
//           top: 1,
//           bottom: 1,
//           left: 6,
//           child: Container(
//             width: 88.0,
//             height: 88.0,
//             decoration: const BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [
//                   Color.fromRGBO(30, 227, 255, 0.4),
//                   Color.fromRGBO(31, 255, 154, 0.4),
//                 ],
//               ),
//               shape: BoxShape.circle,
//             ),
//           ),
//         ),
//         Positioned(
//           top: 2,
//           bottom: 2,
//           left: 15,
//           child: Container(
//             width: 68.0,
//             height: 68.0,
//             decoration: const BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [
//                   Color.fromRGBO(30, 227, 255, 0.7),
//                   Color.fromRGBO(31, 255, 154, 0.6),
//                 ],
//               ),
//               shape: BoxShape.circle,
//             ),
//           ),
//         ),
//         Positioned(
//           top: 15,
//           bottom: 15,
//           left: 22,
//           child: IconButton(
//             onPressed: () {},
//             icon: const Icon(Icons.mic_none),
//             color: Colors.black,
//             iconSize: 40,
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _inputTextField() {
//     return Padding(
//       padding: const EdgeInsets.all(10.0),
//       child: Column(
//         children: [
//           Row(
//             children: [
//               Expanded(
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: const BorderRadius.all(Radius.circular(12)),
//                     border: Border.all(color: const Color(0xffF4F6F9), width: 1),
//                     boxShadow: const [
//                       BoxShadow(
//                         color: Color.fromRGBO(208, 225, 255, 0.29),
//                         offset: Offset(0, 4),
//                         blurRadius: 4,
//                         spreadRadius: 0,
//                       ),
//                     ],
//                   ),
//                   padding: const EdgeInsets.symmetric(horizontal: 10),
//                   child: TextField(
//                     controller: _controller,
//                     decoration: InputDecoration(
//                       suffixIcon: IconButton(
//                         onPressed: () {

//                         },
//                         icon: const Icon(Icons.send, color: Color(0xff1568ff)),
//                       ),
//                       filled: true,
//                       fillColor: const Color(0xffffffff),
//                       hintText: 'Type your message...',
//                       hintStyle: GoogleFonts.poppins(
//                         fontSize: 12,
//                         fontWeight: FontWeight.w400,
//                         color: const Color(0xffbebebe),
//                       ),
//                       border: InputBorder.none, // Remove underline
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                   width: 8), // Add some spacing between input and mic button
//               Stack(
//                 children: [
//                   Container(
//                     width: 50.0,
//                     height: 50.0,
//                     decoration: const BoxDecoration(
//                       gradient: LinearGradient(
//                         colors: [
//                           Color.fromRGBO(30, 227, 255, 0.3),
//                           Color.fromRGBO(31, 255, 154, 0.3),
//                         ],
//                       ),
//                       shape: BoxShape.circle,
//                     ),
//                   ),
//                   Positioned(
//                     top: 3,
//                     left: 2,
//                     child: IconButton(
//                       onPressed: () {},
//                       icon: const Icon(Icons.mic_none),
//                       color: Colors.black,
//                       iconSize: 30,
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class ChatInterviewQue extends StatefulWidget {
  const ChatInterviewQue({super.key});

  @override
  State<ChatInterviewQue> createState() => _ChatInterviewQueState();
}

class _ChatInterviewQueState extends State<ChatInterviewQue> {
  final TextEditingController _controller = TextEditingController();
  late final GenerativeModel _model;
  late final ChatSession _chatSession;
  List<String> messages = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _model = GenerativeModel(
        model: 'gemini-pro',
        apiKey:
            'AIzaSyCl0UzxP4AdQzQdsPg1ohebzoH7EzQ712A' // Replace with your actual API Key
        );
    _chatSession = _model.startChat();
          messages.add('AI HR Marie: Tell me about the design process which is being used in every product for making UI/UX?',);
 
  }
Future<void> _sendMessage() async {
  if (_controller.text.isEmpty) return;

  setState(() {
    messages.add('You: ${_controller.text}');
    _isLoading = true;
  });

  try {
    // Create the prompt from the user input
    var prompt = _controller.text;

    // Instantiate the GenerativeModel with your API key and model name
    final model = GenerativeModel(
      model: 'gemini-1.5-flash',
      apiKey: "AIzaSyCl0UzxP4AdQzQdsPg1ohebzoH7EzQ712A",
    );

    // Generate content using the user input as the prompt
    final response = await model.generateContent([Content.text(prompt)]);

    // Display the AI's response in the UI
    setState(() {
      messages.add('AI HR Marie: ${response.text}'); // Use 'response.text' to display AI's response
      _controller.clear();
    });
  } catch (e) {
    setState(() {
      messages.add('Error: ${e.toString()}'); // Correct the error message display
    });
  } finally {
    setState(() {
      _isLoading = false; // Ensure the loading state is reset
    });
  }
}

 @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(67),
          child: Container(
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
              leading: const Icon(Icons.arrow_back),
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
              surfaceTintColor: Colors.transparent,
              shadowColor: const Color.fromRGBO(0, 0, 0, 1),
              scrolledUnderElevation: 1,
              elevation: 0,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: Column(
              children: [
                _buildMessageList(),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
        bottomNavigationBar: _buildBottomSection(),
      ),
    );
  }

  Widget _buildMessageList() {
    return ListView.builder(
      shrinkWrap: true, // Makes ListView not scrollable
      physics: const NeverScrollableScrollPhysics(), // Disable inner scrolling
      itemCount: messages.length,
      itemBuilder: (context, index) {
        return Align(
          alignment: messages[index].startsWith('You:')
              ? Alignment.centerRight
              : Alignment.centerLeft,
          child: Container(

            margin: const EdgeInsets.symmetric(vertical: 5),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [
            Color.fromRGBO(31, 255, 154, 1),
            Color.fromRGBO(30, 227, 255, 1),
          ]),
          borderRadius: BorderRadius.circular(22.5),
        ),
            child: Text(
              messages[index],
              style: GoogleFonts.poppins(
                  fontSize:  messages[index].startsWith('You:')
                  ?12:14, fontWeight:messages[index].startsWith('You:')
                  ?FontWeight.w500: FontWeight.w800),
            ),
          ),
        );
      },
    );
  }

  Widget _buildBottomSection() {
    return Container(
      height: 80,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        color: Color(0xFFFFFFFF),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(28, 108, 255, 0.35),
            offset: Offset(0, 4),
            blurRadius: 20,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        children: [
          _inputTextField(),
        ],
      ),
    );
  }

  Widget _inputTextField() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    border:
                        Border.all(color: const Color(0xffF4F6F9), width: 1),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromRGBO(208, 225, 255, 0.29),
                        offset: Offset(0, 4),
                        blurRadius: 4,
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    controller: _controller,
                    
                    decoration: InputDecoration(
                      suffixIcon: (_isLoading)?CircularProgressIndicator():IconButton(
                        onPressed: _sendMessage,
                        icon: const Icon(Icons.send, color: Color(0xff1568ff)),
                      ),
                      filled: true,
                      fillColor: const Color(0xffffffff),
                      hintText: 'Type your message...',
                      hintStyle: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xffbebebe),
                      ),
                      border: InputBorder.none, // Remove underline
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
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
                      onPressed: () {},
                      icon: const Icon(Icons.mic_none),
                      color: Colors.black,
                      iconSize: 30,
                    ),
                  ),
                ],
              ),
            ],
          ),
          
        ],
      ),
    );
  }
}
