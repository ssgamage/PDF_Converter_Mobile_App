import 'package:flutter/material.dart';
import 'package:flutter_pdf_converter/Screen/Dashbord/HomeScreen.dart';
import 'package:flutter_pdf_converter/Screen/IntroPageOne.dart';
import 'package:flutter_pdf_converter/Screen/IntroPageThree.dart';
import 'package:flutter_pdf_converter/Screen/IntroPageTwo.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WellcomeScreen extends StatefulWidget {
  const WellcomeScreen({super.key});

  @override
  _WellcomeScreenState createState() => _WellcomeScreenState();
}

class _WellcomeScreenState extends State<WellcomeScreen> {
  //control page smooth indicator
  final PageController _controller = PageController();
  //if user in last page in smooth indicator
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          controller: _controller,
          onPageChanged: (index) {
            setState(() {
              onLastPage = (index == 2);
            });
          },
          children: const [
            Intropageone(),
            Intropagetwo(),
            Intropagethree(),
          ],
        ),
        // dot indicatoradd
        Container(
            // dot indicator position change
            alignment: const Alignment(0, 0.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //skip
                GestureDetector(
                  onTap: () {
                    _controller.jumpToPage(2);
                  },
                  child: const Text(
                    'skip',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 32, 37, 86)),
                  ),
                ),
                SmoothPageIndicator(controller: _controller, count: 3),

                //next
                onLastPage
                    ? GestureDetector(
                        onTap: () {
                          //navigate to next screen
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return const HomeScreen(
                                title: '',
                              );
                            }),
                          );
                        },
                        child: const Text(
                          'Done',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 32, 37, 86)),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          _controller.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                        },
                        child: const Text(
                          'Next',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 32, 37, 86)),
                        ),
                      ),
              ],
            )),
      ],
    ));
  }
}
