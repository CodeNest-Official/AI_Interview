// ignore_for_file: file_names

import 'package:ai_project/FinalUi.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatInterHome extends StatefulWidget {
  const ChatInterHome({super.key});

  @override
  State<ChatInterHome> createState() => _ChatInterHomeState();
}

class _ChatInterHomeState extends State<ChatInterHome> {
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
          child: Column(
            children: [
              _buildUserProfile(),
              _buildInfoContainer(),
              _buildGradientButton(
                context: context,
                label: 'Start Interview',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  const Finalui(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
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
      elevation: 0,
      bottom: const PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: SizedBox(height: 0),
      ),
    );
  }

  Widget _buildUserProfile() {
    return Row(
      children: [
        const SizedBox(width: 10),
        const CircleAvatar(
          radius: 22,
          backgroundImage: AssetImage('assets/img/ai.png'),
          backgroundColor: Color(0xffd9d9d9),
        ),
        const SizedBox(width: 20),
        Text(
          'AI HR Marie',
          style: GoogleFonts.poppins(
            fontSize: 13.12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildInfoContainer() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Container(
        height: 200,
        width: 300,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(11)),
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(31, 255, 154, 0.09),
              Color.fromRGBO(30, 227, 255, 0.09),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hi, Kanak Wagh,',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff363636),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'For getting more accurate job match we are here to help you.',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff575757),
                ),
              ),
              const SizedBox(height: 2),
              Text(
                'With the help of our AI HR, you can search any interview questions and get the perfect answer in perfect format.',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(87, 87, 87, 1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGradientButton({
    required BuildContext context,
    required String label,
    required VoidCallback onPressed,
  }) {
    return Center(
      child: Container(
        height: 45,
        width: 275,
        decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [
            Color.fromRGBO(31, 255, 154, 1),
            Color.fromRGBO(30, 227, 255, 1),
          ]),
          borderRadius: BorderRadius.circular(22.5),
        ),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            padding: EdgeInsets.zero,
          ),
          child: Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 13.12,
              fontWeight: FontWeight.w500,
              color: const Color(0xff000000),
              letterSpacing: -0.2,
            ),
          ),
        ),
      ),
    );
  }
}
