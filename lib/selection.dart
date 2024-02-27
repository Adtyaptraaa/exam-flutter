import 'package:flutter/material.dart';
import 'dart:ui';
import 'signup.dart';
import 'login.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SelectionPage(),
    );
  }
}

class SelectionPage extends StatelessWidget {
  const SelectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white, // Set background color to white
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  'assets/images/mushokuTensei.jpg'), // Background image path
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(20),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 24,
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(text: 'Dive into the realm of '),
                        TextSpan(
                          text: 'Creativity ',
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            backgroundColor: Color(0xFF166EDA),
                          ),
                        ),
                        TextSpan(text: 'and '),
                        TextSpan(
                          text: 'Imagination',
                          style: TextStyle(
                            backgroundColor: Color(0xFF166EDA),
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.all(10) + const EdgeInsets.only(top: 60),
                  child: Text.rich(
                    TextSpan(
                      text: 'Start your ',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontSize: 18,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Journey',
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            backgroundColor: Color(0xFF166EDA),
                          ),
                        ),
                        TextSpan(text: ' now.'),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(
                      top: 20, bottom: 5, left: 20, right: 20),
                  child: FilledButton(
                    style: FilledButton.styleFrom(
                      backgroundColor: Color(0xFF166EDA),
                      shape: const ContinuousRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      minimumSize: const Size(340, 55),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    child: const Text(
                      'Sign In',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.circular(0), // Adjust the border radius
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                          sigmaX: 10, sigmaY: 10), // Adjust the blur intensity
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(
                            color: Color(0xFF166EDA), // Border color
                            width: 1, // Border width
                          ),
                          minimumSize: const Size(340, 55),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpPage()),
                          );
                        },
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF166EDA), // Text color
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// Widget FilledButton is not defined, please define it as per your requirements
