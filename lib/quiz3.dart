import 'package:flutter/material.dart';
import 'package:flutter_application_4/result.dart';
import 'package:google_fonts/google_fonts.dart';

class Quiz3 extends StatefulWidget {
  final String name;
  final int correctAnswers;
  const Quiz3({
    super.key,
    required this.name,
    required this.correctAnswers,
  });

  @override
  _Quiz3State createState() => _Quiz3State();
}

class _Quiz3State extends State<Quiz3> {
  final List<String> answers = [
    "5,6",
    "9,3",
    "2,4",
    "0,1",
  ];

  final int correctAnswerIndex = 3;

  int selectedAnswerIndex = 0;

  void _handleAnswerTap(int index) {
    setState(() {
      selectedAnswerIndex = index;
    });
  }

  void _nextQuiz() {
    int updatedScore = widget.correctAnswers;

    if (selectedAnswerIndex == correctAnswerIndex) {
      updatedScore += 1;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultScreen(
          userName: widget.name,
          correctAnswers: updatedScore,
          totalQuestions: 3,
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
                          "Which of the following is referred to as binary code?",
                          style: GoogleFonts.poppins(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          "3/3",
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
