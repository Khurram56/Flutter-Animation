

import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 7, 10, 46), // Set background color to dark blue
      ),
      debugShowCheckedModeBanner: false,
      home: const MyAnimationScreen(),
    );
  }
}

class MyAnimationScreen extends StatefulWidget {
  const MyAnimationScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyAnimationScreenState createState() => _MyAnimationScreenState();
}

class _MyAnimationScreenState extends State<MyAnimationScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _leftBoxAnimation;
  late Animation<double> _rightBoxAnimation;
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      // duration: const Duration(seconds: 1),
      duration: const Duration(seconds: 2), // Duration in milliseconds

      vsync: this,
    );

    _leftBoxAnimation = Tween<double>(begin: -150, end: 20).animate(_controller);
    _rightBoxAnimation =
        Tween<double>(begin: -150, end: 20).animate(_controller);

    _controller.addListener(() {
      setState(() {}); 
      _confettiController.play(); 
    });

    _controller.forward();

    _confettiController = ConfettiController(duration: const Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  left: _leftBoxAnimation.value,
                  child: Container(
                    width: 150,
                    height: 100,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [  Color.fromARGB(255, 54, 2, 63), Colors.purple],
                        begin: Alignment.topLeft,
                        end: Alignment(0.5, 0.1),
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(0), 
                        bottomLeft: Radius.circular(5), 
                        topRight: Radius.circular(50), 
                        bottomRight: Radius.circular(10), 
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Center(
                        child: Align(
                          alignment: Alignment.centerRight, 


//*********************************chnage this 11.png to your acctual image , firlsty plcae it in assets folder************//

                          child: Image.asset(
                            'assets/11.png', // Replace with your image asset
                            width: 50,
                            height: 50,
                          ),

//*********************************chnage this 11.png to your acctual image , firlsty plcae it in assets folder************//

                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: _rightBoxAnimation.value,
                  child: Container(
                    width: 150,
                    height: 100,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [ Colors.yellow, Color.fromARGB(255, 151, 136, 3)],
                        begin: Alignment.center,
                        end: Alignment(0.5, 0.1),
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50), 
                        bottomLeft: Radius.circular(10), 
                        topRight: Radius.circular(0), 
                        bottomRight: Radius.circular(5), 
                      ), // Rounded edges
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Center(
                        child: Align(
                          alignment: Alignment.centerLeft,

//*********************************chnage this 11.png to your acctual image , firlsty plcae it in assets folder************//

                          child: Image.asset(
                            'assets/22.png', // Replace with your image asset
                            width: 50,
                            height: 50,
                          ),
                          
//*********************************chnage this 11.png to your acctual image , firlsty plcae it in assets folder************//

                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height / 2 - 50, // Adjust top position to center vertically
                  left: MediaQuery.of(context).size.width / 2 - 50, // Adjust left position to center horizontally
                  child: Image.asset(
                    'assets/vs.png',
                    width: 100,
                    height: 100,
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: ConfettiWidget(
                    confettiController: _confettiController,
                    blastDirectionality: BlastDirectionality.explosive,
                    shouldLoop: true,
                    colors: const [Colors.green, Colors.blue, Colors.pink, Colors.orange, Colors.purple, Colors.yellow],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _confettiController.dispose();
    super.dispose();
  }
}
