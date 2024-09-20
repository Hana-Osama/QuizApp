import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'quiz2.dart';

class Quiz1 extends StatefulWidget {
  final String name;

  Quiz1({
    super.key,
    required this.name,
  });

  @override
  _Quiz1State createState() => _Quiz1State();
}

class _Quiz1State extends State<Quiz1> {
  final List<String> answers = [
    "Byte",
    "Kilobyte",
    "Bit",
    "Terabyte",
  ];

  final int correctAnswerIndex = 2;
  int selectedAnswerIndex = 0;

  int correctAnswers = 0;
  void _handleAnswerTap(int index) {
    setState(() {
      selectedAnswerIndex = index;
    });
  }

  void _nextQuiz() {
    setState(() {
      if (selectedAnswerIndex == correctAnswerIndex) {
        correctAnswers += 1;
        // } else {
        //   correctAnswers -= 1;
      }
    });

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Quiz2(
          name: widget.name,
          correctAnswers: correctAnswers,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F0F0),
      appBar: AppBar(
        backgroundColor: Colors.grey,
        elevation: 0,
        title: Text('QUIZ', style: GoogleFonts.poppins(color: Colors.white)),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/Ellipse 1.png',
                height: 130,
              ),
              const SizedBox(height: 20.0),
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 165, 209, 114),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "The smallest unit of data ?",
                          style: GoogleFonts.poppins(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          "1/3",
                          style: GoogleFonts.poppins(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    Column(
                      children: answers.map((answer) {
                        int index = answers.indexOf(answer);
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: GestureDetector(
                            onTap: () => _handleAnswerTap(index),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: selectedAnswerIndex == index
                                      ? Colors.green
                                      : Colors.grey,
                                ),
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              child: ListTile(
                                title: Text(
                                  answer,
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                    fontSize: 16.0,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 20.0),
                    ElevatedButton(
                      onPressed: _nextQuiz,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 50.0,
                          vertical: 15.0,
                        ),
                      ),
                      child: Text(
                        'NEXT',
                        style: GoogleFonts.poppins(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
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
}
