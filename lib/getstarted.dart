import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GetStartedPage(),
    );
  }
}

class GetStartedPage extends StatefulWidget {
  @override
  _GetStartedPageState createState() => _GetStartedPageState();
}

class _GetStartedPageState extends State<GetStartedPage> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            children: [
              Slide(
                title: 'Choose Product',
                description:
                    'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.',
                controller: _controller,
                svgAssetPath:
                    'assets/images/slide1.svg', // Contoh path gambar SVG
              ),
              Slide(
                title: 'Make Payment',
                description:
                    'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.',
                controller: _controller,
                svgAssetPath:
                    'assets/images/slide2.svg', // Contoh path gambar SVG
              ),
              Slide(
                title: 'Get Your Order',
                description:
                    'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.',
                controller: _controller,
                svgAssetPath:
                    'assets/images/slide3.svg', // Contoh path gambar SVG
              ),
            ],
          ),
          Positioned(
            top: 20,
            left: 20,
            child: RichText(
              text: TextSpan(
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
                children: [
                  TextSpan(
                    text: '${_currentPage + 1}',
                  ),
                  TextSpan(
                    text: '/3',
                    style: TextStyle(
                      color: Colors.grey, // Warna abu-abu untuk /3
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 20,
            right: 10,
            child: TextButton(
              onPressed: () {
                _controller.animateToPage(
                  2,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.ease,
                );
              },
              child: Text(
                'Skip',
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: 'Montserrat',
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.2, // Letter spacing yang lebih lebar
                ),
              ),
            ),
          ),
          // Bagian indikator titik di bawah tengah
          Padding(
            padding: EdgeInsets.only(bottom: 30),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: FractionallySizedBox(
                widthFactor: 0.5, // Menggunakan setengah dari lebar layar
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    3,
                    (index) => AnimatedContainer(
                      duration: Duration(milliseconds: 300), // Durasi animasi
                      curve: Curves.easeInOut, // Kurva animasi
                      margin: EdgeInsets.only(right: 10),
                      width: _currentPage == index
                          ? 30
                          : 10, // Lebar titik disesuaikan
                      height: 10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            5), // Atur radius untuk membuat sudut bulat
                        color: _currentPage == index
                            ? Color.fromARGB(255, 0, 0, 0)
                            : Color(0xFFA8A8A9),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          Positioned(
            bottom: 20,
            right: 10,
            child: _currentPage == 2
                ? TextButton(
                    onPressed: () {
                      // Action ketika tombol Get Started ditekan
                      print('Get Started pressed');
                    },
                    child: Text(
                      'Get Started',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 22,
                        color: Color(0xFFF83758),
                        fontWeight: FontWeight.w500,
                        letterSpacing: -1, // Letter spacing yang lebih lebar
                      ),
                    ),
                  )
                : TextButton(
                    onPressed: () {
                      _controller.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                    },
                    child: Text(
                      'Next',
                      style: TextStyle(
                        fontSize: 22,
                        fontFamily: 'Montserrat',
                        color: Color(0xFFF83758),
                        fontWeight: FontWeight.w500,
                        letterSpacing: -1, // Letter spacing yang lebih lebar
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

class Slide extends StatelessWidget {
  final String title;
  final String description;
  final bool isLast;
  final PageController controller;
  final String svgAssetPath;

  Slide({
    required this.title,
    required this.description,
    required this.controller,
    this.isLast = false,
    required this.svgAssetPath,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      svgAssetPath,
                      width: 400,
                      height: 350,
                    ),
                    SizedBox(height: 0),
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w900,
                        fontFamily: 'Montserrat',
                        letterSpacing: -1, // Letter spacing yang lebih lebar
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        description,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFFA8A8A9),
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Montserrat',
                          height: 1.7, // Letter spacing yang lebih lebar
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        if (!isLast)
          Positioned(
            bottom: 20,
            left: 10,
            child: TextButton(
              onPressed: () {
                controller.previousPage(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.ease,
                );
              },
              child: Text(
                'Prev',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 22,
                  color: Color(0xFFC4C4C4),
                  fontWeight: FontWeight.w500,
                  letterSpacing: -1, // Letter spacing yang lebih lebar
                ),
              ),
            ),
          ),
      ],
    );
  }
}
