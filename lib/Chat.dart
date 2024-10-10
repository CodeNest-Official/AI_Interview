// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final TextEditingController _controller = TextEditingController();
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
        body: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(20),
                children: [
                  _buildUserMessage(),
                  const SizedBox(height: 20),
                  _buildAnswerCard(),
                  const SizedBox(height: 20),
                  _buildUserMessage(),
                  const SizedBox(height: 20),
                  _buildAnswerCard(),
                ],
              ),
            ),
            _inputTextField(),
          ],
        ),
      ),
    );
  }

  Widget _buildUserMessage() {
    return Row(
      children: [
        const SizedBox(width: 10),
        const CircleAvatar(
          radius: 25,
          backgroundImage: AssetImage('assets/img/ai.png'),
          backgroundColor: Color(0xffd9d9d9),
        ),
        const SizedBox(width: 20),
        _buildMessageContainer(
          title: 'Hi, Kanak Wagh,',
          subtitle: 'Tell me about yourself?',
        ),
      ],
    );
  }

  Widget _buildMessageContainer(
      {required String title, required String subtitle}) {
    return Container(
      height: 65,
      width: 200,
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [
          Color.fromRGBO(31, 255, 154, 0.21),
          Color.fromRGBO(30, 227, 255, 0.21),
        ]),
        borderRadius: BorderRadius.circular(11),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              textAlign: TextAlign.start,
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: const Color.fromRGBO(54, 54, 54, 1),
              ),
            ),
            Text(
              subtitle,
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: const Color.fromRGBO(54, 54, 54, 1),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnswerCard() {
    return Padding(
      padding: const EdgeInsets.only(left: 60),
      child: Container(
        height: 185,
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(30, 227, 255, 0.296),
              Color.fromRGBO(31, 255, 154, 0.4),
            ],
          ),
        ),
        child: Container(
          margin: const EdgeInsets.all(1),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(255, 255, 255, 1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'I’m Kanak Wagh,',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff363636),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff363636),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
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
                    border: Border.all(color: const Color(0xffF4F6F9), width: 1),
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
                      suffixIcon: IconButton(
                        onPressed: () {},
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
              const SizedBox(
                  width: 8), // Add some spacing between input and mic button
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
