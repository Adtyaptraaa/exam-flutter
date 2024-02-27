import 'package:flutter/material.dart';
import 'dart:ui';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/mushokuTensei.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.only(top: 80, bottom: 0) +
                      const EdgeInsets.all(20),
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
                            color: Colors.white,
                            backgroundColor: Color(0xFF166EDA),
                          ),
                        ),
                        TextSpan(text: 'and '),
                        TextSpan(
                          text: 'Imagination',
                          style: TextStyle(
                            backgroundColor: Color(0xFF166EDA),
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(236, 250, 250, 250),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(10) +
                          const EdgeInsets.only(top: 20),
                      child: Column(
                        children: [
                          Text(
                            'Sign In',
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              color: Color(0xFF166EDA),
                              fontSize: 30,
                            ),
                          ),
                          SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              children: [
                                TextFormField(
                                  decoration:
                                      InputDecoration(labelText: 'Email'),
                                ),
                                SizedBox(height: 10),
                                TextFormField(
                                  decoration:
                                      InputDecoration(labelText: 'Password'),
                                  obscureText: true,
                                ),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    Checkbox(
                                      value: isChecked,
                                      onChanged: (value) {
                                        setState(() {
                                          isChecked = value!;
                                        });
                                      },
                                    ),
                                    Text("I agree to the terms and conditions"),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: BackdropFilter(
                                filter:
                                    ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Color(0xFF166EDA),
                                    minimumSize: Size(340, 55),
                                  ),
                                  onPressed: () {},
                                  child: Text(
                                    'Sign In',
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
